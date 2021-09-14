import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final formatCurrency = NumberFormat.currency(locale: 'pt_BR', symbol: '');

String formatMonetaryValue(double value) {
  final formatCurrency = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return formatCurrency.format(value);
}

String formatMonetaryValueWithoutSymbol(double value) {
  return formatCurrency.format(value);
}

final cpfFormater = MaskTextInputFormatter(
  mask: '###.###.###-##',
  filter: {
    '#': RegExp('[0-9]'),
  },
);

final phoneFormater = MaskTextInputFormatter(
  mask: '(##) #####-####',
  filter: {
    '#': RegExp('[0-9]'),
  },
);

final cepFormater = MaskTextInputFormatter(
  mask: '#####-###',
  filter: {
    '#': RegExp('[0-9]'),
  },
);
