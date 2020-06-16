import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockCreation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return BlocProvider<DashboardsummaryBloc>(
    //   create: (context) => DashboardsummaryBloc(),
    //   child: SafeArea(
    //     child: GestureDetector(
    //       onTap: () {
    //         FocusScope.of(context).unfocus();
    //       },
    //       child: Scaffold(
    //         appBar: AppBar(
    //           title: Text('Add Stocks'),
    //         ),
    //         body: BlocBuilder<DashboardsummaryBloc, DashboardsummaryState>(
    //             builder: (context, state) {
    //           if (state is UpdateSummaryScreen) {
    //             return Center(
    //               child: CircularProgressIndicator(),
    //             );
    //           }
    //           return StocksCreationScreen();
    //         }),
    //       ),
    //     ),
    //   ),
    // );
    return SafeArea(
        child: GestureDetector(
            child: Scaffold(
      appBar: AppBar(
        title: Text('Add Stocks'),
      ),
      body: StocksCreationScreen(),
    )));
  }
}
