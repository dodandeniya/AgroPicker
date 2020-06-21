import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSummary extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeSummary();
  }
}

class _HomeSummary extends State<HomeSummary> {
  DashboardsummaryBloc dashboardsummaryBloc;
  int newOrders;
  int completedOrders;
  int pendingOrders;

  @override
  void initState() {
    super.initState();
    dashboardsummaryBloc = BlocProvider.of<DashboardsummaryBloc>(context);
    newOrders = 0;
    completedOrders = 0;
    pendingOrders = 0;
    dashboardsummaryBloc.add(StartSummryBoardUpdateEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardsummaryBloc, DashboardsummaryState>(
      listener: (context, state) {
        if (state is UpdateNewOrdersCount) {
          setState(() {
            newOrders = state.count;
          });
        }

        if (state is UpdateCompletedCount) {
          setState(() {
            completedOrders = state.count;
          });
        }

        if (state is UpdatePendingCount) {
          setState(() {
            pendingOrders = state.count;
          });
        }
      },
      child: Container(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ListTile(
                  title: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Active Order Count',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '$newOrders',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )),
              ListTile(
                  title: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Pending Orders',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '$pendingOrders',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )),
              ListTile(
                  title: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Completed Orders',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '$completedOrders',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
