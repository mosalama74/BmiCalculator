import 'package:bloc/bloc.dart';
import 'package:bmicalculator/shared/cubit/bmiappstates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiAppCubit extends Cubit<BmiAppStates>{

  BmiAppCubit() : super(BmiAppInitialStates());

  static BmiAppCubit get(context)=>BlocProvider.of(context);

  int slidervalue=90;
  int height=150;
  int age=20;
  int weight=70;
  double result= 0.0;

  bool ismale=true;

void malepressed(){
  ismale=true;
  emit(MalePressedState());
}

  void femalepressed(){
    ismale=false;
    emit(FeMalePressedState());
  }


  void changeslidervalue(int sliderval){

  height=sliderval;
  emit(ChangeSliderValueStates());
  }


  void agefabiconminus(){
    age--;
    emit(ChangeFabAgeMinusStates());
  }

  void agefabiconplus(){
    age++;
    emit(ChangeFabAgePlusStates());
  }


  void weightfabiconminus(){
    weight--;
    emit(ChangeFabWeightMinusStates());
  }

  void weightfabiconplus(){
    weight++;
    emit(ChangeFabpWeightplusStates());
  }





}
