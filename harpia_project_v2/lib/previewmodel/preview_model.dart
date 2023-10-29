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
    title: 'exercise'.tr(),
    subTitle: 'exercise_answer'.tr(),
  ),
  PreviewItems(
    img: "assets/images/3.png",
    title: 'healthy_eating'.tr(),
    subTitle: 'healthy_eating_answer'.tr(),
  ),
  PreviewItems(
    img: "assets/images/logo.png",
    title: 'mental'.tr(),
    subTitle: 'mental_answer'.tr(),
  ),
];
