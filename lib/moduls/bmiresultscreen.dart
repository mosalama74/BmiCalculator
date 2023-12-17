import 'package:bmicalculator/shared/components/components.dart';
import 'package:bmicalculator/shared/cubit/bmiappcubit.dart';
import 'package:bmicalculator/shared/cubit/bmiappstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiResultScreen extends StatelessWidget {

   BmiResultScreen({
     required String gender,
     required int age,
     required int height,
     required int weight,
     required int result,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiAppCubit,BmiAppStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return  buildBmiResultScreen(context);
      },

    );
  }
}
