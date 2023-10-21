import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: selectedBackgroundColor,
        body: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
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
                              height: size.height / 2.3,
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

                /// ---------------------------
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// PAGE INDICATOR
                      SmoothPageIndicator(
                        controller: pageController,
                        count: listOfItems.length,
                        effect: const ExpandingDotsEffect(
                          spacing: 6.0,
                          radius: 10.0,
                          dotWidth: 10.0,
                          dotHeight: 10.0,
                          expansionFactor: 3.8,
                          dotColor: Colors.grey,
                          activeDotColor: ProductColor.btnColor,
                        ),
                        onDotClicked: (newIndex) {
                          setState(() {
                            currentIndex = newIndex;
                            pageController.animateToPage(newIndex,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          });
                        },
                      ),
                      currentIndex == 3

                          /// GET STARTED BTN
                          ? GetStartBtn(size: size, textTheme: textTheme)

                          /// SKIP BTN
                          : SkipBtn(
                              size: size,
                              textTheme: textTheme,
                              onTap: () {
                                setState(() {
                                  pageController.animateToPage(3,
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      curve: Curves.fastOutSlowIn);
                                });
                              },
                            )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
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
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: size.width / 1.5,
      height: size.height / 13,
      decoration: BoxDecoration(
          border: Border.all(
            color: ProductColor.btnBorderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: onTap,
        splashColor: ProductColor.btnBorderColor,
        child: Center(
          child: Text('skip'.tr(), style: textTheme.displaySmall),
        ),
      ),
    );
  }
}
