import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/common/common.dart';
import '../../theme/app_text_theme.dart';

class AnimeRail extends ConsumerStatefulWidget {
  const AnimeRail({super.key, required this.title, required this.item});

  final String title;
  final List<AnimeData>? item;

  @override
  ConsumerState<AnimeRail> createState() => _AnimeRailState();
}

class _AnimeRailState extends ConsumerState<AnimeRail> {
  static const double kDefaultItemWidth = 110.0;
  static const double kDefaultItemHeight = 165.0;

  Widget buildAnimeRailItem(BuildContext context, AnimeNode node) {
    return GestureDetector(
      onTap: () {
        // TODO(luistxd): send to anime detail with router push
        print(node.id);
      },
      onLongPress: () {
        // TODO(luistxd): open popup with anime details overview (smaller version)
        print('Long ${node.id}');
      },
      child: node.main_picture != null
          ? Card(
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: kDefaultItemHeight,
                    width: kDefaultItemWidth,
                    child: node.main_picture != null
                        ? CachedNetworkImage(
                            imageUrl: node.main_picture!.medium,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              // TODO(luistxd): replace with placehold asset
                              print('Error: $error');
                              return const Center(
                                child: Text('Error'),
                              );
                            },
                            errorListener: (e) {
                              debugPrint('Image Exception is: ${e.runtimeType}');
                            },
                          )
                        : Container(), // TODO(luistxd): replace with placehold asset
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: kDefaultItemWidth,
                    child: Text(
                      node.title,
                      style: AppTextTheme().bodySmall.copyWith(height: 1, color: Colors.white),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.item != null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Column(
              children: <Widget>[
                Padding(
                  // Rail Title
                  padding: const EdgeInsets.only(left: 5.0, bottom: 3.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.title,
                      style: AppTextTheme().h5.copyWith(height: 1, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    itemCount: widget.item!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final AnimeData item = widget.item![index];
                      return buildAnimeRailItem(context, item.node);
                    },
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 5.0,
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
