import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:slothy/modules/note/addNoteScreen.dart';

import '../../shared/style/colors.dart';

class noteScreen extends StatefulWidget {
  const noteScreen({Key? key}) : super(key: key);

  @override
  State<noteScreen> createState() => _noteScreenState();
}

class _noteScreenState extends State<noteScreen> {
  List<double> height = [
    115,
    190,
    120,
    100,
    140,
    220,
    200,
    130,
    175,
    189,
    156,
    195,
    175,
    120,
    156,
    160,
    190,
    155,
  ];
  bool important = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: darkBackGround,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              height: 1000,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 8,
                  itemCount: height.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {},
                    child: Container(
                      // height: height[index],
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: index.isEven
                            ? BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25))
                            : BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 2,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Container(
                                      height: 2,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 120.0),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (important == true)
                                        important = false;
                                      else
                                        important = true;
                                    });
                                  },
                                  icon: important
                                      ? Icon(
                                          Icons.star_rounded,
                                          size: 30,
                                        )
                                      : Icon(
                                          Icons.star_border_rounded,
                                          size: 30,
                                        )),
                            ),
                            Text(
                              "Title",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Title  Title  Title  Title  Title  Title  Title  Title  Title  Title  Title"
                              "  Title  Title  Title  Title  Title  Title  Title  Title  "
                              "Title  Title  Title  Title  Title  Title  Title  ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
            Positioned(
              right: 30,
              bottom:10,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return addNoteScreen();
                  }
                  )
                  );
                },
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                backgroundColor: Colors.white60,
              ),
            ),
          ]
        ),
      ),
    );
  }
}
