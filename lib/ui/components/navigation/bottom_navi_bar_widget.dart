import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myanimelist_app/resources/app_colours.dart';
import 'package:myanimelist_app/ui/theme/app_text_theme.dart';

import '../../../routes/router.gr.dart';

class BottomNaviBar extends ConsumerStatefulWidget {
  const BottomNaviBar({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  ConsumerState<BottomNaviBar> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends ConsumerState<BottomNaviBar> {
  @override
  Widget build(BuildContext context) {
    double containerHeight = Platform.isAndroid ? 70 : 80;
    return Container(
      height: containerHeight,
      color: AppColors().naviUnselected01,
      child: Row(
        children: [
          buildBottomNaviButton(
              widget.selectedIndex, "Home", context, 0, containerHeight, () {
            if (widget.selectedIndex != 0) {
              context.router.replace(const HomeScreen());
            }
          }, Icons.home),
          buildBottomNaviButton(
              widget.selectedIndex, "Anime", context, 1, containerHeight, () {
            if (widget.selectedIndex != 1) {
              context.router.replace(const SearchScreen());
            }
          }, Icons.tv),
          buildBottomNaviButton(
              widget.selectedIndex, "Manga", context, 2, containerHeight, () {
            if (widget.selectedIndex != 2) {
              // Route push to correct screen
            }
          }, Icons.import_contacts),
          buildBottomNaviButton(
              widget.selectedIndex, "More", context, 3, containerHeight, () {
            if (widget.selectedIndex != 3) {
              // Route push to correct screen
            }
          }, Icons.grid_view)
        ],
      ),
    );
  }

  Widget buildBottomNaviButton(
      int selectedIndex,
      String text,
      BuildContext context,
      int position,
      double containerHeight,
      VoidCallback onClick,
      IconData icon) {
    double itemWidth = MediaQuery.of(context).size.width / 4;
    bool isSelected = position == selectedIndex;
    // icon, padding text
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: itemWidth,
        height: containerHeight,
        color: isSelected ? AppColors().naviSelected01 : Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(bottom: Platform.isAndroid ? 6 : 14, top: 8),
          child: Column(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 24.0,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: itemWidth - 10),
                padding: EdgeInsets.only(top: 3),
                child: Text(
                  text,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: AppTextTheme().bottomNavBar.copyWith(
                      height: 1,
                      color: AppColors()
                          .iconPrimary01), //TODO create new style for text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
