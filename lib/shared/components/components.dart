import 'dart:math';

import 'package:bmicalculator/moduls/bmiresultscreen.dart';
import 'package:bmicalculator/shared/cubit/bmiappcubit.dart';
import 'package:bmicalculator/shared/styles/colors.dart';
import 'package:flutter/material.dart';


Widget builddefaulttext({
  required String text,
  Color textcolor=Colors.black,
  double fontsize = 30.0,
  FontWeight fontweight = FontWeight.w700,
  TextOverflow? textoverflow,
  int? maxlines,
  bool isuppercase = false,
  TextBaseline? textbaseline,

}) =>
    Text(
      isuppercase ? text.toUpperCase() : text,
      style: TextStyle(
        color: textcolor,
        fontSize: fontsize,
        fontWeight: fontweight,
        overflow: textoverflow,
        textBaseline: textbaseline,
      ),
      maxLines: maxlines,

    );

Widget builddefaulttextformfield({
  required TextEditingController? controller,
  required String labeltext,
  required TextInputType? keyboardtexttype,
  void Function(String)? onchanged,
  void Function(String)? onfieldsubmitted,
  void Function()? onpressedsuffixicon,
  required IconData prefixicon,
  required String? Function(String?)? validate,
  void Function()? ontap,
  bool ispassword = false,
  String? hinttext,
  IconData? suffixicon,
}) =>
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labeltext,
        hintText: hinttext,
        prefixIcon: Icon(
          prefixicon,
        ),
        suffixIcon: IconButton(
          onPressed: onpressedsuffixicon,
          icon: Icon(
            suffixicon,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onTap: ontap,
      keyboardType: keyboardtexttype,
      onChanged: onchanged,
      validator: validate,
      onFieldSubmitted: onfieldsubmitted,
      obscureText: ispassword ? true : false,
    );

Widget builddefaultmaterialbutton({
  double width = double.infinity,
  Color? backgroundcolor =Colors.green,
  double radius = 30.0,
  double height = 40.0,
  BorderRadiusGeometry? borderRadius,
  required Widget child,
  required void Function()? onPressedbuttonfunction,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: borderRadius,
      ),
      child: MaterialButton(
        onPressed: onPressedbuttonfunction,
        child: child,
        height: height,

      ),
    );

Widget builddefaultseparator() =>
    Padding(
      padding: EdgeInsetsDirectional.only(start: 15.0),
      child: Container(
        color: Colors.grey,
        width: double.infinity,
        height: 1.0,
      ),
    );

Widget buildBmiResultScreen(context)=>Scaffold(
  appBar: AppBar(
    title: builddefaulttext(
      text: 'BmiResults',
      fontsize:25.0,
      fontweight:FontWeight.w700,
    ),
  ),
  body: Padding(
    padding: const EdgeInsetsDirectional.all(15.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            builddefaulttext(text: 'Gender : '),
            SizedBox(width: 10.0,),
            builddefaulttext(text: BmiAppCubit.get(context).ismale?'Male':'Female'),
          ],
        ),
        SizedBox(height: 15.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            builddefaulttext(text: 'Age : '),
            SizedBox(width: 10.0,),
            builddefaulttext(text: '${BmiAppCubit.get(context).age}'),
          ],
        ),
        SizedBox(height: 15.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            builddefaulttext(text: 'Height : '),
            SizedBox(width: 10.0,),
            builddefaulttext(text: '${BmiAppCubit.get(context).height}'),
          ],
        ),
        SizedBox(height: 15.0,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            builddefaulttext(text: 'Weight : '),
            SizedBox(width: 10.0,),
            builddefaulttext(text: '${BmiAppCubit.get(context).weight}'),
          ],
        ),
        SizedBox(height: 20.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            builddefaulttext(text: 'Result : '),
            SizedBox(width: 10.0,),
            builddefaulttext(text: '${BmiAppCubit.get(context).result.round()}'),
          ],
        ),
        SizedBox(height: 30.0,),
        builddefaultmaterialbutton(
          borderRadius: BorderRadius.circular(30),
          child: builddefaulttext(
            text: 'Calculate Again',
            fontweight: FontWeight.w700,
            fontsize: 25.0,
          ),
          onPressedbuttonfunction: (){
            Navigator.pop(context);
          },
        ),
      ],
    ),
  ),
);


