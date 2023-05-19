import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:slothy/modules/dailyRoutine/dailyRoutinScreen.dart';
import '../../models/models.dart';
import '../style/colors.dart';
import '../style/styles.dart';

Widget defaultButton({
  required String text,
  required var textColor,
  required var buttonColor,
  required Function function,
  var borderSideColor = blue,
  bool borderSide = false,
  double width = 165,
  double height = 65,
  double fontSize = 24,
  double radius = 35,

  //required var context,
}) =>
    Container(
      // width: MediaQuery.of(context).size.width / 2,
      width: width,
      height: height,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        //color: Colors.blue,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        color: buttonColor,
        shape: borderSide
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(color: borderSideColor, width: 2.5))
            : null,
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontStyle: italic,
          ),
        ),
      ),
    );

Widget textButton({
  required String text,
  var textColor = Colors.white54,
  bool underlineText = true,
  required Function function,
}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 22,
          color: textColor,
          fontWeight: FontWeight.w600,
          decoration: underlineText ? TextDecoration.underline : null,
          fontStyle: italic,
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller, //*
  required TextInputType type, //*
  bool ispassowrd = false, //*
  required String lable, //*
  IconData? prefix,
  IconData? suffix,
  Function? onSubmit, //*
  Function? onChange, //*
  Function? validate, //*
  Function? onTap, //*
  Function? suffixPressed, //*
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: ispassowrd,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onChanged: (s) {
        onChange!();
      },
      onTap: () {
        onTap!();
      },
      validator: (s) {
        validate!(s);
        if (s!.isEmpty) {
          return '  must not be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black87, width: 2)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black87, width: 2)),
        floatingLabelStyle: TextStyle(
          fontSize: 22,
          color: Colors.black87,
          fontStyle: italic,
        ),
        labelText: lable,
        labelStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            fontStyle: italic),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black87,
            style: BorderStyle.solid,
          ),
        ),
        prefixIcon: prefix != null ? Icon(prefix) : null,
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: () {
                  suffixPressed!();
                },
              )
            : null,
      ),
    );

