import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnimeDetail extends ConsumerStatefulWidget {
  const AnimeDetail({super.key, required this.animeId});

  final int animeId;

  @override
  ConsumerState<AnimeDetail> createState() => _AnimeDetailState();
}

class _AnimeDetailState extends ConsumerState<AnimeDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
