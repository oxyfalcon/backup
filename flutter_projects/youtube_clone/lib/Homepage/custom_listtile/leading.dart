import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/all_colors.dart';

class Leading extends StatelessWidget {
  const Leading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorMap.bluePrimary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "09:45",
            style: TextStyle(
              color: Color.fromRGBO(229, 234, 255, 1),
              fontFamily: "Arial1",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Join",
            style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(229, 234, 255, 1),
                fontFamily: "Arial1",
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
