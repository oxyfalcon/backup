import 'package:flutter/material.dart';
import 'package:youtube_clone/all_colors.dart';

class ClientList extends StatelessWidget {
  const ClientList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: clientList.length,
        itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                child: clientList[index]["Image_url"],
              ),
              title: Text(clientList[index]['Name']),
              trailing: Text(clientList[index]['Sessions'].toString()),
            ));
  }
}
