import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AppTextHtml extends StatelessWidget {
  final String text;
  const AppTextHtml(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: text,
      // extensions: [
      //   TagExtension(tagsToExtend: {"flutter"}, child: const FlutterLogo()),
      // ],
      // style: {
      //   "p.fancy": Style(
      //     textAlign: TextAlign.center,
      //     padding: EdgeInsets.all(16),
      //     backgroundColor: Colors.grey,
      //     margin: Margins(left: Margin(50, Unit.px), right: Margin.auto()),
      //     width: Width(300, Unit.px),
      //     fontWeight: FontWeight.bold,
      //   ),
      // },
    );
  }
}
