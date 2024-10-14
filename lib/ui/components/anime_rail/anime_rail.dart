import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myanimelist_app/data/models/anime/anime_list.dart';
import 'package:myanimelist_app/ui/theme/app_text_theme.dart';

import '../../../data/models/common/common.dart';

class AnimeRail extends ConsumerStatefulWidget {
  const AnimeRail({super.key, required this.title, required this.nodes});

  final String title;
  final List<AnimeListData> nodes;

  @override
  ConsumerState<AnimeRail> createState() => _AnimeRailState();
}

class _AnimeRailState extends ConsumerState<AnimeRail> {
  Row buildAnimeRailItem(BuildContext context, AnimeListNode node) {
    return Row(
      children: <Widget>[
        Image.network(
          node.mainPicture.large,
          height: 100,
          cacheHeight: 100,
        ),
        Column(
          children: <Widget>[
            Text(
              node.title,
              style: AppTextTheme()
                  .bodyNormal
                  .copyWith(height: 1, color: Colors.white),
            ),
            // SizedBox(width: 10),
            // Text(
            //   item.node.id.toString(),
            //   style: AppTextTheme()
            //       .bodyNormal
            //       .copyWith(height: 1, color: Colors.white),
            // ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title),
        if (widget.nodes.isEmpty)
          Container()
        else
          ListView.builder(
            itemCount: widget.nodes.length,
            itemBuilder: (BuildContext context, int index) {
              final AnimeListData item = widget.nodes[index];
              return buildAnimeRailItem(context, item.node);
            },
          ),
      ],
    );
  }
}
