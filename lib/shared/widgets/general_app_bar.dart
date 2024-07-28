import 'package:flutter_svg/svg.dart';
import 'package:ringo_test/core/constants/app_colors.dart';
import 'package:ringo_test/core/extensions/context_extension.dart';

import 'package:flutter/material.dart';

import '../../core/resources/resources.dart';

class GeneralAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const GeneralAppBar({
    super.key,
    required this.title,
  });

  @override
  State<GeneralAppBar> createState() => _GeneralAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(55);
}

class _GeneralAppBarState extends State<GeneralAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 80),
      child: AppBar(
        elevation: 1,
        shadowColor: AppColors.lightGrey,
        title: Text(
          widget.title,
          style: context.textTheme.headlineLarge,
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
                onPressed: () {},
                icon: Badge(
                    smallSize: 10,
                    alignment: const Alignment(0.6, -0.5),
                    child: SvgPicture.asset(SVGAssets.notification))),
          )
        ],
      ),
    );
  }
}
