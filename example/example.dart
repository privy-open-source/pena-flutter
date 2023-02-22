import 'package:flutter/widgets.dart';
import 'package:pena_flutter/pena_flutter.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Pena(url: 'https://www.youtube.com/embed/VbfpW0pbvaU');
  }
}
