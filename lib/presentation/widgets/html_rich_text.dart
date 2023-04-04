import 'package:barsanti_app/presentation/theme/styles.dart';
import 'package:barsanti_app/utils/utils.dart';
import "package:flutter/material.dart";
import 'package:simple_html_css/simple_html_css.dart';

class HTMLRichText extends StatelessWidget {
  final String text;

  const HTMLRichText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formattedText = text.replaceAll("&quot;", "'");

    return HTML.toRichText(
      context,
      formattedText,
      defaultTextStyle: BarsantiStyles.body,
      linksCallback: (url) {
        Browser.openLink(url);
      },
    );
  }
}
