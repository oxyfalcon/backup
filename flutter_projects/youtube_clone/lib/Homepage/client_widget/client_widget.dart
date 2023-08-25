import 'package:flutter/material.dart';
import 'package:youtube_clone/Homepage/client_widget/client_list.dart';
import 'package:youtube_clone/Homepage/client_widget/client_list_head.dart';
import 'package:youtube_clone/Homepage/client_widget/client_total_row.dart';
import 'package:youtube_clone/utils/all_colors.dart';

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
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClientTotalRow(),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(top: 25.0, bottom: 12.0),
                  child: ClientListHeader(),
                ),
                ClientList()
              ],
            )),
      ),
    );
  }
}