textFormField({
  required TextEditingController controller, //*
  TextInputType keyboardType = TextInputType.text, //*
  bool ispassowrd = false,
  bool keyboardMultilines = false,
  int maxLines = 1,
  String? lable, //*
  String? hintText, //*
  double? feildHeight=60,
  bool enabledBorder = true,
  IconData? prefix,
  IconData? suffix,
  Function? onSubmit, //*
  Function? onChange, //*
  Function? validate, //*
  Function? onTap, //*
  Function? suffixPressed,
  Function? prefixPressed,
  var textAlignVertical = TextAlignVertical.center,
  var inputTextColor = Colors.white,
  double inputTextSize = 22,
  bool filled=false,
  var fillColor,
  var underLineBorderColor = Colors.white,
  var lableColor = Colors.white,
  double lableSize = 24,
  bool enableLable = true,
  var cursorColor = Colors.white70,
  var hintLableColor = Colors.white54,
  double hintLableSize = 22,
  bool floatingLable = true,
  var floatingLableColor=Colors.white54,
  var fontWeight=FontWeight.w500,
  //*
}) =>
    Container(
      height: feildHeight,
      child: TextFormField(
        style: TextStyle(
          fontSize: inputTextSize,
          color: inputTextColor,
          fontWeight: fontWeight,
          fontStyle: italic,
        ),
        cursorHeight: 25,
        cursorColor: cursorColor,
        textAlignVertical: textAlignVertical,
        textAlign: TextAlign.start,
        controller: controller,
        keyboardType: keyboardMultilines ? TextInputType.multiline : keyboardType,
        obscureText: false,
        onFieldSubmitted: (s) {
          onSubmit!();
        },
        decoration: InputDecoration(
          filled:filled ,
          fillColor:fillColor,
          floatingLabelBehavior:
              floatingLable ? null : FloatingLabelBehavior.never,
          enabledBorder: enabledBorder ? UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2)) : InputBorder.none,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2)),
          floatingLabelStyle: TextStyle(
            fontSize: 22,
            color: floatingLableColor,
            fontStyle: italic,
          ),
          labelText: enableLable ? lable : null,
          labelStyle: TextStyle(
              fontSize: lableSize,
              fontWeight: fontWeight,
              color: lableColor,
              fontStyle: italic,
              ),
              prefixIcon: prefix != null
              ? IconButton(
                  icon: Icon(prefix),
                  onPressed: () {
                    prefixPressed!(() {
                      enabledBorder = false;
                    });
                  },
                )
              : null,
          suffixIcon: suffix != null
              ? IconButton(
                  icon: Icon(suffix),
                  onPressed: () {
                    suffixPressed!(() {
                      enabledBorder = false;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color:underLineBorderColor,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );

outLinedFormField({
  required TextEditingController controller, //*
  TextInputType keyboardType = TextInputType.text, //*
  bool ispassowrd = false,
  bool? readOnly=false,
  bool keyboardMultilines = false,
  int maxLines = 1,
  String? lable, //*
  String? hintText, //*
  bool enabledBorder = true,
  double? feildHeight=60,
  IconData? prefix,
  IconData? suffix,
  Function? onSubmit, //*
  Function? onChange, //*
  Function? validate, //*
  Function? onTap, //*
  Function? suffixPressed,
  Function? prefixPressed,
  var textAlignVertical = TextAlignVertical.center,
  var inputTextColor = Colors.white,
  var suffixIconColor=Colors.white60,
  double inputTextSize = 22,
  bool filled=false,
   fillColor=Colors.white,
  var underLineBorderColor = Colors.white,
  var lableColor = Colors.white,
  double lableSize = 24,
  bool enableLable = true,
  var cursorColor = Colors.white70,
  var hintLableColor = Colors.white54,
  double hintLableSize = 22,
  bool floatingLable = true,
  var floatingLableColor=Colors.white54,
  //*
}) =>
    Container(
      height: feildHeight,
      child: TextFormField(
         readOnly: readOnly!,
        style: TextStyle(
          fontSize: inputTextSize,
          color: inputTextColor,
          fontWeight: FontWeight.w500,
          fontStyle: italic,
        ),
        cursorHeight: 30,
        cursorColor: cursorColor,
        textAlignVertical: textAlignVertical,
        textAlign: TextAlign.start,
        controller: controller,
        keyboardType: keyboardMultilines ? TextInputType.multiline : keyboardType,
        obscureText: false,
        onFieldSubmitted: (s) {
          onSubmit!();
        },
        decoration: InputDecoration(
          filled:filled ,
          fillColor:fillColor,
          floatingLabelBehavior:
              floatingLable ? null : FloatingLabelBehavior.never,
          enabledBorder: enabledBorder ? OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: fillColor, )) : InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: fillColor, )),
          floatingLabelStyle: TextStyle(
            fontSize: 22,
            color: floatingLableColor,
            fontStyle: italic,
          ),
          labelText: enableLable ? lable : null,
          labelStyle: TextStyle(
              fontSize: lableSize,
              fontWeight: FontWeight.w500,
              color: lableColor,
              fontStyle: italic,
              ),
              prefixIcon: prefix != null
              ? IconButton(
                  icon: Icon(prefix),
                  onPressed: () {
                    prefixPressed!(() {
                      enabledBorder = false;
                    });
                  },
                )
              : null,
          suffixIcon: suffix != null
              ? IconButton(
                  icon: Icon(suffix),
                  color: suffixIconColor,
                  onPressed: () {
                    suffixPressed!();
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color:underLineBorderColor,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );


dailyHomeCard({
  var color = Colors.white10,
  required String title,
   String? text,
  Function? ontap,
  String? backGround , //assets/images/70e2f9d4191154624f58c15eb684e27a.jpg
  var backGroundColor ,
  var ContentList,
}) =>
    GestureDetector(
      onTap: () {
        ontap!();
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
            width: 180,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: backGroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(children: [
              Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: backGround!=null?Image.asset(
                    backGround!,
                    fit: BoxFit.cover,
                    height: 180,
                    width: 180,
                  ):null,
              ),
              Center(
                child: Text(
                  title!,
                  style: TextStyle(

                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ])),
      ),
    );

goalsCard({
  var color,
  required String taskTitle,
  String? rule,
  String? startDate,
  String? deadLine,
  Function? onLongPress,
  List<String>? crumbTitlesList,
}) =>
    GestureDetector(
      onLongPress: () {
        onLongPress!();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Container(
          width: 330,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15.0,right: 15, bottom: 10,top: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        taskTitle,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 40,),
                    Expanded(
                      flex: 1,
                      child: Text(
                        rule!,
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ), //title & rule
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Crumbs : ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ), //crumbs Word
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 90,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: crumbsList!.length,
                      scrollDirection: Axis.vertical,
                      primary: false,
                      //solution of slow scroll//////
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return crumbsCard(
                            crumbTitle: crumbTitlesList![index]);
                      }),
                ), //crumbsListView
                //Crumbs card
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "2/10/2022",
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Deadline : " + "13/6/2023",
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ), //Start &deadline
               // // SizedBox(
               //    height: 20,
               //  ),
              ],
            ),
          ),
        ),
      ),
    );

