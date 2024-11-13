import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../resources/app_colours.dart';
import '../../../routes/router.gr.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, this.title});

  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors().backgroundPrimary01,
      // NOTE! Exemple of how to include a button on the left side of the app bar
      // leading: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Container(
      //     decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      //     child: IconButton(
      //         onPressed: () {
      //
      //         },
      //         icon: Icon(Icons.apps, color: AppColors().iconPrimary01)),
      //   ),
      // ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration:
                const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {
                  try {
                    context.router.push(const ProfileScreen());
                  } catch (e) {
                    print('Error navigating to profile: $e');
                  }
                },
                icon: Icon(Icons.person, color: AppColors().iconPrimary01)),
          ),
        ),
      ],
    );
  }
}
