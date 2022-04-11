import 'package:flutter/material.dart';

import '../models/test_tile_data.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSideScroller extends StatefulWidget {
  @override
  State<HomeSideScroller> createState() => _HomeSideScrollerState();
}

class _HomeSideScrollerState extends State<HomeSideScroller> {
  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToBottom());
    return //Horizontal Cards
        Container(
      height: 200.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 16, right: 6),
          reverse: true,
          shrinkWrap: true,
          controller: _scrollController,
          itemCount: testData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 20.0),
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Color(tests[index].background),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 15,
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
                    left: 30,
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
                    left: 35,
                    child: Text(
                      "Q: " + tests[index].quenum.toString() + " Questions",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    right: 25,
                    child: Text(
                      "Time: 3H",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
