import 'package:flutter/cupertino.dart';
import 'package:youtube_clone/utils/card_elements.dart';

class ClientListHeader extends StatelessWidget {
  const ClientListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SecondaryTitleWithinCard(text: "TOP 5 CLIENTS"),
          SecondaryTitleWithinCard(text: "SESSIONS"),
        ],
      ),
    );
  }
}
