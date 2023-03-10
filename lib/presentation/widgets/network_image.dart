import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BarsantiNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final BorderRadius borderRadius;
  final double width;
  final double height;
  final BoxFit fit;

  const BarsantiNetworkImage({
    super.key,
    required this.imageUrl,
    this.borderRadius = BorderRadius.zero,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: imageUrl!,
        errorWidget: (ctx, url, err) => Image.asset(
          "assets/images/placeholder-image.jpg",
          fit: fit,
        ),
        placeholder: (ctx, url) => Shimmer.fromColors(
          baseColor: BarsantiColors.tile,
          highlightColor: BarsantiColors.shimmerColor,
          child: Container(
            width: width,
            height: height,
            color: Colors.white,
          ),
        ),
        fit: fit,
        width: width,
        height: height,
      ),
    );
  }
}
