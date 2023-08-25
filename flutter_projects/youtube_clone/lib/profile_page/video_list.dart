import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/all_colors.dart';

class VideoList extends StatelessWidget {
  const VideoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: clientList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Stack(
                children: [
                  SizedBox(
                    height: 400,
                    width: 300,
                    child: Image.asset(
                      clientList[index]['Image_url'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  FilledButton(
                      style: ButtonStyle(shape: PlayButtonShape()),
                      onPressed: () {},
                      child: const Icon(Icons.play_arrow))
                ],
              ),
            ));
  }
}

class PlayButtonShape extends CircleBorder
    implements MaterialStateOutlinedBorder {
  @override
  OutlinedBorder? resolve(Set<MaterialState> states) => const CircleBorder(
      side: BorderSide(color: ColorMap.whiteBackground, width: 3));
}
