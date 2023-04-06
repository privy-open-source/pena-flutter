# Pena 💙 Flutter

> PrivyID's Official Client Integration Library for Flutter.

## Requirement

| Platform | Requirement |
|----------|-------------|
| Android  | SDK 30+     |
| IOS      | 14+         |

## Installation

```sh
flutter pub add pena_flutter
```

### Android Platform

You should however make sure to set the correct minSdkVersion in `android/app/build.gradle` if it was previously lower than 30:

```gradle
android {
    defaultConfig {
        minSdkVersion 30
    }
}
```

## Usage

```dart
import 'package:pena_flutter/pena_flutter.dart';

class MyApp extends StatelessWidget {
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

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
