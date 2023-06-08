import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slothy/modules/dailyRoutine/dailyRoutineCubit/cubit.dart';
import 'package:slothy/shared/cubit/states.dart';

import '../../modules/dailyRoutine/routinScreen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  //AppCubit(super.initialState);
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndix(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  bool isDark =true;

  void changeAppMode(){
    isDark=!isDark;
    emit(AppChangeModeState());
  }

  // void navToDailyRoutine(BuildContext context) {
  //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
  //     return dailyRoutinScreen();
  //   }));
  //   emit(NavigateToDailyRoutineScreen());
  // }

}
