import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';

class LocaleText extends StatelessWidget {
  final String string;
  final TextStyle? style;
  final TextAlign? textAlign;

  const LocaleText({
    Key? key,
    required this.string,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      string.locale,
      style: style,
      textAlign: textAlign,
    );
  }
}
