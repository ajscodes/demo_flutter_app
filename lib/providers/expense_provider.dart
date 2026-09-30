import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../controllers/expense_controller.dart';

class ExpenseProvider extends ChangeNotifier {
  // Create an instance of our controller
  ExpenseController controller = ExpenseController();

  // Search and filter variables
  String searchQuery = '';
  TransactionType? filterType;

  // Get all transactions with search, filter, and sort logic
  List<TransactionModel> get transactions {
    List<TransactionModel> filteredList = [];

    // 1. Filter by type and search query using a simple loop
    for (var transaction in controller.transactions) {
      bool matchesSearch = transaction.title.toLowerCase().contains(searchQuery.toLowerCase());
      bool matchesType = filterType == null || transaction.type == filterType;

      if (matchesSearch && matchesType) {
        filteredList.add(transaction);
      }
    }

    // 2. Sort by latest date (newest first)
    filteredList.sort((a, b) => b.date.compareTo(a.date));
    
    return filteredList;
  }

  // Get only the 5 most recent transactions
  List<TransactionModel> get recentTransactions {
    List<TransactionModel> allList = [];
    
    // Copy all items
    for (var item in controller.transactions) {
      allList.add(item);
    }
    
    // Sort by latest date
    allList.sort((a, b) => b.date.compareTo(a.date));

    // Return all items, removing the 5 item limit
    return allList;
  }

  // Calculate total income using a simple loop
  double get totalIncome {
    double total = 0;
    for (var transaction in controller.transactions) {
      if (transaction.type == TransactionType.income) {
        total += transaction.amount;
      }
    }
    return total;
  }

  // Calculate total expense using a simple loop
  double get totalExpense {
    double total = 0;
    for (var transaction in controller.transactions) {
      if (transaction.type == TransactionType.expense) {
        total += transaction.amount;
      }
    }
    return total;
  }

  // Calculate total balance
  double get totalBalance {
    return totalIncome - totalExpense;
  }

  // --- Actions ---

  void addTransaction(TransactionModel transaction) {
    controller.addTransaction(transaction);
    notifyListeners(); // Tell the UI to update
  }

  void updateTransaction(TransactionModel transaction) {
    controller.updateTransaction(transaction);
    notifyListeners(); // Tell the UI to update
  }

  void deleteTransaction(String id) {
    controller.deleteTransaction(id);
    notifyListeners(); // Tell the UI to update
  }

  void searchTransactions(String query) {
    searchQuery = query;
    notifyListeners(); // Tell the UI to update
  }

  void filterTransactions(TransactionType? type) {
    filterType = type;
    notifyListeners(); // Tell the UI to update
  }
}