Widget buildBmiLayoutScreen(context)=>Scaffold(
  appBar: AppBar(
    title: builddefaulttext(text: 'BmiCalculator',
      fontsize: 25.0,
    ),
  ),
  body: Padding(
    padding: const EdgeInsetsDirectional.all(15.0),
    child: Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){
                    BmiAppCubit.get(context).malepressed();
                  },
                  child: Container(
                    color:BmiAppCubit.get(context).ismale?Colors.green:Colors.grey[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage('assets/images/male.png'),),
                        SizedBox(height: 10.0,),
                        builddefaulttext(text: 'Male',),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15.0,),
              Expanded(
                child: InkWell(
                  onTap: (){
                    BmiAppCubit.get(context).femalepressed();
                  },
                  child: Container(
                    color:BmiAppCubit.get(context).ismale?Colors.grey[200]:Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage('assets/images/female.png'),),
                        SizedBox(height: 10.0,),
                        builddefaulttext(text: 'Female',),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 15.0),
            child: Container(
              color: defaultcontainercolor(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  builddefaulttext(text: 'Height',),
                  SizedBox(height: 15.0,),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      builddefaulttext(text: '${BmiAppCubit.get(context).height.round()}'),
                      builddefaulttext(text: 'cm',
                        fontweight: FontWeight.w400,
                        fontsize: 25.0,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Slider(
                    value:BmiAppCubit.get(context).height.toDouble(),
                    min: 90,
                    max:300 ,
                    onChanged: (value){
                      BmiAppCubit.get(context).slidervalue=value.round();
                      BmiAppCubit.get(context).changeslidervalue(BmiAppCubit.get(context).slidervalue);
                    },
                  ),

                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: defaultcontainercolor(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      builddefaulttext(text: 'Age'),
                      SizedBox(height: 15.0,),
                      builddefaulttext(text: '${BmiAppCubit.get(context).age}',),
                      SizedBox(height: 15.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: 'age-',
                            onPressed: (){
                              BmiAppCubit.get(context).agefabiconminus();
                            },
                            child: Icon(
                              Icons.remove,
                            ),

                          ),
                          SizedBox(width: 15.0,),
                          FloatingActionButton(
                            heroTag: 'age+',
                            onPressed: (){
                              BmiAppCubit.get(context).agefabiconplus();

                            },
                            child: Icon(
                              Icons.add,
                            ),

                          ),
                        ],
                      ),
                    ],
                  ),

                ),
              ),
              SizedBox(width: 15.0,),
              Expanded(
                child: Container(
                  color: defaultcontainercolor(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      builddefaulttext(text: 'Weight'),
                      SizedBox(height: 15.0,),
                      builddefaulttext(text: '${BmiAppCubit.get(context).weight}',),
                      SizedBox(height: 15.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: 'weight-',
                            onPressed: (){
                              BmiAppCubit.get(context).weightfabiconminus();

                            },
                            child: Icon(
                              Icons.remove,
                            ),

                          ),
                          SizedBox(width: 15.0,),
                          FloatingActionButton(
                            heroTag: 'weight+',
                            onPressed: (){
                              BmiAppCubit.get(context).weightfabiconplus();
                            },
                            child: Icon(
                              Icons.add,
                            ),

                          ),

                        ],
                      ),
                    ],
                  ),

                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 15.0,),
        builddefaultmaterialbutton(
          borderRadius: BorderRadius.only(bottomRight:Radius.circular(30) ,bottomLeft:Radius.circular(30)),
          child: builddefaulttext(text: 'Calculate',
            fontsize: 25.0,
            fontweight: FontWeight.w600,
          ),
          onPressedbuttonfunction: (){
            BmiAppCubit.get(context).result = BmiAppCubit.get(context).weight/pow(BmiAppCubit.get(context).height/100,2);
            Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  BmiResultScreen(
                    gender: BmiAppCubit.get(context).ismale?'Male':'Female',
                    age: BmiAppCubit.get(context).age,
                    height: BmiAppCubit.get(context).height,
                    weight: BmiAppCubit.get(context).weight,
                    result: BmiAppCubit.get(context).result.round(),
                  ),
              ),
            );

          },
        )
      ],
    ),
  ),
);