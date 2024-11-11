import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/models/common/common.dart';
import '../../../resources/app_colours.dart';
import '../../../utils/Constants.dart';
import '../../theme/app_text_theme.dart';
import '../tag/anime_tag.dart';

class AnimeCard extends ConsumerStatefulWidget {
  const AnimeCard({super.key, required this.item});

  final AnimeNode item;

  @override
  ConsumerState<AnimeCard> createState() => _AnimeCardState();
}

class _AnimeCardState extends ConsumerState<AnimeCard> {
  static const int kDefaultNumTags = 2;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: AppColors().backgroundPrimary01,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Column(
          children: [
            Stack(
              children: [
                if (widget.item.main_picture != null) ...[
                  Container(
                    width: kDefaultAnimeCardWidth,
                    height: kDefaultAnimeCardHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: CachedNetworkImage(
                      imageUrl: widget.item.main_picture!.large ?? widget.item.main_picture!.medium,
                      width: double.infinity,
                      height: double.infinity,
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
                    ),
                  )
                ] else ...[
                  Container(),
                ], // TODO(luistxd): replace with placehold asset
                if (widget.item.mean != null)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '★ ${widget.item.mean?.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: kDefaultAnimeCardWidth,
              child: Text(
                widget.item.title,
                style: AppTextTheme().bodySmall.copyWith(height: 1, color: Colors.white),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            if (widget.item.genres != null) ...[
              const SizedBox(height: 5),
              SizedBox(
                width: kDefaultAnimeCardWidth,
                child: Wrap(
                    spacing: 4,
                    children: widget.item.genres!
                        .take(kDefaultNumTags)
                        .map(
                          (e) => AnimeTag(title: e.name),
                        )
                        .toList()),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
