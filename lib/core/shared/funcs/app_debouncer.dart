import 'package:flutter_debouncer/flutter_debouncer.dart';

final Debouncer _debouncer = Debouncer();

void appDebouncer(Function func, {int milliSec = 100}) {
  _debouncer.debounce(
      duration: Duration(milliseconds: milliSec),
      onDebounce: () {
        func();
      });
}
