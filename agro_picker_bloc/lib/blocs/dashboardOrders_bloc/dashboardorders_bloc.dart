import 'dart:async';

import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_bloc/blocs/blocs.dart';
import 'package:agro_picker_bloc/repository/repository.dart';
import 'package:bloc/bloc.dart';

class DashboardordersBloc
    extends Bloc<DashboardordersEvent, DashboardordersState> {
  OrderRepository orderRepository = OrderRepository();

  @override
  DashboardordersState get initialState => DashboardordersInitial();

  @override
  Stream<DashboardordersState> mapEventToState(
    DashboardordersEvent event,
  ) async* {
    if (event is CreateOrder) {
      yield* _mapCreateOrderEventToState(event);
    }

    if (event is StartOrderBoardUpdateEvent) {
      yield* _mapStartOrderBoardUpdateEventToState();
    }

    if (event is OrderBoardUpdateListner) {
      yield* _mapOrderBoardUpdateListnerToState(event);
    }

    if (event is StartOrderSearchEvent) {
      yield* _mapStartOrderSearchEventToState(event);
    }
  }

  Stream<DashboardordersState> _mapCreateOrderEventToState(
      CreateOrder event) async* {
    yield DashboardLoading();
    var result = await orderRepository.insertOrder(event.order);

    if (result) {
      yield OrderCreated();
    } else {
      yield OrderCreationFailed();
    }
  }

  Stream<DashboardordersState> _mapStartOrderBoardUpdateEventToState() async* {
    yield DashboardLoading();

    orderRepository.getAllOrders().listen((event) {
      add(OrderBoardUpdateListner(event.documents));
    });
  }

  Stream<DashboardordersState> _mapOrderBoardUpdateListnerToState(
      OrderBoardUpdateListner event) async* {
    yield DashboardLoading();
    List<Orders> orders;
    var ordersList = event.docs
        .where((element) => element.data['status'] != 'Completed')
        .toList();

    if (ordersList != null || ordersList.isEmpty == false) {
      for (var item in ordersList) {
        orders.add(Orders.fromJson(item.data));
      }
      yield UpdateOrdersList(orders);
    } else {
      yield EmptyOrderList();
    }
  }

  Stream<DashboardordersState> _mapStartOrderSearchEventToState(
      StartOrderSearchEvent event) async* {
    yield DashboardLoading();

    orderRepository.getOrdersBySearch(event.searchKey).listen((event) {
      add(OrderBoardUpdateListner(event.documents));
    });
  }
}
