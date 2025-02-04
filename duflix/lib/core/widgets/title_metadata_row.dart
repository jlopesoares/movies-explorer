import 'package:duflix/core/widgets/duflix_chip.dart';
import 'package:flutter/material.dart';

class TitleTypeAndYearMetadata extends StatelessWidget {
  const TitleTypeAndYearMetadata(
    this._chipType,
    this._type,
    this._year, {
    super.key,
  });

  const TitleTypeAndYearMetadata.outlined(this._type, this._year, {super.key})
      : _chipType = DuflixChipType.outlined;

  const TitleTypeAndYearMetadata.filled(this._type, this._year, {super.key})
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
