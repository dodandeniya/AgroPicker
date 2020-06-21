import 'package:agro_picker_bloc/constants/firebase_interface.dart';
import 'package:agro_picker_bloc/models/models.dart';
import 'package:agro_picker_bloc/singletons/singletons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderRepository {
  final FirebaseInterface db = FirebaseInterface();
  final Users user = UserStatusSingleton.getInstance().user;

  Stream<QuerySnapshot> getOrdersBySearch(String searchKey) {
    List<FirebaseQueryParameter> param = [
      FirebaseQueryParameter(
          fieldName: 'venderId',
          fieldValue: user.userId,
          queryMethod: QueryMethod.isEqualTo),
      FirebaseQueryParameter(
          fieldName: 'orderItem.name',
          fieldValue: searchKey,
          queryMethod: QueryMethod.isGreaterThanOrEqualTo),
      FirebaseQueryParameter(
          fieldName: 'orderItem.name',
          fieldValue: searchKey + 'z',
          queryMethod: QueryMethod.isLessThan),
    ];

    return db.getQueryObject<Orders>(param);
  }

  Stream<QuerySnapshot> getAllOrders() {
    List<FirebaseQueryParameter> param = [
      FirebaseQueryParameter(
          fieldName: 'venderId',
          fieldValue: user.userId,
          queryMethod: QueryMethod.isEqualTo),
      FirebaseQueryParameter(
          fieldName: 'orderDateTime',
          queryMethod: QueryMethod.orderByDescending),
    ];

    return db.getQueryObject<Orders>(param);
  }

  Stream<QuerySnapshot> getOrdersBySearchforConsumer(String searchKey) {
    List<FirebaseQueryParameter> param = [
      FirebaseQueryParameter(
          fieldName: 'consumerId',
          fieldValue: user.userId,
          queryMethod: QueryMethod.isEqualTo),
      FirebaseQueryParameter(
          fieldName: 'orderItem.name',
          fieldValue: searchKey,
          queryMethod: QueryMethod.isGreaterThanOrEqualTo),
      FirebaseQueryParameter(
          fieldName: 'orderItem.name',
          fieldValue: searchKey + 'z',
          queryMethod: QueryMethod.isLessThan),
    ];

    return db.getQueryObject<Orders>(param);
  }

  Stream<QuerySnapshot> getAllOrdersforConsumer() {
    List<FirebaseQueryParameter> param = [
      FirebaseQueryParameter(
          fieldName: 'consumerId',
          fieldValue: user.userId,
          queryMethod: QueryMethod.isEqualTo),
      FirebaseQueryParameter(
          fieldName: 'orderDateTime',
          queryMethod: QueryMethod.orderByDescending),
    ];

    return db.getQueryObject<Orders>(param);
  }

  Future<bool> insertOrder(Orders order) async {
    try {
      await db.insertDocumentData<Orders>(order.toJson(), order.orderId);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateOrder(
      Map<dynamic, dynamic> updateItem, String orderId) async {
    try {
      await db.updateData<Orders>(updateItem, orderId);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteOrder(String orderId) async {
    try {
      await db.deleteData<Orders>(orderId);
      return true;
    } catch (e) {
      return false;
    }
  }
}
