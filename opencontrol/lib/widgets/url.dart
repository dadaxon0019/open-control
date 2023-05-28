import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

///TODO: check performance impact bro !!!
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

  RichTextView({required this.text});

  bool _isLink(String input) {
    final matcher = new RegExp(
        r"(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)");
    return matcher.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    final words = text.split(' ');
    List<TextSpan> span = [];
    words.forEach((word) {
      span.add(_isLink(word)
          ? new LinkTextSpan(
              style: Theme.of(context).textTheme.labelMedium,
              text: '$word ',
              url: word,
            )
          : TextSpan(
              text: '$word ',
              style: Theme.of(context).textTheme.titleMedium,
            ));
    });
    if (span.length > 0) {
      return new RichText(
        text: new TextSpan(
            text: '',
            style: TextStyle(
              color: Colors.red,
            ),
            children: span),
      );
    } else {
      return new Text(
        text,
        style: Theme.of(context).textTheme.labelMedium,
      );
    }
  }
}
