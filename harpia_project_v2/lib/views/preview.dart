import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harpia_project/utils/ProductColor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../previewmodel/preview_model.dart';
import '../utils/MySharedPreferences.dart';
import 'loginscreen.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => PreviewPageState();
}

class PreviewPageState extends State<PreviewPage> {
  PageController pageController = PageController(initialPage: 0);
  Color selectedBackgroundColor = Colors.white; // Seçilen arka plan rengi

  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadBackgroundColor();
  }

  void loadBackgroundColor() async {
    int colorValue = await MySharedPreferences.getBackgroundColor();
    setState(() {
      selectedBackgroundColor = Color(colorValue);
    });
  }

  /// Anime
  Widget animationDo(
    int index,
    int delay,
    Widget child,
  ) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }

  void handleSkip() {
    if (currentIndex < listOfItems.length - 1) {
      setState(() {
        currentIndex += 1;
        pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.fastOutSlowIn,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: selectedBackgroundColor,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: pageController,
                itemCount: listOfItems.length,
                padEnds: false,
                onPageChanged: (newIndex) {
                  setState(() {
                    currentIndex = newIndex;
                  });
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: ((context, index) {
                  return SizedBox(
                    width: size.width,
                    height: size.height,
                    child: Column(
                      children: [
                        /// IMG
                        Container(
                          padding: EdgeInsets.zero,
                          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          width: size.width,
                          height: size.height / 2.5,
                          child: animationDo(
                            index,
                            100,
                            Image.asset(listOfItems[index].img),
                          ),
                        ),

                        /// TITLE TEXT
                        animationDo(
                          index,
                          300,
                          Text(
                            listOfItems[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30.0),
                          ),
                        ),

                        /// SUBTITLE TEXT
                        animationDo(
                          index,
                          500,
                          Text(
                            listOfItems[index].subTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List<Widget>.generate(listOfItems.length, (int index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 10,
                    width: currentIndex == index ? 20 : 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: currentIndex == index ? Colors.black : Colors.grey,
                    ),
                  );
                }),
              ),
            ),

            /// Skip Button
            currentIndex == 3
                ? GetStartBtn(size: size, textTheme: textTheme)
                : SkipBtn(
                    size: size,
                    textTheme: textTheme,
                    onTap: handleSkip, // Handle skip logic
                  ),
            SizedBox(
              height: 70.h,
            )

            /// Page Indicator
          ],
        ),
      ),
    );
  }
}

class GetStartBtn extends StatefulWidget {
  const GetStartBtn({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  State<GetStartBtn> createState() => _GetStartBtnState();
}

class _GetStartBtnState extends State<GetStartBtn> {
  bool isLoading = false;

  loadingHandler() {
    setState(() {
      isLoading = true;
      Future.delayed(const Duration(seconds: 2)).then((value) {
        isLoading = false;
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (_) => const LoginScreen()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loadingHandler,
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: widget.size.width / 1.5,
        height: widget.size.height / 13,
        decoration: BoxDecoration(
            color: ProductColor.btnColor,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: isLoading
              ? const Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                )
              : Text('get_started_now'.tr(),
                  style: widget.textTheme.headlineMedium),
        ),
      ),
    );
  }
}

class SkipBtn extends StatelessWidget {
  const SkipBtn({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: size.width / 1.5,
      height: size.height / 13,
      decoration: BoxDecoration(
        border: Border.all(
          color: ProductColor.btnBorderColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: onTap,
        splashColor: ProductColor.btnBorderColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'next'.tr(),
                      style: textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
