import 'package:duflix/api/gen/watchmode_api.swagger.dart';
import 'package:duflix/core/widgets/duflix_image_downloader.dart';
import 'package:flutter/material.dart';

class SourceWidget extends StatelessWidget {
  const SourceWidget(
    this._source,
    this._onTap, {
    super.key,
  });

  final SourceSummary _source;
  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: _onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: 100,
            child: Column(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                DuflixNetworkImage(
                  url: _source.logo100px,
                  width: 50,
                  height: 50,
                ),
                Text(
                  _source.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
