import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AdBannerItemWidget extends StatelessWidget {
  final Function onTapAdd;

  const AdBannerItemWidget({super.key, required this.onTapAdd});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapAdd(),
      child: SizedBox(
        height: 64,
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: 'https://placehold.it/500x100?text=ad',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
