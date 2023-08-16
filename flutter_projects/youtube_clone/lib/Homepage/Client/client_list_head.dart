import 'package:flutter/cupertino.dart';
import 'package:youtube_clone/Homepage/revenue_widget/card_elements.dart';

class ClientListHeader extends StatelessWidget {
  const ClientListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0, left: 8.0),
            child: SecondaryTitleWithinCard(text: "TOP 5 CLIENTS"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, left: 8.0),
            child: SecondaryTitleWithinCard(text: "SESSIONS"),
          ),
        ],
      ),
    );
  }
}
