import 'package:agro_picker_bloc/constants/firebase_interface.dart';
import 'package:agro_picker_bloc/models/models.dart';
import 'package:agro_picker_bloc/singletons/singletons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductStockRepository {
  final FirebaseInterface db = FirebaseInterface();
  final Users user = UserStatusSingleton.getInstance().user;

  Stream<QuerySnapshot> getStockBySearch(String searchKey) {
    List<FirebaseQueryParameter> param = [
      FirebaseQueryParameter(
          fieldName: 'venderId',
          fieldValue: user.userId,
          queryMethod: QueryMethod.isEqualTo),
      FirebaseQueryParameter(
          fieldName: 'product.name',
          fieldValue: searchKey,
          queryMethod: QueryMethod.isGreaterThanOrEqualTo),
      FirebaseQueryParameter(
          fieldName: 'product.name',
          fieldValue: searchKey + 'z',
          queryMethod: QueryMethod.isLessThan),
    ];

    return db.getQueryObject<ProductStores>(param);
  }

  Stream<QuerySnapshot> getAllStocks() {
    List<FirebaseQueryParameter> param = [
      FirebaseQueryParameter(
          fieldName: 'venderId',
          fieldValue: user.userId,
          queryMethod: QueryMethod.isEqualTo),
    ];

    return db.getQueryObject<ProductStores>(param);
  }

  Future<bool> insertStock(ProductStores stock) async {
    try {
      await db.insertDocumentData<ProductStores>(stock.toJson(), stock.storeId);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateStock(
      Map<dynamic, dynamic> updateItem, String stockId) async {
    try {
      await db.updateData<ProductStores>(updateItem, stockId);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteStock(String stockId) async {
    try {
      await db.deleteData<ProductStores>(stockId);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> updateProducerStatus(bool isOnline) async {
    FirebaseQueryParameter firebaseQueryParameter =
        FirebaseQueryParameter(fieldName: 'venderId', fieldValue: user.userId);
    Map<String, dynamic> updateValue = {'isVenderOnline': isOnline};
    await db.runTransaction<ProductStores>(firebaseQueryParameter, updateValue);
  }
}
