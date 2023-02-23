library pena_flutter;

import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Placement {
  /// X Coordinate
  final num x;

  /// Y Coordinate
  final num y;

  /// Target page
  final num page;

  /// Disabled signature for moving
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
  /// **(Required)** Document's url
  final String url;

  /// Set language, valid value is 'en' or 'id'
  final String? lang;

  /// Set recipient's privyId
  final String? privyId;

  /// Set signature visibility
  final bool? visibility;

  /// Set signature placement
  final Placement? signature;

  /// Enable debug mode
  final bool? debug;

  /// After action hook
  final HookFn? onAfterAction;

  const Pena({
    super.key,
    required this.url,
    this.lang,
    this.visibility,
    this.privyId,
    this.debug,
    this.onAfterAction,
    @Deprecated('use API to set placement when upload the document')
        this.signature,
  });

  /// Generate Uri
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

  void _onMessageReceived(JavaScriptMessage event) {
    if (onAfterAction != null) {
      var json = jsonDecode(event.message);
      var payload = Payload(
        action: json['action'],
        data: json['data'],
      );

      onAfterAction?.call(payload);
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('PenaFlutter',
          onMessageReceived: _onMessageReceived)
      ..loadRequest(getUri());

    return WebViewWidget(controller: controller);
  }
}
