import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/all_colors.dart';

class Trailing extends StatelessWidget {
  const Trailing({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Resume Consultation",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: "Arial1"),
          ),
          Row(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 3.0),
                    child: Icon(
                      Icons.schedule_outlined,
                      color: ColorMap.cardSecondaryText,
                      size: 15,
                    ),
                  ),
                  Text(
                    "30 mins",
                    style: TextStyle(
                        fontFamily: "Arial1",
                        fontSize: 13,
                        color: ColorMap.cardSecondaryText),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 3.0),
                      child: Icon(
                        Icons.person_outlined,
                        color: ColorMap.cardSecondaryText,
                        size: 15,
                      ),
                    ),
                    Text(
                      "Ashlynn Dias",
                      style: TextStyle(
                          fontFamily: "Arial1",
                          color: ColorMap.cardSecondaryText),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
