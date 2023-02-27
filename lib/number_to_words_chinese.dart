library number_to_words_chinese;

/// Convert number to chinese words.
class NumberToWordsChinese {
  NumberToWordsChinese._();

  /// Covert number to chinese words.
  static String convert(num num) {
    // if (num == -9223372036854775808) {
    //   return _zero;
    // }
    final StringBuffer stringBuffer = StringBuffer();
    if (num < 0) {
      stringBuffer.write(NumberToWordsChineseConstant.negative);
      num = num.abs();
    }
    stringBuffer.write(_intToChinese(num.toInt()));
    stringBuffer.write(_doubleToChinese(num.toDouble()));
    return stringBuffer.toString();
  }

  /// Covert int number to chinese words.
  static String _intToChinese(int num) {
    String str = '';
    int n = num.abs();

    if (n == 0) {
      return NumberToWordsChineseConstant.zero;
    }

    List<String> unitsListCopy = NumberToWordsChineseConstant.unitList.toList();
    while (n > 0) {
      final unit = unitsListCopy.removeAt(0);
      final int digit = n % 10;
      str = NumberToWordsChineseConstant.digitList[digit] + unit + str;
      n = n ~/ 10;
    }

    const smallUnit = NumberToWordsChineseConstant.ten +
        NumberToWordsChineseConstant.hundred +
        NumberToWordsChineseConstant.thousand;
    const bigUnit = NumberToWordsChineseConstant.tenThousand +
        NumberToWordsChineseConstant.hundredMillion +
        NumberToWordsChineseConstant.trillion +
        NumberToWordsChineseConstant.tenQuadrillion +
        NumberToWordsChineseConstant.hundredQuintillion;
    const zero = NumberToWordsChineseConstant.zero;

    str = str.replaceAllMapped(
      RegExp("($zero)[$smallUnit]"),
      (match) {
        return match.group(1)!;
      },
    ).replaceAllMapped(
      RegExp("([$bigUnit])[^$smallUnit]+([$bigUnit])"),
      (match) {
        return match.group(1)! + zero;
      },
    ).replaceAllMapped(
      RegExp("([$smallUnit])$zero+([$bigUnit])"),
      (match) {
        return match.group(1)! + match.group(2)! + zero;
      },
    ).replaceAllMapped(
      RegExp("($zero)+"),
      (match) {
        return match.group(1)!;
      },
    ).replaceAllMapped(
      RegExp(zero + r"+$"),
      (match) {
        return '';
      },
    ).replaceAllMapped(
      RegExp("^${NumberToWordsChineseConstant.one}${NumberToWordsChineseConstant.ten}"),
      (match) {
        return NumberToWordsChineseConstant.ten;
      },
    );
    return str;
  }

  /// Covert decimal number to chinese words.
  static String _doubleToChinese(double num) {
    if (num % 1 == 0) return '';

    String str = '';
    final String n = num.abs().toString().split('.').last;
    final List<String> nSplit = n.split('');
    for (String i in nSplit) {
      str += NumberToWordsChineseConstant.digitList[int.parse(i)];
    }

    return NumberToWordsChineseConstant.dot + str;
  }
}

/// Chinese number to words constant
class NumberToWordsChineseConstant {
  /// Chinese zero (0)
  static const String zero = '零';

  /// Chinese one (1)
  static const String one = '一';

  /// Chinese two (2)
  static const String two = '二';

  /// Chinese three (3)
  static const String three = '三';

  /// Chinese four (4)
  static const String four = '四';

  /// Chinese five (5)
  static const String five = '五';

  /// Chinese six (6)
  static const String six = '六';

  /// Chinese seven (7)
  static const String seven = '七';

  /// Chinese eight (8)
  static const String eight = '八';

  /// Chinese nine (9)
  static const String nine = '九';

  /// Chinese digit list from 0 - 9
  static const List<String> digitList = [
    zero,
    one,
    two,
    three,
    four,
    five,
    six,
    seven,
    eight,
    nine,
  ];

  /// Chinese ten (10)
  static const String ten = '十';

  /// Chinese hundred (100)
  static const String hundred = '百';

  /// Chinese thousand (1000)
  static const String thousand = '千';

  /// Chinese ten thousand (10000)
  static const String tenThousand = '萬';

  /// Chinese hundred million (100000000)
  static const String hundredMillion = '億';

  /// Chinese trillion (1000000000000)
  static const String trillion = '兆';

  /// Chinese trillion (10000000000000000)
  static const String tenQuadrillion = '京';

  /// Chinese (100000000000000000000)
  static const String hundredQuintillion = '垓';

  /// Chinese unit list
  static const List<String> unitList = [
    '',
    ten,
    hundred,
    thousand,
    tenThousand,
    ten,
    hundred,
    thousand,
    hundredMillion,
    ten,
    hundred,
    thousand,
    trillion,
    ten,
    hundred,
    thousand,
    tenQuadrillion,
    ten,
    hundred,
    thousand,
    hundredQuintillion,
  ];

  /// Chinese negative (-)
  static const String negative = '負';

  /// Chinese dot (.)
  static const String dot = '點';
}
