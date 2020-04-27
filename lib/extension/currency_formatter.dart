import 'package:intl/intl.dart';

extension CurrencyFormatter on int {
  String toCurrency() {
    var formatter =
        NumberFormat.simpleCurrency(locale: "pt-br", decimalDigits: 0);
    return formatter.format(this);
  }
}
