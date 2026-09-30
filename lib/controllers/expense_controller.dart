import '../models/transaction_model.dart';

class ExpenseController {
  // Simple list to store transactions in memory
  List<TransactionModel> transactions = [];

  void addTransaction(TransactionModel transaction) {
    transactions.add(transaction);
  }

  void updateTransaction(TransactionModel transaction) {
    // Find the transaction by id and update it
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].id == transaction.id) {
        transactions[i] = transaction;
        break; // Stop loop once found
      }
    }
  }

  void deleteTransaction(String id) {
    // Find the transaction by id and remove it
    for (int i = 0; i < transactions.length; i++) {
      if (transactions[i].id == id) {
        transactions.removeAt(i);
        break; // Stop loop once found
      }
    }
  }
}
