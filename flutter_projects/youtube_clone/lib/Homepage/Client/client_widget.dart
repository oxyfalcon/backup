import 'package:flutter/material.dart';
import 'package:youtube_clone/Homepage/Client/client_list.dart';
import 'package:youtube_clone/Homepage/Client/client_list_head.dart';
import 'package:youtube_clone/Homepage/Client/client_total_row.dart';
import 'package:youtube_clone/all_colors.dart';

class ClientWidget extends StatelessWidget {
  const ClientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        color: ColorMap.whiteBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClientTotalRow(),
                Divider(),
                ClientListHeader(),
                ClientList()
              ],
            )),
      ),
    );
  }
}
