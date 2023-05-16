import '../modules/calender/calenderScreen.dart';
import '../modules/commingsoonScreen.dart';
import '../modules/dailyRoutine/dailyRoutinScreen.dart';
import '../modules/goals/goalsScreen.dart';
import '../modules/gratitude/gratitudeScreen.dart';
import '../modules/homeScreen.dart';
import '../modules/profileScreen.dart';
import '../modules/setting/settingsScreen.dart';

List <String> dailyTitleList=[
  'Morning Routin',
  'Evening Routin',
  'Sport Routin',
  'Challeng Routin ',
];

List <String> dailyTaskList=[
  'Daily habits',
  'Goals',
  'Calender',
  'Gratitude time',
  'Comming soon',
  'Comming soon',
  'Comming soon',
  'Comming soon',

];


List  ScreenList=[
  dailyRoutinScreen(),
  goalsScreen(),
  calenderScreen(),
  gratitudeScreen(),
  commingsoonScreen(),

];

List  toggelScreensList=[
  homeScreen(),
  calenderScreen(),
  profileScreen(),
  settingsScreen(),
];

Map <String,dynamic> homeMap= {
  'Daily habits':dailyRoutinScreen(),
  'Goals':goalsScreen(),
  'Calender':calenderScreen(),
  'Gratitude time':gratitudeScreen(),
  'Comming soon':commingsoonScreen(),

};

List <String> crumbsList=[
  'Daily habits  Daily habits',
  'Goals Daily habits',
  'Calender',
  'Gratitude time',
 'Calender',
  'Gratitude time',

];
List goalsList=[
  'Daily habits  Daily habits',
  'Goals Daily habits',
  'Calender',
  'Gratitude time',
 'Calender',
  'Gratitude time',

];


List rulesList=[
  'Promodoro',
  'Promodoro',
  'Promodoro',
  'Promodoro',
  'Promodoro',
  'Promodoro',
  'Promodoro',

];
