import 'package:duflix/core/widgets/duflix_chip.dart';
import 'package:flutter/material.dart';

class TitleMetadataRow extends StatelessWidget {
  const TitleMetadataRow(this._chipType, this._type, this._year, {super.key});

  const TitleMetadataRow.outlined(this._type, this._year, {super.key})
      : _chipType = DuflixChipType.outlined;

  const TitleMetadataRow.filled(this._type, this._year, {super.key})
      : _chipType = DuflixChipType.filled;

  final DuflixChipType _chipType;
  final String _type;
  final String _year;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        DuflixChip(
          _chipType,
          _type,
        ),
        Text(
          _year,
          style: const TextStyle(),
        ),
      ],
    );
  }
}
