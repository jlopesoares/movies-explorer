import 'package:flutter/material.dart';

enum DuflixChipType {
  filled,
  outlined,
}

class DuflixChip extends StatelessWidget {
  const DuflixChip(this._type, this._text, {super.key});

  const DuflixChip.outlined(this._text, {super.key})
      : _type = DuflixChipType.outlined;
  const DuflixChip.filled(this._text, {super.key})
      : _type = DuflixChipType.filled;

  final DuflixChipType _type;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            _type == DuflixChipType.filled ? Colors.grey : Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color:
              _type == DuflixChipType.filled ? Colors.transparent : Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: Text(
          _text,
          style: TextStyle(
            color: _type == DuflixChipType.filled ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
