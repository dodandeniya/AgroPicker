import 'package:agro_picker_bloc/blocs/blocs.dart';
import 'package:agro_picker_consumer/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductStockList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductStockList();
  }
}

class _ProductStockList extends State<ProductStockList> {
  DashboardproductstockBloc dashboardStockBloc;
  int pendingOrderCount = 0;

  @override
  void initState() {
    super.initState();
    dashboardStockBloc = BlocProvider.of<DashboardproductstockBloc>(context);
    dashboardStockBloc.add(StartStockBoardUpdateEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SearchBar(
              'Search By Stock Item', searchStockItem, clearSearchResults),

          /*BlocConsumer<DashboardordersBloc, DashboardordersState>(
            listener: (context, state) {
              if (state is UpdateOrdersList) {
                setState(() {
                  pendingOrderCount = state.orderList.length;
                });
              }
            },
            builder: (context, state) {
              if (state is EmptyOrderList) {
                return Expanded(
                  child: Center(
                    child: Text('No Order to Show'),
                  ),
                );
              }
              if (state is UpdateOrdersList) {
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return OrderTemplate(state.orderList[index]);
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
                ),
              );
            },
          ),*/
        ],
      ),
    );
  }

  void searchStockItem(String stockName) {
    setState(() {
      pendingOrderCount = 0;
    });
    dashboardStockBloc.add(StartStockSearchEvent(stockName.toLowerCase()));
  }

  void clearSearchResults() {
    setState(() {
      pendingOrderCount = 0;
    });
    dashboardStockBloc.add(StartStockBoardUpdateEvent());
  }
}
