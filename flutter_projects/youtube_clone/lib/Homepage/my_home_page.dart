import 'package:flutter/material.dart';
import 'package:youtube_clone/HomePage/client_widget/client_widget.dart';
import 'package:youtube_clone/HomePage/custom_listTile/leading.dart';
import 'package:youtube_clone/HomePage/custom_listTile/trailing.dart';
import 'package:youtube_clone/HomePage/revenue_widget/revenue_widget.dart';
import 'package:youtube_clone/utils/all_colors.dart';
import 'package:youtube_clone/utils/card_title.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: ColorMap.whiteBackground,
        title: const Text(
          "Dashboard",
          style:
              TextStyle(fontFamily: "Arial1", color: ColorMap.globalMainText),
        ),
        centerTitle: true,
      ),
      backgroundColor: ColorMap.greyBackGround,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        shrinkWrap: true,
        children: <Widget>[
          const CardTitle(text: 'Starts in 5 minutes'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Card(
                surfaceTintColor: Colors.white,
                color: ColorMap.whiteBackground,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    side: BorderSide(color: ColorMap.bluePrimary)),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Leading(),
                      ),
                      const Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Trailing(),
                          )),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: ColorMap.bluePrimary,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: CardTitle(
              text: "Revenue",
            ),
          ),
          const RevenueWidget(),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: CardTitle(text: "Clients"),
          ),
          const ClientWidget(),
        ],
      ),
    );
  }
}
