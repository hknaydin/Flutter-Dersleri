import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harpia_project/utils/MySharedPreferences.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => FaqScreenState();
}

class FaqScreenState extends State<FaqScreen> {
  int selectedIndex = -1;
  Color selectedBackgroundColor = Colors.white; // Seçilen arka plan rengi

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: selectedBackgroundColor,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Text(
                'frequently_asked_question'.tr(),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 20),
          child: ListView.builder(
            itemCount: itemData.length,
            itemBuilder: (context, index) {
              final item = itemData[index];
              final isSelected = selectedIndex == index;
              return Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (selectedIndex == index) {
                          selectedIndex = -1;
                        } else {
                          selectedIndex = index;
                        }
                      });
                    },
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            item.headerItem,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.bold,
                              color: item.colorsItem,
                            ),
                          ),
                          trailing: Icon(
                            isSelected ? Icons.expand_less : Icons.expand_more,
                            color: item.colorsItem,
                          ),
                        ),
                        if (isSelected)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 10.0),
                            child: Text(
                              item.discription,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 15,
                                height: 1.3,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<ItemModel> itemData = <ItemModel>[
    ItemModel(
      headerItem: 'what_is_harpia'.tr(),
      discription: 'diabet'.tr(),
      colorsItem: Colors.black,
    ),
    ItemModel(
      headerItem: 'where_to_use'.tr(),
      discription: 'diabet'.tr(),
      colorsItem: Colors.black,
    ),
    ItemModel(
      headerItem: 'lifespan_of_device'.tr(),
      discription: 'diabet'.tr(),
      colorsItem: Colors.black,
    ),
    ItemModel(
      headerItem: 'who_are_we'.tr(),
      discription: 'answer_fourth'.tr(),
      colorsItem: Colors.black,
    ),
    ItemModel(
      headerItem: 'lifespan_of_device'.tr(),
      discription: 'diabet'.tr(),
      colorsItem: Colors.black,
    ),
    ItemModel(
      headerItem: 'who_are_we'.tr(),
      discription: 'answer_fourth'.tr(),
      colorsItem: Colors.black,
    ),
    ItemModel(
      headerItem: 'lifespan_of_device'.tr(),
      discription: 'diabet'.tr(),
      colorsItem: Colors.black,
    ),
    ItemModel(
      headerItem: 'who_are_we'.tr(),
      discription: 'answer_fourth'.tr(),
      colorsItem: Colors.black,
    ),
    ItemModel(
      headerItem: 'lifespan_of_device'.tr(),
      discription: 'diabet'.tr(),
      colorsItem: Colors.black,
    ),
    ItemModel(
      headerItem: 'who_are_we'.tr(),
      discription: 'answer_fourth'.tr(),
      colorsItem: Colors.black,
    ),
    ItemModel(
      headerItem: 'lifespan_of_device'.tr(),
      discription: 'diabet'.tr(),
      colorsItem: Colors.black,
    ),
    ItemModel(
      headerItem: 'who_are_we'.tr(),
      discription: 'answer_fourth'.tr(),
      colorsItem: Colors.black,
    ),
  ];
}

class ItemModel {
  String headerItem;
  String discription;
  Color colorsItem;

  ItemModel({
    required this.headerItem,
    required this.discription,
    required this.colorsItem,
  });
}
