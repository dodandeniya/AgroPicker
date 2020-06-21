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
  DashboardordersBloc ordersBloc;
  int pendingOrderCount = 0;

  @override
  void initState() {
    super.initState();
    dashboardStockBloc = BlocProvider.of<DashboardproductstockBloc>(context);
    dashboardStockBloc.add(StartConsumerStockBoardUpdate());
    ordersBloc = BlocProvider.of<DashboardordersBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardordersBloc, DashboardordersState>(
      listener: (context, state) {
        if (state is OrderCreationFailed) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Unable to create order. Try again later.'),
                    Icon(Icons.error)
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }

        if (state is OrderCreated) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Your order has been created sucessfully.'),
                    Icon(Icons.check)
                  ],
                ),
                backgroundColor: Colors.green,
              ),
            );
        }
      },
      child: Container(
        child: Column(
          children: <Widget>[
            SearchBar(
                'Search By Stock Item', searchStockItem, clearSearchResults),
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
                          return BlocProvider<DashboardordersBloc>(
                              create: (context) => DashboardordersBloc(),
                              child: StocksTemplate(state.orderList[index]));
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
      ),
    );
  }

  void searchStockItem(String stockName) {
    setState(() {
      pendingOrderCount = 0;
    });
    dashboardStockBloc
        .add(StartConsumerStockSearchEvent(stockName.toLowerCase()));
  }

  void clearSearchResults() {
    setState(() {
      pendingOrderCount = 0;
    });
    dashboardStockBloc.add(StartConsumerStockBoardUpdate());
  }
}
