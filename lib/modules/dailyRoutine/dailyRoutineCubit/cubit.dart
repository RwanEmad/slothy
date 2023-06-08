import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:slothy/modules/dailyRoutine/dailyRoutineCubit/states.dart';
import 'package:slothy/shared/cubit/states.dart';

import '../../../models/models.dart';

class dailyRoutineCubit extends Cubit<dailyRoutineStates>{

  dailyRoutineCubit() : super(dailyRoutineInitialState());

  //AppCubit(super.initialState);
  static dailyRoutineCubit get(context)=>BlocProvider.of(context);

  final FloatingSearchBarController controller = FloatingSearchBarController();
  bool floatingLable = true;
  bool checkBoxValue = false;
  double? height;
  double? width;




  void enableFloatingLable(){

    floatingLable?floatingLable=false:floatingLable=true;
    emit(EnableFloatingLable());

  }

  void reOrderPeriority(int oldIndex, int newIndex){
    if (newIndex > oldIndex) newIndex-=1;
    var tmp = crumbsList[oldIndex];
    crumbsList.removeAt(oldIndex);
    crumbsList.insert(newIndex, tmp);

    emit(ReOrderPeriority());
  }
  checkBox(newValue){
    checkBoxValue=newValue;
    emit(CheckBox());
  }
  void mediaQuery(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    height = size.height; //392.72727272727275
    width = size.width;

  }

}