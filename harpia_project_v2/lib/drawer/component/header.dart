import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'bottom_user_info.dart';

class CustomDrawerHeader extends StatelessWidget {
  final bool isColapsed;

  const CustomDrawerHeader({
    Key? key,
    required this.isColapsed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 80,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            'assets/images/dikeycizgili.svg',
            width: 30,
            height: 30,
            color: Colors.red,
          ),
          isColapsed
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://t3.ftcdn.net/jpg/02/99/21/98/360_F_299219888_2E7GbJyosu0UwAzSGrpIxS0BrmnTCdo4.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
