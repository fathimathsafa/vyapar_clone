import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/common/widget/verticle_divider.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';

class DateReciptWidget extends StatelessWidget {
  DateReciptWidget({super.key, this.receiptNumber, this.date});
  final String? receiptNumber;
  final String? date;

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const VerticleDivider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .015),
            child: Row(
              children: [
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Receipt No.",
                      style: interFontBlack(context, color: Colorconst.cGrey),
                    ),
                    SizedBox(
                      height: screenHeight * .0009,
                    ),
                    Row(
                      children: [
                        Text(
                          receiptNumber ?? "1",
                          style:
                              interFontBlack(context, color: Colorconst.cBlack),
                        ),
                        SizedBox(
                          width: screenWidth * .009,
                        ),
                        Transform.rotate(
                            angle: -1.55,
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 12,
                              color: Colors.black45,
                            ))
                      ],
                    ),
                  ],
                )),
                Container(
                  height: screenHeight * .04,
                  width: 1,
                  color: Colors.black12,
                ),
                SizedBox(
                  width: screenWidth * .03,
                ),
                Flexible(
                    child: InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: interFontBlack(context, color: Colorconst.cGrey),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            date ?? "9/20/2024",
                            style: interFontBlack(context,
                                color: Colorconst.cBlack),
                          ),
                          SizedBox(
                            width: screenWidth * .009,
                          ),
                          Transform.rotate(
                              angle: -1.55,
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 12,
                                color: Colors.black45,
                              ))
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * .01,
          ),
        ],
      ),
    );
  }
}
