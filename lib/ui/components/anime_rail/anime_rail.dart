import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/anime/anime_list.dart';
import '../../../data/models/common/common.dart';
import '../../theme/app_text_theme.dart';

class AnimeRail extends ConsumerStatefulWidget {
  const AnimeRail({super.key, required this.title, required this.nodes});

  final String title;
  final List<AnimeListData> nodes;

  @override
  ConsumerState<AnimeRail> createState() => _AnimeRailState();
}

class _AnimeRailState extends ConsumerState<AnimeRail> {
  GestureDetector buildAnimeRailItem(BuildContext context, AnimeListNode node) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Column(
          children: <Widget>[
            Image.network(
              node.mainPicture.large,
              height: 150,
              cacheHeight: 150,
            ),
            const SizedBox(height: 10),
            Text(
              node.title,
              style: AppTextTheme().bodyNormal.copyWith(height: 1, color: Colors.white),
            ),
          ],
        ),
      ),
    );

    // return Row(
    //   children: <Widget>[

    //     SizedBox(
    //       width: 210,
    //       child: ListTile(
    //         title: Text(
    //           node.title,
    //           style: AppTextTheme().bodyNormal.copyWith(height: 1, color: Colors.white),
    //         ),
    //         leading: Image.network(
    //           node.mainPicture.large,
    //           height: 150,
    //           cacheHeight: 150,
    //         ),
    //         onTap: () {},
    //         subtitle: Text(
    //           'node.title',
    //           style: AppTextTheme().bodyNormal.copyWith(height: 1, color: Colors.white),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          widget.title,
          style: AppTextTheme().h3.copyWith(height: 1, color: Colors.white),
        ),
        if (widget.nodes.isEmpty)
          Container()
        else
          SizedBox(
            height: 200,
            child: ListView.separated(
              itemCount: widget.nodes.length,
              itemBuilder: (BuildContext context, int index) {
                final AnimeListData item = widget.nodes[index];
                return buildAnimeRailItem(context, item.node);
              },
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 8,
                );
              },
            ),
          ),
      ],
    );
  }
}
