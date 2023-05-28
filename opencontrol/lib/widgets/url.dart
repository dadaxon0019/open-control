import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class LinkTextSpan extends TextSpan {
  LinkTextSpan({TextStyle? style, String? url, String? text})
      : super(
            style: style,
            text: text ?? url,
            recognizer: new TapGestureRecognizer()
              ..onTap = () => launcher.launchUrl(Uri.parse(url!)));
}

class RichTextView extends StatelessWidget {
  final String text;

  const RichTextView({super.key, required this.text});

  bool _isLink(String input) {
    final matcher = RegExp(
        r"(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)");
    return matcher.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    final words = text.split(' ');
    List<TextSpan> span = [];
    for (var word in words) {
      span.add(_isLink(word)
          ? LinkTextSpan(
              style: Theme.of(context).textTheme.labelMedium,
              text: '$word ',
              url: word,
            )
          : TextSpan(
              text: '$word ',
              style: Theme.of(context).textTheme.titleMedium,
            ));
    }
    if (span.isNotEmpty) {
      return RichText(
        text: TextSpan(
            text: '',
            style: const TextStyle(
              color: Colors.red,
            ),
            children: span),
      );
    } else {
      return Text(
        text,
        style: Theme.of(context).textTheme.labelMedium,
      );
    }
  }
}
