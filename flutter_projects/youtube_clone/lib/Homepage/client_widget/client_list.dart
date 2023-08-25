import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/card_elements.dart';
import 'package:youtube_clone/utils/all_colors.dart';

class ClientList extends StatelessWidget with CustomTextStyle {
  const ClientList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                      title: Text(clientList[index]['Name'],
                          style: super.textCustomStyle(
                              defaultFontFamily: "Arial1",
                              inputColor: ColorMap.clientName))),
                ),
                Text(clientList[index]['Sessions'].toString(),
                    style: super.textCustomStyle(
                        defaultFontFamily: "Arial1",
                        inputFontSize: 18,
                        inputColor: ColorMap.clientSession))
              ],
            ));
  }
}
