/// Converts Arabic text into the correct contextual (joined) letter forms
/// before handing it to the `pdf` package.
///
/// By default the `pdf` package only reorders RTL text (the `use_arabic`
/// compile flag that also enables letter-joining is off unless passed via
/// `--dart-define`), so every Arabic letter is drawn in its isolated form and
/// words look disconnected/garbled instead of cursive. This shaper resolves
/// each letter to its isolated/initial/medial/final presentation form in the
/// original logical order — it does not reorder characters — so the
/// package's own bidi pass (enabled by default) still reverses the text into
/// visual order exactly as it does today.
library;

/// Arabic shape substitutions: char code => [isolated, final, initial, medial].
const Map<int, List<int>> _arabicForms = <int, List<int>>{
  0x0640: [0x0640, 0x0640, 0x0640, 0x0640], // ARABIC TATWEEL
  0x0621: [0xFE80], // HAMZA
  0x0622: [0xFE81, 0xFE82], // ALEF WITH MADDA ABOVE
  0x0623: [0xFE83, 0xFE84], // ALEF WITH HAMZA ABOVE
  0x0624: [0xFE85, 0xFE86], // WAW WITH HAMZA ABOVE
  0x0625: [0xFE87, 0xFE88], // ALEF WITH HAMZA BELOW
  0x0626: [0xFE89, 0xFE8A, 0xFE8B, 0xFE8C], // YEH WITH HAMZA ABOVE
  0x0627: [0xFE8D, 0xFE8E], // ALEF
  0x0628: [0xFE8F, 0xFE90, 0xFE91, 0xFE92], // BEH
  0x0629: [0xFE93, 0xFE94], // TEH MARBUTA
  0x062A: [0xFE95, 0xFE96, 0xFE97, 0xFE98], // TEH
  0x062B: [0xFE99, 0xFE9A, 0xFE9B, 0xFE9C], // THEH
  0x062C: [0xFE9D, 0xFE9E, 0xFE9F, 0xFEA0], // JEEM
  0x062D: [0xFEA1, 0xFEA2, 0xFEA3, 0xFEA4], // HAH
  0x062E: [0xFEA5, 0xFEA6, 0xFEA7, 0xFEA8], // KHAH
  0x062F: [0xFEA9, 0xFEAA], // DAL
  0x0630: [0xFEAB, 0xFEAC], // THAL
  0x0631: [0xFEAD, 0xFEAE], // REH
  0x0632: [0xFEAF, 0xFEB0], // ZAIN
  0x0633: [0xFEB1, 0xFEB2, 0xFEB3, 0xFEB4], // SEEN
  0x0634: [0xFEB5, 0xFEB6, 0xFEB7, 0xFEB8], // SHEEN
  0x0635: [0xFEB9, 0xFEBA, 0xFEBB, 0xFEBC], // SAD
  0x0636: [0xFEBD, 0xFEBE, 0xFEBF, 0xFEC0], // DAD
  0x0637: [0xFEC1, 0xFEC2, 0xFEC3, 0xFEC4], // TAH
  0x0638: [0xFEC5, 0xFEC6, 0xFEC7, 0xFEC8], // ZAH
  0x0639: [0xFEC9, 0xFECA, 0xFECB, 0xFECC], // AIN
  0x063A: [0xFECD, 0xFECE, 0xFECF, 0xFED0], // GHAIN
  0x0641: [0xFED1, 0xFED2, 0xFED3, 0xFED4], // FEH
  0x0642: [0xFED5, 0xFED6, 0xFED7, 0xFED8], // QAF
  0x0643: [0xFED9, 0xFEDA, 0xFEDB, 0xFEDC], // KAF
  0x0644: [0xFEDD, 0xFEDE, 0xFEDF, 0xFEE0], // LAM
  0x0645: [0xFEE1, 0xFEE2, 0xFEE3, 0xFEE4], // MEEM
  0x0646: [0xFEE5, 0xFEE6, 0xFEE7, 0xFEE8], // NOON
  0x0647: [0xFEE9, 0xFEEA, 0xFEEB, 0xFEEC], // HEH
  0x0648: [0xFEED, 0xFEEE], // WAW
  0x0649: [0xFEEF, 0xFEF0], // ALEF MAKSURA
  0x064A: [0xFEF1, 0xFEF2, 0xFEF3, 0xFEF4], // YEH
};

