library pena_flutter;

import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Pena extends StatelessWidget {
  const Pena({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse('https://flutter.dev'));

    return WebViewWidget(controller: controller);
  }
}
