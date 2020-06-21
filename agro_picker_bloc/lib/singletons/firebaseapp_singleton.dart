import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseAppSingleton {
  static final FirebaseAppSingleton _firebaseAppSingleton =
      FirebaseAppSingleton._internal();

  FirebaseAppSingleton._internal();

  static FirebaseAppSingleton getInstance() => _firebaseAppSingleton;

  Firestore firestore;
  FirebaseAuth firebaseAuth;
  FirebaseStorage fireStorage;

  Future<void> createFirebaseConnection() async {
    final FirebaseApp app = await FirebaseApp.configure(
      name: 'test',
      options: const FirebaseOptions(
        googleAppID: '1:727905882714:android:4e651d69ff5993baa2be63',
        apiKey: 'AIzaSyDQ0oDAZO3FVSritxDU3gGOOJsKw2o38Fg',
        projectID: 'agropicker',
      ),
    );

    firestore = Firestore(app: app);
    firebaseAuth = FirebaseAuth.fromApp(app);
    fireStorage = FirebaseStorage(
        app: app, storageBucket: "gs://agropicker.appspot.com/");
  }
}
