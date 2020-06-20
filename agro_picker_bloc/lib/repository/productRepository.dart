import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_bloc/constants/firebase_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository {
  final FirebaseInterface db = FirebaseInterface();

  Stream<QuerySnapshot> getAllProducts() {
    return db.getAll<Products>();
  }
}
