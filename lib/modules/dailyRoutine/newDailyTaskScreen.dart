import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../models/models.dart';
import '../../shared/components/component.dart';
import '../../shared/style/styles.dart';


import 'package:intl/date_symbol_data_local.dart';

import 'endTimeTableCalenderScreen.dart';

// import 'pages/basics_example.dart';
// import 'pages/complex_example.dart';
// import 'pages/events_example.dart';
// import 'pages/multi_example.dart';
// import 'pages/range_example.dart';

class newDailyTaskScreen extends StatefulWidget {
  const newDailyTaskScreen({Key? key}) : super(key: key);

  @override
  State<newDailyTaskScreen> createState() => _newDailyTaskScreenState();
}

class _newDailyTaskScreenState extends State<newDailyTaskScreen> {
  var routinTitleController = TextEditingController();
  var endDateController = TextEditingController();





  List<String> repeatItem= [
    'every day',
    'every week',
    'every month',
  ];
  List<String> endTime = [
    ' ',
  ];

  List<Color> colorsList=[
    Color.fromARGB(45, 149, 149, 149),
    Color.fromARGB(255, 242, 206, 239),
    Color.fromARGB(255, 240, 211, 183),
    Color.fromARGB(255, 251, 96, 99),
    Color.fromARGB(255, 198, 198, 198),
    Color.fromARGB(255, 115, 196, 139),
    Color.fromARGB(255, 29, 185, 255),
    Color.fromARGB(255, 102, 122, 202),
    Color.fromARGB(255, 255, 184, 237),
    // Color.fromARGB(255, 202, 193, 152),
  ];
  List<Color> supColorsList=[
    Color.fromARGB(31, 98, 98, 98),
    Color.fromARGB(255, 238, 191, 228),
    Color.fromARGB(255, 184, 152, 129),
    Color.fromARGB(255, 247, 81, 88),
    Color.fromARGB(255, 33, 52, 216),
    Color.fromARGB(255, 102, 213, 74),
    Color.fromARGB(255, 202, 29, 29),
    Color.fromARGB(255, 252, 169, 226),
    Color.fromARGB(181, 92, 142, 171),
  ];

  List<String> timeItem = [
    'Morning',
    'Afternoon',
    'Evening',
    'Any time',
  ];


  String? repeatSelectedValue;
  String? timeSelectedValue;

  var repeatColor= Color.fromARGB(181, 92, 142, 171);
  var periodColor= Color.fromARGB(181, 92, 142, 171);

  String titleLable = "Title";
  bool floatingLable = true;
  bool enabledBorder = true;


////////////////TableCalsenser////////////////////////
   DateTime toDay=DateTime.now();
   DateTime selectedDay= DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day+7);
   CalendarFormat calendarFormat=CalendarFormat.month;
   DateFormat dateFormat=DateFormat(" MM ,EEEE  dd");

   void onDaySelected(DateTime day, DateTime focusedDay){
     setState(() {
       selectedDay=day;
     });
   }

   var endeDateSaveIcone=Icons.calendar_month_rounded;
   bool showCalender=false;

