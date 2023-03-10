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
      stringBuffer.write(_negative);
      num = num.abs();
    }
    stringBuffer.write(_intToChinese(num.toInt()));
    stringBuffer.write(_decimalToChinese(num));
    return stringBuffer.toString();
  }

  /// Covert int number to chinese words.
  static String _intToChinese(int num) {
    String str = '';
    int n = num.abs();

    if (n == 0) {
      return _zero;
    }

    List<String> unitsListCopy = _unitList.toList();
    while (n > 0) {
      final unit = unitsListCopy.removeAt(0);
      final int digit = n % 10;
      str = _digitList[digit] + unit + str;
      n = n ~/ 10;
    }

    const smallUnit = _ten + _hundred + _thousand;
    const bigUnit = _tenThousand +
        _hundredMillion +
        _trillion +
        _tenQuadrillion +
        _hundredQuintillion;

    str = str.replaceAllMapped(
      RegExp("($_zero)[$smallUnit]"),
      (match) {
        return match.group(1)!;
      },
    ).replaceAllMapped(
      RegExp("([$bigUnit])[^$smallUnit]+([$bigUnit])"),
      (match) {
        return match.group(1)! + _zero;
      },
    ).replaceAllMapped(
      RegExp("([$smallUnit])$_zero+([$bigUnit])"),
      (match) {
        return match.group(1)! + match.group(2)! + _zero;
      },
    ).replaceAllMapped(
      RegExp("($_zero)+"),
      (match) {
        return match.group(1)!;
      },
    ).replaceAllMapped(
      RegExp(_zero + r"+$"),
      (match) {
        return '';
      },
    ).replaceAllMapped(
      RegExp("^$_one$_ten"),
      (match) {
        return _ten;
      },
    );
    return str;
  }

  /// Covert decimal number to chinese words.
  static String _decimalToChinese(num num) {
    if (num % 1 == 0) return '';

    String str = '';
    final String n = num.abs().toString().split('.').last;
    final List<String> nSplit = n.split('');
    for (String i in nSplit) {
      str += _digitList[int.parse(i)];
    }

    return _dot + str;
  }
}

/// Chinese number to words constant

/// Chinese zero (0)
const String _zero = '???';

/// Chinese one (1)
const String _one = '???';

/// Chinese two (2)
const String _two = '???';

/// Chinese three (3)
const String _three = '???';

/// Chinese four (4)
const String _four = '???';

/// Chinese five (5)
const String _five = '???';

/// Chinese six (6)
const String _six = '???';

/// Chinese seven (7)
const String _seven = '???';

/// Chinese eight (8)
const String _eight = '???';

/// Chinese nine (9)
const String _nine = '???';

/// Chinese digit list from 0 - 9
const List<String> _digitList = [
  _zero,
  _one,
  _two,
  _three,
  _four,
  _five,
  _six,
  _seven,
  _eight,
  _nine,
];

/// Chinese ten (10)
const String _ten = '???';

/// Chinese hundred (100)
const String _hundred = '???';

/// Chinese thousand (1000)
const String _thousand = '???';

/// Chinese ten thousand (10000)
const String _tenThousand = '???';

/// Chinese hundred million (100000000)
const String _hundredMillion = '???';

/// Chinese trillion (1000000000000)
const String _trillion = '???';

/// Chinese ten quadrillion (10000000000000000)
const String _tenQuadrillion = '???';

/// Chinese hundred quintillion (100000000000000000000)
const String _hundredQuintillion = '???';

/// Chinese unit list
const List<String> _unitList = [
  '',
  _ten,
  _hundred,
  _thousand,
  _tenThousand,
  _ten,
  _hundred,
  _thousand,
  _hundredMillion,
  _ten,
  _hundred,
  _thousand,
  _trillion,
  _ten,
  _hundred,
  _thousand,
  _tenQuadrillion,
  _ten,
  _hundred,
  _thousand,
  _hundredQuintillion,
];

/// Chinese negative (-)
const String _negative = '???';

/// Chinese dot (.)
const String _dot = '???';
