import 'package:bloc/bloc.dart';
import 'package:bmicalculator/layouts/bmicalculator_layout.dart';
import 'package:bmicalculator/moduls/bmiresultscreen.dart';
import 'package:bmicalculator/shared/components/blocobserver.dart';
import 'package:bmicalculator/shared/cubit/bmiappcubit.dart';
import 'package:bmicalculator/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>BmiAppCubit(),
      child: MaterialApp(

        theme: ThemeData(
          primarySwatch:Colors.green,
          appBarTheme: AppBarTheme(
            backgroundColor: defaultappcolor(),
            elevation: 0.0,
            titleSpacing: 15.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: defaultappcolor(),
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: BmiCalulatorLayout(),
      ),
    );
  }
}

