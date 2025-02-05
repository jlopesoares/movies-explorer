import 'package:flutter/material.dart';

class DuflixNetworkImage extends StatelessWidget {
  const DuflixNetworkImage({
    super.key,
    this.url,
    this.width,
    this.height,
  });
  final String? url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url ?? '',
      width: width,
      height: height,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return SizedBox(
          width: width ?? 50,
          height: height ?? 50,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) => SizedBox(
        width: width ?? 50,
        height: height ?? 50,
        child: const Center(child: Icon(Icons.error, color: Colors.red)),
      ),
    );
  }
}
