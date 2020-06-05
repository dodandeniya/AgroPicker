import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_producer/appBlocDelegate.dart';
import 'package:agro_picker_producer/theme/style.dart';
import 'package:agro_picker_producer/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAppSingleton _firebaseApp = FirebaseAppSingleton.getInstance();
  await _firebaseApp.createFirebaseConnection();

  BlocSupervisor.delegate = AppBlocDelegate();
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
        builder: (c, s) {
          if (s is Uninitialized) {
            return SplashScreen();
          }
          if (s is Authenticated) {
            return HomeScreen(name: s.displayName);
          }
          return Login();
        },
      ),
    );
  }
}