const List<int> _alefLetters = <int>[0x0622, 0x0623, 0x0625, 0x0627];

const Set<int> _arabicDiacritics = <int>{
  0x064B, 0x064C, 0x064D, 0x064E, 0x064F, 0x0650, 0x0651, 0x0652, 0x0670,
};

bool _isArabicLetter(int codeUnit) {
  return (codeUnit >= 0x0600 && codeUnit <= 0x06FF) ||
      (codeUnit >= 0x0750 && codeUnit <= 0x077F) ||
      (codeUnit >= 0xFB50 && codeUnit <= 0xFDFF) ||
      (codeUnit >= 0xFE70 && codeUnit <= 0xFEFF);
}

bool _hasForms(int codeUnit) => _arabicForms.containsKey(codeUnit);

/// Letters that only ever join to a *previous* letter (isolated/final only).
bool _isEndOnlyLetter(int codeUnit) {
  final forms = _arabicForms[codeUnit];
  return forms != null && forms.length <= 2;
}

bool _isAlefLetter(int codeUnit) => _alefLetters.contains(codeUnit);

bool _hasFinalForm(int codeUnit) {
  final forms = _arabicForms[codeUnit];
  return forms != null && forms.length >= 2;
}

bool _hasMedialForm(int codeUnit) {
  final forms = _arabicForms[codeUnit];
  return forms != null && forms.length == 4;
}

/// 0 = isolated, 1 = final, 2 = initial, 3 = medial, -1 = leave unchanged.
int _resolveForm(int current, int before, int after) {
  if (!_hasForms(current)) {
    return -1;
  }
  if (!_hasFinalForm(current) ||
      (!_isArabicLetter(before) && !_isArabicLetter(after)) ||
      (!_isArabicLetter(after) && _isEndOnlyLetter(before)) ||
      (_isEndOnlyLetter(current) && !_isArabicLetter(before)) ||
      (_isEndOnlyLetter(current) && _isAlefLetter(before)) ||
      (_isEndOnlyLetter(current) && _isEndOnlyLetter(before))) {
    return 0;
  }
  if (_hasMedialForm(current) &&
      _isArabicLetter(before) &&
      !_isEndOnlyLetter(before) &&
      _isArabicLetter(after) &&
      _hasFinalForm(after)) {
    return 3;
  }
  if (_isEndOnlyLetter(current) || !_isArabicLetter(after)) {
    return 1;
  }
  return 2;
}

String _shapeWord(String word) {
  final units = word.codeUnits;
  final result = <int>[];
  var previousLetter = 0;

  for (var i = 0; i < units.length; i++) {
    final current = units[i];

    if (_arabicDiacritics.contains(current)) {
      result.add(current);
      continue;
    }

    if (!_isArabicLetter(current)) {
      previousLetter = 0;
      result.add(current);
      continue;
    }

    var next = 0;
    for (var j = i + 1; j < units.length; j++) {
      if (!_arabicDiacritics.contains(units[j])) {
        next = units[j];
        break;
      }
    }

    final form = _resolveForm(current, previousLetter, next);
    previousLetter = current;
    result.add(form == -1 ? current : _arabicForms[current]![form]);
  }

  return String.fromCharCodes(result);
}

/// Shapes Arabic letters into their correct joined presentation forms while
/// keeping the original (logical) character order intact.
String shapeArabicText(String input) {
  if (input.isEmpty) {
    return input;
  }
  return input
      .split('\n')
      .map((line) => line.split(' ').map(_shapeWord).join(' '))
      .join('\n');
}
