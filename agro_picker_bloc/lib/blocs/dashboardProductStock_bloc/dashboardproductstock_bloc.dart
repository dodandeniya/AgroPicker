import 'dart:async';

import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_bloc/blocs/blocs.dart';
import 'package:agro_picker_bloc/repository/productStockRepository.dart';
import 'package:bloc/bloc.dart';

class DashboardproductstockBloc
    extends Bloc<DashboardproductstockEvent, DashboardproductstockState> {
  ProductStockRepository stockRepository = ProductStockRepository();

  @override
  DashboardproductstockState get initialState => DashboardproductstockInitial();

  @override
  Stream<DashboardproductstockState> mapEventToState(
    DashboardproductstockEvent event,
  ) async* {
    if (event is StartStockBoardUpdateEvent) {
      yield* _mapStartStockBoardUpdateEventToState();
    }

    if (event is StartConsumerStockBoardUpdate) {
      yield* _mapStartConsumerStockBoardUpdateToState();
    }

    if (event is StockBoardUpdateListner) {
      yield* _mapStockBoardUpdateListnerEventToState(event);
    }

    if (event is StartStockSearchEvent) {
      yield* _mapStartStockSearchEventToState(event);
    }

    if (event is StartConsumerStockSearchEvent) {
      yield* _mapStartConsumerStockSearchEventToState(event);
    }

    if (event is StockSearchListner) {
      yield* _mapStockSearchListnerToState(event);
    }

    if (event is CreateStockItem) {
      yield* _mapCreateStockItemEventToState(event);
    }

    if (event is UpdateStockItem) {
      yield* _mapUpdateStockItemEventToState(event);
    }

    if (event is DeleteStockItem) {
      yield* _mapDeleteStockItemEventToState(event);
    }
  }

  Stream<DashboardproductstockState>
      _mapStartStockBoardUpdateEventToState() async* {
    yield DashboardStockLoading();

    stockRepository.getAllStocks().listen((event) {
      add(StockBoardUpdateListner(event.documents));
    });
  }

  Stream<DashboardproductstockState>
      _mapStartConsumerStockBoardUpdateToState() async* {
    yield DashboardStockLoading();

    stockRepository.getAllStocksforConsumer().listen((event) {
      add(StockBoardUpdateListner(event.documents));
    });
  }

  Stream<DashboardproductstockState> _mapStockBoardUpdateListnerEventToState(
      StockBoardUpdateListner event) async* {
    List<ProductStores> stocks = [];
    var stockList = event.docs.toList();

    if (stockList.isNotEmpty) {
      for (var item in stockList) {
        stocks.add(ProductStores.fromJson(item.data));
      }
      await Future.delayed(Duration(seconds: 5));
      yield UpdateStocksList(stocks);
    } else {
      yield EmptyStockList();
    }
  }

  Stream<DashboardproductstockState> _mapStartStockSearchEventToState(
      StartStockSearchEvent event) async* {
    yield DashboardStockLoading();

    stockRepository.getStockBySearch(event.searchKey).listen((event) {
      add(StockSearchListner(event.documents));
    });
  }

  Stream<DashboardproductstockState> _mapStartConsumerStockSearchEventToState(
      StartConsumerStockSearchEvent event) async* {
    yield DashboardStockLoading();

    stockRepository
        .getStockBySearchforConsumer(event.searchKey)
        .listen((event) {
      add(StockSearchListner(event.documents));
    });
  }

  Stream<DashboardproductstockState> _mapStockSearchListnerToState(
      StockSearchListner event) async* {
    List<ProductStores> stocks = [];
    var stockList = event.docs.toList();

    if (stockList.isNotEmpty) {
      for (var item in stockList) {
        stocks.add(ProductStores.fromJson(item.data));
      }
      await Future.delayed(Duration(seconds: 5));
      yield UpdateStocksList(stocks);
    } else {
      yield EmptyStockList();
    }
  }

  Stream<DashboardproductstockState> _mapCreateStockItemEventToState(
      CreateStockItem event) async* {
    yield DashboardStockLoading();
    var result = await stockRepository.insertStock(event.stockItem);

    if (result) {
      yield StockItemCreated();
    } else {
      yield StockItemCreationFailed();
    }
  }

  Stream<DashboardproductstockState> _mapUpdateStockItemEventToState(
      UpdateStockItem event) async* {
    var result =
        await stockRepository.updateStock(event.updateItem, event.stockId);

    if (result) {
      yield StockItemSucessfullyUpdated();
    } else {
      yield StockItemUpdataionFailed();
    }
  }

  Stream<DashboardproductstockState> _mapDeleteStockItemEventToState(
      DeleteStockItem event) async* {
    var result = await stockRepository.deleteStock(event.stockId);

    if (result) {
      yield StockItemDeleted();
    } else {
      yield StockItemDeletionFailed();
    }
  }
}
