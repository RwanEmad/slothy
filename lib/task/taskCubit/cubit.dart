import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slothy/task/taskCubit/states.dart';

import '../../models/models.dart';

class TaskCubit extends Cubit<TaskStates> {
  TaskCubit() : super(TaskInitialState());

  //AppCubit(super.initialState);
  static TaskCubit get(context) => BlocProvider.of(context);
  double? height;
  double? width;
  bool checkBoxValue = false;
  bool switchValue=false;

  void mediaQuery(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    height = size.height; //392.72727272727275
    width = size.width;

  }

  void reOrderPeriority(int oldIndex, int newIndex){
    if (newIndex > oldIndex) newIndex-=1;
    var tmp = crumbsList[oldIndex];
    crumbsList.removeAt(oldIndex);
    crumbsList.insert(newIndex, tmp);

    emit(ReOrderPeriority() );
  }
  checkBox(newValue){
    checkBoxValue=newValue;
    emit(CheckBox());
  }
   switchButton(newValue){
    switchValue=newValue;
    emit(SwitchButton());
  }


}