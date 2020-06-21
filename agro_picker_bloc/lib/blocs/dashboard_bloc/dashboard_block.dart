import 'dart:async';
import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_bloc/constants/firebase_interface.dart';
import 'package:bloc/bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final FirebaseInterface db = FirebaseInterface();
  final FirebaseAppSingleton _firebaseAppSingleton =
      FirebaseAppSingleton.getInstance();

  @override
  DashboardState get initialState => DashboardUpdateEmpty();

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if (event is StartUpdateDashboard) {
      yield UpdateDashboardLoading();
      var docId = (await _firebaseAppSingleton.firebaseAuth.currentUser()).uid;
      db.getObject<Users>(docId).listen(
          (onData) => add(UpdateDashboardEvent(Users.fromJson(onData.data))));
    }

    if (event is UpdateDashboardEvent) {
      yield UpdateDashboard(event.user);
    }
  }
}
