import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StocksList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StocksList();
  }
}

class _StocksList extends State<StocksList> {
  DashboardproductstockBloc dashboardStocksBloc;

  @override
  void initState() {
    super.initState();
    dashboardStocksBloc = BlocProvider.of<DashboardproductstockBloc>(context);
    dashboardStocksBloc.add(StartStockBoardUpdateEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SearchBar('Search for an Item', searchStock, clearSearch),
          Container(
            alignment: Alignment.topCenter,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StockCreation(),
                  ),
                );
              },
              child: Text('ADD STOCKS'),
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          BlocBuilder<DashboardproductstockBloc, DashboardproductstockState>(
            builder: (context, state) {
              if (state is EmptyStockList) {
                return Expanded(
                  child: Center(
                    child: Text('No Stocks to Show'),
                  ),
                );
              }
              if (state is UpdateStocksList) {
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return StocksTemplate(
                            state.orderList[index], 'Wal-Perera');
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: state.orderList.length),
                );
              }
              return Expanded(
                  child: Center(
                child: CircularProgress(),
              ));
            },
          ),
        ],
      ),
    );
  }

  void searchStock(String stockName) {
    dashboardStocksBloc
        .add(StartStockSearchEvent(stockName.firstLetterCapital));
  }

  void clearSearch() {
    dashboardStocksBloc.add(StartStockBoardUpdateEvent());
  }
}
