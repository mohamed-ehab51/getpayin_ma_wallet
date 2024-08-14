import 'Transactionstyle.dart';

class Transaction {
  final String label;
  final double amount;
  final Transaction_style style;
  final String type;
  Transaction(
      {required this.style,
        required this.label,
        required this.type,
        required this.amount});
}
