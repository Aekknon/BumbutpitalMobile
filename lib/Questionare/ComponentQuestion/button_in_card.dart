
import 'package:flutter/material.dart';

class CardBarButton extends StatelessWidget {
  final void Function() onNext;
  final void Function() onPrev;
  final bool havePrev;
  final bool haveNext;

  const CardBarButton({
    Key? key,
    required this.onNext,
    required this.onPrev,
    required this.havePrev,
    required this.haveNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildBtn(String title, void Function() onClick) {
      return ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          primary: Color((0xff6367EA)),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        child: Text(title),
      );
    }

    return Row(
      mainAxisAlignment:
          havePrev ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
      children: [
        if (havePrev) _buildBtn("Prev", onPrev),
        _buildBtn(haveNext ? "Next" : "Submit", onNext),
      ],
    );
  }
}