crumbsCard({
  required String crumbTitle,
  Function? onPressed,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Center(
        child: Container(
          height: 35,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(219, 221, 184, 146),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    crumbTitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              // SizedBox(
              //   width: 20,
              // ),
              // IconButton(
              //     onPressed: () {
              //       onPressed!();
              //     },
              //     icon: Icon(
              //       Icons.more_vert_rounded,
              //       size: 25,
              //     ))
              // Icon(Icons.more_vert_rounded,size: 40,),
            ],
          ),
        ),
      ),
    );

dailyRoutinCard({
  bool checkBoxValue = true,
  Function? onCheckBoxChange,
  required Function? onTap,
  String? Title,
   List? taskTitle,
  List? taskStart,
  List? taskFinish,
}) {
  return GestureDetector(
    onTap: () {
      onTap!();
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 15, left: 15),
      child: Container(
          height: 120,
          width: double.infinity,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10,
                    left: 15,
                    right: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Title!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Open the doors to a productivity day",
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Image.asset(
                    "assets/images/studying.png",
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ],
          )),
    ),
  );
}

const leftTimeColor = Color.fromARGB(124, 255, 0, 0);

Widget taskCard({
  required String? taskTitle,
    Key? key,
  String? repeat = "Repeat",
  var taskTitleColor = Colors.black,
  var textColor = Colors.black,
  var checkBoxBorderColor=Colors.black,
  String? taskIconPath='assets/icons/love-letter.png',
  required Function? onTap,
  Function? editOnPressed,
  Function? deleteOnPressed,
  Function? onChangedCheckBox,
  required bool? checkBoxValue,
}) =>
    GestureDetector(
      key: key,
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 8, right: 5),
        child: Container(
          color: Color.fromARGB(255, 34, 34, 34),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.scale(
                scale: 1,
                child: Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(color: checkBoxBorderColor, width: 1)),
                    checkColor: Colors.white,
                    value: checkBoxValue,
                    activeColor: Colors.green,
                    onChanged: (newValue) {
                      checkBoxValue = newValue!;
                    }),
              ),
              Stack(
                  children: [
                Container(
                  alignment: Alignment.topLeft,
                  height: 110,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 242, 206, 239),//Color.fromARGB(255, 238, 191, 228)
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10, left: 15, right: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          taskIconPath!,
                          fit: BoxFit.cover,
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            taskTitle!,
                            style: TextStyle(
                              color: taskTitleColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 35,
                            width: 35,
                            child: FloatingActionButton(
                              elevation: 0,
                              backgroundColor: Color.fromARGB(
                                  114, 135, 135, 135),
                              onPressed: () {
                                editOnPressed!();
                              },
                              child: Icon(
                                Icons.edit_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 35,
                            width: 35,
                            child: FloatingActionButton(
                              elevation: 0,
                              backgroundColor: Color.fromARGB(
                                  114, 135, 135, 135),
                              onPressed: () {
                                deleteOnPressed!();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Icon(
                                  Icons.minimize_rounded,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Stack(children: [
                    Container(
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 238, 191, 228),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.event_repeat_rounded,
                              size: 20,
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: Text(
                                  "Repeat",
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w200,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                repeat!,
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w200,
                                    fontStyle: FontStyle.italic),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ]
              ),
            ],
          ),
        ),
      ),
    );



Widget buildFloatingSearchBar(context,FloatingSearchBarController controller) {
  final isPortrait =
      MediaQuery.of(context).orientation == Orientation.portrait;

  return Container(
    height: 500,
    child: FloatingSearchBar(

      controller:controller ,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 119, 119, 119),
      hint: 'Search...',
      hintStyle: TextStyle(color: Colors.white54),
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      openWidth: 600,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.search_rounded,color: Colors.white,),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],

      iconColor: Colors.white,
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    ),
  );
}