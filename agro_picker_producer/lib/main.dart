import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_producer/theme/style.dart';
import 'package:agro_picker_producer/widgets/widgets.dart';
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
          if (state is Authenticated) {
            return HomeScreen(name: state.displayName);
          }
          if (state is PendingProfileCompletion) {
            return BlocProvider<ProfileBloc>(
              create: (context) => ProfileBloc(),
              child: Profile(),
            );
          }
          return Login();
        },
      ),
    );
  }
}
