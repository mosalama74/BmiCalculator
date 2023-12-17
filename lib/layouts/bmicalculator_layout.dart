
import 'package:bmicalculator/shared/components/components.dart';
import 'package:bmicalculator/shared/cubit/bmiappcubit.dart';
import 'package:bmicalculator/shared/cubit/bmiappstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCalulatorLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiAppCubit,BmiAppStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context,  state) {
        return buildBmiLayoutScreen(context);
      },

    );
  }
}
