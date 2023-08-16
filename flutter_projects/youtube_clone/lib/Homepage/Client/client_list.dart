import 'package:flutter/material.dart';
import 'package:youtube_clone/Homepage/revenue_widget/card_elements.dart';
import 'package:youtube_clone/all_colors.dart';

class ClientList extends StatelessWidget with CustomText {
  const ClientList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: clientList.length,
        itemBuilder: (context, index) => Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    clientList[index]["Image_url"],
                  ),
                ),
                Expanded(
                  child: ListTile(
                      title: super.textCustom(
                          text: clientList[index]['Name'],
                          defaultFontFamily: "Arial1",
                          inputColor: ColorMap.clientName)),
                ),
                super.textCustom(
                    text: clientList[index]['Sessions'].toString(),
                    defaultFontFamily: "Arial1",
                    inputFontSize: 18,
                    inputColor: ColorMap.clientSession),
              ],
            ));
  }
}
