library pena_flutter;

import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Placement {
  final num x;
  final num y;
  final num page;
  final bool? fixed;

  const Placement({
    required this.x,
    required this.y,
    required this.page,
    this.fixed,
  });
}

typedef HookFn = void Function(Payload payload);

class Payload {
  final String action;
  final dynamic data;

  Payload({
    required this.action,
    required this.data,
  });
}

class Pena extends StatelessWidget {
  final String url;
  final String? lang;
  final String? privyId;
  final bool? visibility;
  final Placement? signature;
  final bool? debug;
  final HookFn? onAfterAction;

  const Pena({
    super.key,
    required this.url,
    this.lang,
    this.visibility,
    this.privyId,
    this.debug,
    this.signature,
    this.onAfterAction,
  });

  Uri getUri() {
    Uri uri = Uri.parse(url);
    Map<String, String> query = Map.from(uri.queryParameters);

    if (lang != null) {
      query['lang'] = lang!;
    }

    if (privyId != null) {
      query['privyId'] = privyId!;
    }

    if (visibility != null) {
      query['visibility'] = visibility.toString();
    }

    if (debug != null) {
      query['debug'] = debug.toString();
    }

    if (signature != null) {
      query['x'] = signature!.x.toString();
      query['y'] = signature!.y.toString();
      query['page'] = signature!.page.toString();
      query['fixed'] = signature!.fixed.toString();
    }

    return uri.replace(queryParameters: query);
  }

  void onMessageReceived(JavaScriptMessage event) {
    var json = jsonDecode(event.message);
    var payload = Payload(action: json.action, data: json.data);

    onAfterAction?.call(payload);
  }

  @override
  Widget build(BuildContext context) {
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('PenaFlutter',
          onMessageReceived: onMessageReceived)
      ..loadRequest(getUri());

    return WebViewWidget(controller: controller);
  }
}
