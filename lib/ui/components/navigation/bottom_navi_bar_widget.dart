import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myanimelist_app/resources/app_colours.dart';
import 'package:myanimelist_app/ui/theme/app_text_theme.dart';

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
          buildBottomNaviButton(widget.selectedIndex, "Home", context, 0, containerHeight, () {
            if (widget.selectedIndex != 0) {
              // Route push to correct screen
            }
          }, Icons.home),
          buildBottomNaviButton(widget.selectedIndex, "Search", context, 1, containerHeight, () {
            if (widget.selectedIndex != 1) {
              // Route push to correct screen
            }
          }, Icons.search),
          buildBottomNaviButton(widget.selectedIndex, "Hub", context, 2, containerHeight, () {
            if (widget.selectedIndex != 2) {
              // Route push to correct screen
            }
          }, Icons.forum),
          buildBottomNaviButton(widget.selectedIndex, "Lists", context, 3, containerHeight, () {
            if (widget.selectedIndex != 3) {
              // Route push to correct screen
            }
          }, Icons.list)
        ],
      ),
    );
  }

  Widget buildBottomNaviButton(int selectedIndex, String text, BuildContext context, int position,
      double containerHeight, Function onClick, IconData icon) {
    double itemWidth = MediaQuery.of(context).size.width / 4;
    bool isSelected = position == selectedIndex;
    // icon, padding text
    return GestureDetector(
      onTap: onClick(),
      child: SizedBox(
        child: Stack(
          alignment: Alignment.center,
          children: [
            isSelected
                ? Container(
                    width: itemWidth,
                    decoration: BoxDecoration(color: AppColors().naviSelected01),
                  )
                : Container(
                    width: itemWidth,
                  ),
            Padding(
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
                      style: AppTextTheme().bottomNavBar.copyWith(height: 1, color: AppColors().iconPrimary01), //TODO create new style for text color
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
