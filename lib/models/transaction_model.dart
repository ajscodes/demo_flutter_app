enum TransactionType { income, expense }

class TransactionModel {
  final String id;
  String title;
  double amount;
  TransactionType type;
  String category;
  DateTime date;
  String? notes;

  TransactionModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.type,
    required this.category,
    required this.date,
    this.notes,
  });
}
