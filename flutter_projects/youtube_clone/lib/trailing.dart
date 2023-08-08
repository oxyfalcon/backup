import 'package:flutter/material.dart';

class Trailing extends StatelessWidget {
  const Trailing({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      tileColor: Colors.white,
      minVerticalPadding: 15,
      horizontalTitleGap: 10,
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 3.0),
                  child: Icon(
                    Icons.schedule_outlined,
                    size: 15,
                  ),
                ),
                Text(
                  "30 mins",
                  style: TextStyle(
                    fontFamily: "Arial1",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 3.0),
                    child: Icon(
                      Icons.person_outlined,
                      size: 15,
                    ),
                  ),
                  Text(
                    "Ashlynn Dias",
                    style: TextStyle(
                      fontFamily: "Arial1",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        color: Color.fromRGBO(11, 48, 215, 1),
      ),
      title: Padding(
        padding: EdgeInsets.only(bottom: 4.0),
        child: Text(
          "Resume Consultation",
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: "Arial1"),
        ),
      ),
    );
  }
}
