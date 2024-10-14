import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/user/user.dart';
import '../../../resources/app_colours.dart';

import '../../theme/app_text_theme.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();

  /**
   * Campos
   * 
   * (EditProfile)
   * Fotografia
   * username
   * Gender
   * BDay
   * Location
   * 
   * Account CreatedAt
   * 
   * Scale de Plan/Watching/Dropped/Completed/onHold (Anime e Manga)
   * 
   * Favourite Animes, Manga, Chars e People
   * 
   * App Icon/Theme
   * Total Anime/Manga
   * Days Watch/Read
   * 
   * Ideas: (To analyze if worth)
   * Watching this season(?)
   * 
   */
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  UserDetail user = UserDetail(
    id: 'b3eda0fc-def5-4ace-b6fc-048b7fd61afb',
    username: 'luistxd',
    photoUrl:
        'https://cdn.myanimelist.net/s/common/userimages/cb7ed552-a026-4958-91ab-91ca6b654a92_225w?s=c575a70ac7c0f75ccdd7d2612ae83989',
    createdAt: DateTime.now(),
    name: 'Luis Dias',
  );

  final ButtonStyle editButtonStyle = TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    alignment: Alignment.center,
    // backgroundColor: Colors.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(90),
    ),
  );

  AppBar buildProfileAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors().backgroundPrimary01,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: Icon(
              Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios_new,
              color: AppColors().iconPrimary01,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildProfileAppBar(context),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Column(
                children: <Widget>[
                  // TODO(luistxd): validar que elems estão centrados
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    // TODO(luistxd): Passar a constante os tamanhos das imagens.
                    child: Image.network(
                      user.photoUrl,
                      cacheHeight: 80,
                      cacheWidth: 80,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '@${user.username}',
                      style: AppTextTheme().bodyNormal.copyWith(height: 1, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: OutlinedButton.icon(
                  label: const Text(
                    'Edit Profile',
                  ),
                  style: editButtonStyle,
                  onPressed: () {
                    //TODO:
                  },
                  icon: const Icon(Icons.edit)),
            ),
          ],
        ),
      ),
    );
  }
}
