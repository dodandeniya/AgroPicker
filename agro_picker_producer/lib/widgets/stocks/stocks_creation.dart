import 'package:agro_picker_bloc/agri_picker_blocs.dart';
import 'package:agro_picker_producer/agro_picker_producer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockCreation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsBloc>(
          create: (context) => ProductsBloc(),
        ),
        BlocProvider<DashboardproductstockBloc>(
          create: (context) => DashboardproductstockBloc(),
        ),
        BlocProvider<FileuploadBloc>(
          create: (context) => FileuploadBloc(),
        ),
      ],
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('Add Stocks'),
            ),
            body: StocksCreationScreen(),
          ),
        ),
      ),
    );
  }
}
