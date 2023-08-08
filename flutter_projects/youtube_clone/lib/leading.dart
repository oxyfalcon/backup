import 'package:flutter/material.dart';

class Leading extends StatelessWidget {
  const Leading({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
      child: Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(11, 48, 215, 1)),
        child: const SizedBox(
          height: 80,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    "09:45",
                    style: TextStyle(
                      color: Color.fromRGBO(229, 234, 255, 1),
                      fontFamily: "Arial1",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 11.0),
                  child: Text(
                    "Join",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(229, 234, 255, 1),
                        fontFamily: "Arial1",
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