///////////////////////////////
  @override
  Widget build(BuildContext context) {
    endDateController.text=dateFormat.format(selectedDay);

    return Scaffold(
      backgroundColor:Color.fromARGB(255, 36, 36, 36),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {

                        },
                        icon: Icon(
                          Icons.restart_alt_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Create your task",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      TextButton(onPressed: (){}, child:Text("Save",style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,

                          fontStyle: FontStyle.italic),))
                    ],
                  ),
                ),
                SizedBox(height: 10,),

                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                      child: textFormField(
                        lableColor: Color.fromARGB(255, 92, 142, 171),
                      inputTextColor: Color.fromARGB(255, 92, 142, 171),
                      lableSize: 28,
                      inputTextSize: 28,
                      controller: routinTitleController,
                      lable: titleLable,
                      floatingLable: floatingLable,
                      onSubmit: () {
                        setState(() {
                          floatingLable = false;
                        });
                      },
                      onTap: () {
                        setState(() {
                          floatingLable = true;
                        });
                      },
                      enabledBorder: false,
                    )),///////title_feild
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: TextField(
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic),
                    onSubmitted: (s){ },
                    minLines: 6,
                    maxLines: 12,
                    cursorColor: Colors.white,
                    cursorHeight: 30,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(10) ,
                          borderSide: BorderSide(color: Color.fromARGB(122, 76, 75, 75), width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(10) ,
                          borderSide: BorderSide(color: Color.fromARGB(122, 76, 75, 75), width: 2)),
                      fillColor: Color.fromARGB(122, 76, 75, 75),
                      hintText: "Discreption",
                      hintStyle: TextStyle(
                        color:Color.fromARGB(100, 255, 255, 255),
                         fontSize: 22,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),

                    ),
                  ),
                ),///////description_feild

                Padding(
                  padding: const EdgeInsets.only(top:8.0,left:10),
                  child: Text("Repeat :", style:TextStyle(
                      color: Color.fromARGB(255, 92, 142, 171),
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic),),
                ),///////repeate
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint:  Row(
                          children: [
                            Expanded(
                              child: Text(
                                " ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white60,
                                  fontStyle: FontStyle.italic,
                                ),
                                overflow: TextOverflow.ellipsis,

                              ),
                            ),
                          ],
                        ),
                        items: repeatItem.map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                            .toList(),
                        value: repeatSelectedValue,
                        onChanged: (value) {
                          setState(() {
                            repeatSelectedValue = value as String;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color:repeatColor,
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 30,
                          ),
                          iconEnabledColor: Colors.white60,
                          // iconDisabledColor: Colors.grey,
                        ),

                        dropdownStyleData: DropdownStyleData(
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white54,
                          ),
                          // offset: const Offset(-20, 0),
                          // scrollbarTheme: ScrollbarThemeData(
                          //   radius: const Radius.circular(40),
                          //   thickness: MaterialStateProperty.all<double>(6),
                          //   thumbVisibility: MaterialStateProperty.all<bool>(true),
                          // ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 30,
                          padding: EdgeInsets.only(left: 14, right: 14),
                          //item padding
                        ),
                      ),
                    ),
                  ),
                ),///////repeate_Dropdown

                Padding(
                  padding: const EdgeInsets.only(top:8.0,left:10),
                  child: Text("End date:", style:TextStyle(
                      color: Color.fromARGB(255, 92, 142, 171),
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic),),
                ),////////endDate
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    child:outLinedFormField(
                        inputTextSize:18 ,
                        inputTextColor: Colors.white60,
                        controller: endDateController,
                        filled: true,
                        fillColor:Color.fromARGB(181, 92, 142, 171),
                        readOnly: true,
                        suffix:endeDateSaveIcone,
                        suffixIconColor: Colors.white60,
                        suffixPressed: (){
                          setState(() {
                            if(showCalender==false) {
                              showCalender = true;
                              endeDateSaveIcone = Icons.done_rounded;
                            }else{
                              showCalender = false;
                              endeDateSaveIcone = Icons.calendar_month_rounded;
                            }
                          });

                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (BuildContext context) {
                          //       return endTimeTableCalenderScreen();
                          //     }));
                        }
                    ),
                  ),

                ),
                Stack(
                  children: [
                    SizedBox( ),
                    Center(
                      child: showCalender? Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              // color: Color.fromARGB(135, 86, 185, 175),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TableCalendar(
                                rangeEndDay: selectedDay,
                                calendarBuilders: CalendarBuilders(
                                  dowBuilder: (context, day) {
                                    if (day.weekday == DateTime.friday) {
                                      final text = DateFormat.E().format(day);
                                      return Center(
                                          child: Text(
                                            text,
                                            style: TextStyle(
                                              color: Colors.white38,
                                            ),
                                          ));
                                    }
                                    if (day.weekday == selectedDay.weekday) {
                                      final text = DateFormat.E().format(day);
                                      return Center(
                                        child: Text(
                                          text,
                                          style: TextStyle(
                                            fontSize:22,color: Colors.white,),
                                        ),
                                      );
                                    }
                                  },
                                ),
                                calendarFormat: calendarFormat,
                                onFormatChanged: (format) {
                                  setState(() {
                                    calendarFormat = format;
                                  });
                                },
                                calendarStyle: CalendarStyle(
                                  disabledTextStyle:TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black45,
                                  ) ,
                                  disabledDecoration: BoxDecoration(
                                    color: Color.fromARGB(27, 164, 164, 164),
                                    shape:BoxShape.circle,
                                  ),

                                  defaultTextStyle: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white60,
                                  ),
                                  defaultDecoration: BoxDecoration(
                                    shape:BoxShape.circle,
                                    color:Color.fromARGB(27, 164, 164, 164),
                                  ),

                                  outsideTextStyle:TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white24,
                                  ) ,
                                  outsideDecoration: BoxDecoration(
                                    shape:BoxShape.circle,
                                    color:Color.fromARGB(27, 164, 164, 164),
                                  ),

                                  weekendTextStyle: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white60,
                                  ),
                                  weekendDecoration: BoxDecoration(
                                    shape:BoxShape.circle,
                                    color:Color.fromARGB(27, 164, 164, 164),
                                  ),

                                  holidayTextStyle: TextStyle(
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white38,
                                  ),
                                  todayDecoration: BoxDecoration(color: Colors.white38,shape:BoxShape.circle,
                                  ),
                                  selectedTextStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  // outsideDaysVisible: true,
                                  // outsideDecoration: BoxDecoration(
                                  //   color: Colors.blue
                                  // ),
                                  selectedDecoration: BoxDecoration(
                                    shape:BoxShape.circle,
                                    color:Color.fromARGB(181, 92, 142, 171),
                                  ),

                                ),
                                locale: "en_US",
                                rowHeight:50,
                                headerStyle: HeaderStyle(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(181, 92, 142, 171),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:  Radius.circular(10))
                                  ),
                                  titleTextStyle:TextStyle(
                                    color: Colors.white60,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  formatButtonVisible: false,
                                  titleCentered: true,
                                  leftChevronIcon: Icon(
                                    Icons.chevron_left,
                                    color: Colors.white60,
                                    size: 26,
                                  ),
                                  rightChevronIcon: Icon(
                                    Icons.chevron_right,
                                    color: Colors.white60,
                                    size: 26,
                                  ),
                                ),
                                availableGestures: AvailableGestures.all,
                                selectedDayPredicate: (day)=> isSameDay(selectedDay,day),
                                focusedDay: selectedDay,
                                firstDay: toDay,
                                lastDay: DateTime.utc(2030, 3, 14),
                                onDaySelected: onDaySelected,
                                holidayPredicate: (day) {
                                  // Weekends
                                  return day.weekday ==DateTime.friday;
                                },
                                startingDayOfWeek: StartingDayOfWeek.sunday,
                                daysOfWeekHeight: 40.0,
                                daysOfWeekStyle: DaysOfWeekStyle(
                                  weekdayStyle: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  weekendStyle: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                  ),
                                )

                            ),
                          ),
                        ),
                      ):null,
                    ),
                  ]
                ),


                Padding(
                  padding: const EdgeInsets.only(top:8.0,left:10),
                  child: Text("Color :", style:TextStyle(
                      color: Color.fromARGB(255, 92, 142, 171),
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic),),
                ),///////colorsSwitch
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: colorsList.length,
                      primary: false,
                      //solution of slow scroll//////
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              if(colorsList[index]== Color.fromARGB(45, 149, 149, 149)){
                                repeatColor= Color.fromARGB(181, 92, 142, 171);
                                periodColor= Color.fromARGB(181, 92, 142, 171);
                              }else{
                                repeatColor=colorsList[index];
                                periodColor=supColorsList[index];
                              }

                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: CircleAvatar(
                              radius:30,
                              backgroundColor: colorsList[index],
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom:0,
                                    left: 5,
                                    child: Container(
                                      height:25,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: supColorsList[index],
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(100),
                                            bottomRight: Radius.circular(100)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),///////colorsSwitch

                Padding(
                  padding: const EdgeInsets.only(top:8.0,left:10),
                  child: Text("When :", style:TextStyle(
                      color: Color.fromARGB(255, 92, 142, 171),
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic),),
                ),/////////when
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint:  Row(
                          children: [
                            Expanded(
                              child: Text(
                                " ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white60,
                                  fontStyle: FontStyle.italic,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: timeItem.map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                            .toList(),
                        value: timeSelectedValue,
                        onChanged: (value) {
                          setState(() {
                            timeSelectedValue = value as String;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Color.fromARGB(181, 92, 142, 171),
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 30,
                          ),
                          iconEnabledColor: Colors.white60,
                          // iconDisabledColor: Colors.grey,
                        ),

                        dropdownStyleData: DropdownStyleData(
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white54,
                          ),
                          // offset: const Offset(-20, 0),
                          // scrollbarTheme: ScrollbarThemeData(
                          //   radius: const Radius.circular(40),
                          //   thickness: MaterialStateProperty.all<double>(6),
                          //   thumbVisibility: MaterialStateProperty.all<bool>(true),
                          // ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 30,
                          padding: EdgeInsets.only(left: 14, right: 14),
                          //item padding
                        ),
                      ),
                    ),
                  ),
                ),/////////period_Dropdown

                 SizedBox(height: 100,),

              ],
            ),

            ]
          ),
        ),
      ),
    );
  }
}
