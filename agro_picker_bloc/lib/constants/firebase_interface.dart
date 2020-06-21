import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseInterface {
  static FirebaseAppSingleton _firebaseAppSingleton =
      FirebaseAppSingleton.getInstance();
  static Firestore firestore = _firebaseAppSingleton.firestore;
  List<DocumentSnapshot> documentList = [];

  Stream<QuerySnapshot> getAll<T>() {
    var className = T.toString();
    return firestore.collection(className).snapshots();
  }

  Stream<DocumentSnapshot> getObject<T>(String docId) {
    var className = T.toString();
    return firestore.collection(className).document(docId).snapshots();
  }

  Future<DocumentSnapshot> getDocumentById<T>(String docId) async {
    var className = T.toString();
    return await firestore.collection(className).document(docId).get();
  }

  Stream<QuerySnapshot> getQueryObject<T>(
      List<FirebaseQueryParameter> parameters) {
    var className = T.toString();
    Query collectionReference = firestore.collection(className);

    var arrayContainsArray = parameters
        .where((element) =>
            element.queryMethod == QueryMethod.arrayContainsAny ||
            element.queryMethod == QueryMethod.whereIn ||
            element.queryMethod == QueryMethod.isNull)
        .toList();

    /*if (arrayContainsArray.length > 0) {
      arrayContainsArray.forEach((element) {
        if (element.queryMethod == QueryMethod.arrayContainsAny) {
          if (!element.fieldValue.runtimeType is List) {
            throw ('arrayContainsAny should have List type as its FieldValue');
          }
        } else if (element.queryMethod == QueryMethod.whereIn) {
          if (!element.fieldValue.runtimeType is List) {
            throw ('whereIn should have List type as its FieldValue');
          }
        } else if (element.queryMethod == QueryMethod.isNull) {
          if (!element.fieldValue.runtimeType is bool) {
            throw ('isNull should have bool type as its FieldValue');
          }
        }
      });
    }*/

    parameters.forEach(
      (parameter) {
        if (parameter.queryMethod == QueryMethod.isEqualTo) {
          collectionReference = collectionReference.where(parameter.fieldName,
              isEqualTo: parameter.fieldValue);
        }
        if (parameter.queryMethod == QueryMethod.isLessThan) {
          collectionReference = collectionReference.where(parameter.fieldName,
              isLessThan: parameter.fieldValue);
        }
        if (parameter.queryMethod == QueryMethod.isLessThanOrEqualTo) {
          collectionReference = collectionReference.where(parameter.fieldName,
              isLessThanOrEqualTo: parameter.fieldValue);
        }
        if (parameter.queryMethod == QueryMethod.isGreaterThan) {
          collectionReference = collectionReference.where(parameter.fieldName,
              isGreaterThan: parameter.fieldValue);
        }
        if (parameter.queryMethod == QueryMethod.isGreaterThanOrEqualTo) {
          collectionReference = collectionReference.where(parameter.fieldName,
              isGreaterThanOrEqualTo: parameter.fieldValue);
        }
        if (parameter.queryMethod == QueryMethod.arrayContains) {
          collectionReference = collectionReference.where(parameter.fieldName,
              arrayContains: parameter.fieldValue);
        }
        if (parameter.queryMethod == QueryMethod.arrayContainsAny) {
          collectionReference = collectionReference.where(parameter.fieldName,
              arrayContainsAny: parameter.fieldValue);
        }
        if (parameter.queryMethod == QueryMethod.whereIn) {
          collectionReference = collectionReference.where(parameter.fieldName,
              whereIn: parameter.fieldValue);
        }
        if (parameter.queryMethod == QueryMethod.isNull) {
          collectionReference = collectionReference.where(parameter.fieldName,
              isNull: parameter.fieldValue);
        }
        if (parameter.queryMethod == QueryMethod.orderByAsscending) {
          collectionReference = collectionReference.orderBy(parameter.fieldName,
              descending: false);
        }
        if (parameter.queryMethod == QueryMethod.orderByDescending) {
          collectionReference = collectionReference.orderBy(parameter.fieldName,
              descending: true);
        }
      },
    );

    return collectionReference.snapshots();
  }

  Future<bool> checkDocumentExist<T>(String docID) async {
    var className = T.toString();
    bool exists = false;
    try {
      await _firebaseAppSingleton.firestore
          .collection(className)
          .document(docID)
          .get()
          .then((doc) {
        if (doc.exists)
          exists = true;
        else
          exists = false;
      });
      return exists;
    } catch (e) {
      return false;
    }
  }

  Future<DocumentReference> insertData<T>(
      Map<String, dynamic> insertValue) async {
    var className = T.toString();
    return await firestore.collection(className).add(insertValue);
  }

  Future<void> insertDocumentData<T>(
      Map<String, dynamic> insertValue, String documentId) async {
    var className = T.toString();
    return await firestore
        .collection(className)
        .document(documentId)
        .setData(insertValue);
  }

  Future<void> updateData<T>(
      Map<String, dynamic> updateValue, String docId) async {
    var className = T.toString();
    return await firestore
        .collection(className)
        .document(docId)
        .updateData(updateValue);
  }

  Future<void> deleteData<T>(String docId) async {
    var className = T.toString();
    return await firestore.collection(className).document(docId).delete();
  }

  Future<List<DocumentSnapshot>> getByCount<T>(int limit) async {
    var className = T.toString();
    CollectionReference collectionRef = firestore.collection(className);
    var newDocumentList = (await collectionRef
            .startAfterDocument(documentList[documentList.length - 1])
            .limit(limit)
            .getDocuments())
        .documents;
    documentList.addAll(newDocumentList);
    return documentList;
  }

  Future<void> runTransaction<T>(FirebaseQueryParameter firebaseQueryParameter,
      Map<String, dynamic> updateValue) async {
    firestore.runTransaction((transaction) async {
      var className = T.toString();
      final allDocs = await firestore
          .collection(className)
          .where(firebaseQueryParameter.fieldName,
              isEqualTo: firebaseQueryParameter.fieldValue)
          .getDocuments();

      final toBeRetrieved = allDocs.documents.toList();
      await Future.forEach(
          toBeRetrieved,
          (DocumentSnapshot snapshot) async =>
              await transaction.update(snapshot.reference, updateValue));
    });
  }
}

enum QueryMethod {
  isEqualTo,
  isLessThan,
  isLessThanOrEqualTo,
  isGreaterThan,
  isGreaterThanOrEqualTo,
  arrayContains,
  arrayContainsAny,
  whereIn,
  isNull,
  orderByAsscending,
  orderByDescending,
}

class FirebaseQueryParameter {
  final String fieldName;
  final dynamic fieldValue;
  final QueryMethod queryMethod;

  FirebaseQueryParameter({this.fieldName, this.fieldValue, this.queryMethod});
}
