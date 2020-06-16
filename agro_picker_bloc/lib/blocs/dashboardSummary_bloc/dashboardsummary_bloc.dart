import 'dart:async';

import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_bloc/constants/firebase_interface.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class DashboardsummaryBloc
    extends Bloc<DashboardsummaryEvent, DashboardsummaryState> {
  final FirebaseInterface db = FirebaseInterface();
  final Users user = UserStatusSingleton.getInstance().user;
  @override
  DashboardsummaryState get initialState => DashboardsummaryInitial();

  @override
  Stream<DashboardsummaryState> mapEventToState(
    DashboardsummaryEvent event,
  ) async* {
    if (event is StartSummryBoardUpdateEvent) {
      yield* _mapStartSummryBoardUpdateEventToState();
    }

    if (event is StartListner) {
      yield* _mapStartListnerToState(event);
    }
  }

  Stream<DashboardsummaryState> _mapStartListnerToState(
      StartListner event) async* {
    var newOederCount = event.docs
        .where((element) => element.data['status'] == 'New_Order')
        .length;

    var completedOederCount = event.docs
        .where((element) => element.data['status'] == 'Completed')
        .length;

    var pendingCount = event.docs
        .where((element) => (element.data['status'] != 'New_Order'))
        .where((element) => (element.data['status'] != 'Completed'))
        .length;

    yield UpdateNewOrdersCount(newOederCount);
    yield UpdatePendingCount(pendingCount);
    yield UpdateCompletedCount(completedOederCount);
  }

  Stream<DashboardsummaryState>
      _mapStartSummryBoardUpdateEventToState() async* {
    yield UpdateSummaryScreen();

    List<FirebaseQueryParameter> param = [
      FirebaseQueryParameter(
          fieldName: 'venderId',
          fieldValue: user.userId,
          queryMethod: QueryMethod.isEqualTo),
    ];

    db.getQueryObject<Orders>(param).listen((event) {
      add(StartListner(event.documents));
    });
  }
}
