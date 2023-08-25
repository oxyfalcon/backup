import 'package:flutter/material.dart';
import 'package:youtube_clone/utils/card_elements.dart';
import 'package:youtube_clone/utils/all_colors.dart';
import 'package:youtube_clone/utils/card_title.dart';
import 'package:youtube_clone/profile_page/video_list.dart';

class ProfilePage extends StatelessWidget with CustomTextStyle {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorMap.greyBackGround,
        body: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CardTitle(text: "Videos"),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "See All",
                          style: super.textCustomStyle(),
                        )),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints.loose(const Size.fromHeight(300)),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child: VideoList()),
                  ],
                ),
              ),
              CustomFilledButton(
                buttonStyle: ButtonStyle(
                  overlayColor: CustomSplashColor(),
                  backgroundColor: WhiteButtonColor(),
                  shape: CustomShape(),
                  padding: CustomPadding(),
                ),
                text: "+   Record Video",
                color: ColorMap.bluePrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontfamily: "Arial1",
              )
            ],
          ),
        ),
      ),
    );
  }
}
