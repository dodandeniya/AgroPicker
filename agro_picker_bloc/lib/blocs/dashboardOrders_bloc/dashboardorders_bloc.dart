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

    if (event is StartCunsumerOrderBoardUpdate) {
      yield* _mapStartCunsumerOrderListEventToState();
    }

    if (event is OrderBoardUpdateListner) {
      yield* _mapOrderBoardUpdateListnerToState(event);
    }

    if (event is StartOrderSearchEvent) {
      yield* _mapStartOrderSearchEventToState(event);
    }

    if (event is StartConsumerOrderSearchEvent) {
      yield* _mapStartConsumerOrderSearchEventToState(event);
    }

    if (event is UpdateOrder) {
      yield* _mapUpdateOrderEventToState(event);
    }

    if (event is DeleteOrder) {
      yield* _mapDeleteOrderEventToState(event);
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

  Stream<DashboardordersState> _mapStartCunsumerOrderListEventToState() async* {
    yield DashboardLoading();

    orderRepository.getAllOrdersforConsumer().listen((event) {
      add(OrderBoardUpdateListner(event.documents));
    });
  }

  Stream<DashboardordersState> _mapStartConsumerOrderSearchEventToState(
      StartConsumerOrderSearchEvent event) async* {
    yield DashboardLoading();

    orderRepository
        .getOrdersBySearchforConsumer(event.searchKey)
        .listen((event) {
      add(OrderBoardUpdateListner(event.documents));
    });
  }

  Stream<DashboardordersState> _mapOrderBoardUpdateListnerToState(
      OrderBoardUpdateListner event) async* {
    yield DashboardLoading();
    List<Orders> orders = [];
    var ordersList = event.docs
        .where((element) => element.data['status'] != 'Completed')
        .toList();

    if (ordersList != null || ordersList.isEmpty == false) {
      for (var item in ordersList) {
        orders.add(Orders.fromJson(item.data));
      }
      await Future.delayed(Duration(seconds: 5));
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

  Stream<DashboardordersState> _mapUpdateOrderEventToState(
      UpdateOrder event) async* {
    var result =
        await orderRepository.updateOrder(event.updateItem, event.orderId);

    if (result) {
      yield OrderSucessfullyUpdated();
    } else {
      yield OrderUpdataionFailed();
    }
  }

  Stream<DashboardordersState> _mapDeleteOrderEventToState(
      DeleteOrder event) async* {
    var result = await orderRepository.deleteOrder(event.orderId);

    if (result) {
      yield OrderDeleted();
    } else {
      yield OrderDeletionFailed();
    }
  }
}
