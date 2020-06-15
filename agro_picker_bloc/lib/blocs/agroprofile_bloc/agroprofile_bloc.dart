import 'dart:async';

import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_bloc/blocs/blocs.dart';
import 'package:agro_picker_bloc/constants/firebase_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgroprofileBloc extends Bloc<AgroprofileEvent, AgroprofileState> {
  final FirebaseAppSingleton firebaseAppSingleton =
      FirebaseAppSingleton.getInstance();
  final FirebaseInterface db = FirebaseInterface();

  @override
  AgroprofileState get initialState => AgroprofileInitial();

  @override
  Stream<AgroprofileState> mapEventToState(
    AgroprofileEvent event,
  ) async* {
    if (event is CheckProfileState) {
      yield* _mapCheckProfileStateEventToState();
    }

    if (event is ResetPrefileState) {
      yield* _mapResetPrefileStateEventToState();
    }
  }

  Stream<AgroprofileState> _mapResetPrefileStateEventToState() async* {
    yield AgroprofileInitial();
  }

  Stream<AgroprofileState> _mapCheckProfileStateEventToState() async* {
    var docId = (await firebaseAppSingleton.firebaseAuth.currentUser()).uid;

    var state = (await db
        .getDocumentById<Users>(docId)
        .then((value) => Users.fromJson(value.data).profileState));

    switch (state) {
      case AgroProfileState.Approved:
        yield Approved();
        break;
      case AgroProfileState.Rejected:
        yield Rejected();
        break;
      default:
        yield Pending();
        break;
    }
  }
}
