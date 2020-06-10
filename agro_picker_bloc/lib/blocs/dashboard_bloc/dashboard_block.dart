import 'dart:async';
import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:bloc/bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final UserRepository _userRepository = UserRepository();

  @override
  DashboardState get initialState => DashboardUpdateEmpty();

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if (event is StartUpdateDashboard) {
      yield UpdateDashboardLoading();
      _userRepository.getUserDataStream().listen((onData) =>
          add(UpdateDashboardEvent(UserModel.fromJson(onData.data))));
    }

    if (event is UpdateDashboardEvent) {
      yield UpdateDashboard(event.user);
    }
  }
}
