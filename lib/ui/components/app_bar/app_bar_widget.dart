import 'package:flutter/material.dart';
import 'package:myanimelist_app/resources/app_colours.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, this.title});

  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors().backgroundPrimary01,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
          child: IconButton(
              //TODO text button com texto a dizer Menu, sem background?
              onPressed: () {
                //TODO send to profile page
              },
              icon: Icon(Icons.apps, color: AppColors().iconPrimary01)),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {
                  //TODO send to profile page
                },
                icon: Icon(Icons.person, color: AppColors().iconPrimary01)),
          ),
        ),
      ],
    );
  }
}
