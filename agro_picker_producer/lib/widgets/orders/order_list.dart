import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OrderList();
  }
}

class _OrderList extends State<OrderList> {
  DashboardordersBloc dashboardordersBloc;
  int pendingOrderCount = 0;

  @override
  void initState() {
    super.initState();
    dashboardordersBloc = BlocProvider.of<DashboardordersBloc>(context);
    dashboardordersBloc.add(StartOrderBoardUpdateEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SearchBar('Search By Order Item', searchOrder, clearOrder),
          ListTile(
            title: Text('Pending Orders'),
            subtitle: Text('Count : $pendingOrderCount'),
          ),
          BlocConsumer<DashboardordersBloc, DashboardordersState>(
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
          ),
        ],
      ),
    );
  }

  void searchOrder(String orderName) {
    setState(() {
      pendingOrderCount = 0;
    });
    dashboardordersBloc
        .add(StartOrderSearchEvent(orderName.firstLetterCapital));
  }

  void clearOrder() {
    setState(() {
      pendingOrderCount = 0;
    });
    dashboardordersBloc.add(StartOrderBoardUpdateEvent());
  }
}
