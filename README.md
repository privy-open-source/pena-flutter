# Pena 💙 Flutter

> Pena plugin for Flutter

## Installation

```sh
flutter pub add pena_flutter
```

## Usage

```dart
import 'package:pena_flutter/pena_flutter.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildCofunctionfunctionntext context) {
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
```

## Options

### Props

| Name            | Type      | Default | Description                                                                                                  |
|-----------------|-----------|:-------:|--------------------------------------------------------------------------------------------------------------|
| `url`           | String    |    -    | **(Required)** Document's url                                                                                |
| `lang`          | String    |  `en`   | Set language, valid value is `en` or `id`                                                                    |
| `visibility`    | bool      | `true`  | Set signature visibility                                                                                     |
| `privyId`       | String    |    -    | Set recipient's privyId                                                                                      |
| `signature`     | Placement |    -    | Set signature placement<br/> <strong>(Deprecated)</strong> use API to set placement when upload the document |
| ├ `x`           | num       |    -    | X Coordinate                                                                                                 |
| ├ `y`           | num       |    -    | Y Coordinate                                                                                                 |
| ├ `page`        | num       |    -    | Target page                                                                                                  |
| └ `fixed`       | bool      | `false` | Disabled signature for moving                                                                                |
| `debug`         | bool      | `false` | Enable debug mode                                                                                            |
| `onAfterAction` | Function  |    -    | After action hook                                                                                            |

## License

This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details
