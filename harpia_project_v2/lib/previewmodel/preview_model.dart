import 'package:easy_localization/easy_localization.dart';

class PreviewItems {
  final String img;
  final String title;
  final String subTitle;

  ///
  PreviewItems({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<PreviewItems> listOfItems = [
  PreviewItems(
    img: "assets/images/1.png",
    title: 'take_care_of_your_health'.tr(),
    subTitle: 'please_walk_everyday'.tr(),
  ),
  PreviewItems(
    img: "assets/images/2.png",
    title: "Share your training\nprograms",
    subTitle:
        "There will be many people who\n want hear your stories and\n experiences",
  ),
  PreviewItems(
    img: "assets/images/3.png",
    title: "Find another doctor near\nyou",
    subTitle: "Make your friendship and create a\nnew community",
  ),
  PreviewItems(
    img: "assets/images/logo.png",
    title: "Find another doctor near\nyou",
    subTitle: "Make your friendship and create a\nnew community",
  ),
];
