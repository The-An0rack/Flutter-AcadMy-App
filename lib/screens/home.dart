import 'package:flutter/material.dart';
import 'package:flutter_acadmy_app/data/homedata.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //Handle Indicator
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 8.0),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            //Custum app Bar
            Container(
              margin: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(onTap: () {}, child: Icon(Icons.menu)),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/image/user.jpg'),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back",
                    style: GoogleFonts.inter(
                        fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Hannah Baker",
                    style: GoogleFonts.inter(
                        fontSize: 30.0, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

            //Horizontal Cards
            Container(
              height: 200.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 16, right: 6),
                  itemCount: testData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 20.0),
                      height: 200,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Color(tests[index].background),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 30,
                            top: 30,
                            child: Text(
                              "Full Test: ",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 50,
                            top: 65,
                            child: Text(
                              tests[index].title,
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 50,
                            right: 50,
                            child: Text(
                              "Q: " +
                                  tests[index].quenum.toString() +
                                  " Questions",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            /*Padding(
              padding: EdgeInsets.only(left: 16, bottom: 13, top: 29),
              child: Row(
                children: [
                  Text(
                    "Topics: ",
                  ),
                  Row(
                    children: map<Widget>(datas, (index, selected)),
                  )
                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
