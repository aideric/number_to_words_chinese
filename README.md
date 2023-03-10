<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
## Number to words (Chinese)

A Flutter package that converts number to words (Chinese characters).

Inspired by number to chinese words js library https://www.npmjs.com/package/number-to-chinese-words

## Features

Covert number to Chinese words.

Support both integer and double.

## Usage

To use this plugin, add `number_to_words_chinese` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

## Example

```dart
Text(
    NumberToWordsChinese.convert(12345),
),
```
