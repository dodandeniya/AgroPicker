import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_bloc/blocs/blocs.dart';
import 'package:agro_picker_bloc/constants/firebase_interface.dart';
import 'package:agro_picker_bloc/enums/enum.dart';
import 'package:agro_picker_consumer/theme/style.dart';
import 'package:agro_picker_consumer/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAppSingleton _firebaseApp = FirebaseAppSingleton.getInstance();
  await _firebaseApp.createFirebaseConnection();

  BlocSupervisor.delegate = AgroBlocDelegate();
  runApp(BlocProvider(
      create: (context) => AuthenticationBloc()..add(AppStarted()),
      child: Main()));
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agro Picker',
      theme: appTheme(),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }

          if (state is PendingProfileCompletion) {
            addTempUser(context); // this will remove later.
            return SplashScreen();
          }

          if (state is Authenticated) {
            return Dashboard();
          }

          return Login();
        },
      ),
    );
  }

  Future<void> addTempUser(BuildContext context) async {
    UserRepository userRepository = UserRepository();
    FirebaseInterface db = FirebaseInterface();
    var fUser = await userRepository.getCurrentUser();
    GeoPoint pt = GeoPoint(5.12, 1.24);
    List<String> album = ['a', 'b'];
    AgroProfile ap = AgroProfile(album: album);

    AddressDetails ad = AddressDetails('a', 'b', 'c', 'd', 1);

    Users user = Users(fUser.uid, 1, 'cham', 'Chamara', 'Dodandeniya', 'ccc',
        Gender.Male, '071555', ad, fUser.email,
        location: pt, agroProfile: ap, isProfileCompleted: true);

    await db.insertDocumentData<Users>(user.toJson(), user.userId);
    BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
  }
}
