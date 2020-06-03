import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseAppSingleton {
  static final FirebaseAppSingleton _firebaseAppSingleton =
      FirebaseAppSingleton._internal();

  FirebaseAppSingleton._internal();

  static FirebaseAppSingleton getInstance() => _firebaseAppSingleton;

  Firestore firestore;

  Future<void> createFirebaseConnection() async {
    final FirebaseApp app = await FirebaseApp.configure(
      name: 'test',
      options: const FirebaseOptions(
        googleAppID: '1:528382687007:android:7f93fab2275b6899aba22a',
        apiKey: 'AIzaSyDKfvw_x7z1ejkpQtCCMMClKc-6Ka9FtMs',
        projectID: 'travel-sl-12345',
      ),
    );

    firestore = Firestore(app: app);
  }
}
