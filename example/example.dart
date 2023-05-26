import 'package:flutter/widgets.dart';
import 'package:pena_flutter/pena_flutter.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Pena(
      url: 'http://sign.document.com/doc/xxxxx',
      lang: 'en',
      signature: const Placement(x: 50, y: 100, page: 1),
      onAfterAction: (payload) {
        if (payload.action == 'sign') {
          print(payload.data);
        }
      },
    );
  }
}
