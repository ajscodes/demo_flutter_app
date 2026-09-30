import 'package:flutter/material.dart';

class ColorConstants {
  static const Color primaryColor = Colors.deepPurple;
  static const Color secondaryColor = Colors.purpleAccent;
  static const Color onPrimaryColor = Colors.white;
  static const Color backgroundColor = Colors.white;
  static const Color cardColor = Colors.white;
  static const Color bottomNavigationBackGroundColor = Colors.white;
  
  static Color incomeColor = Colors.green.shade600;
  static Color expenseColor = Colors.red.shade600;
  
  static Color textPrimary = Colors.black87;
  static Color textSecondary = Colors.black54;

  static Color getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'salary':
      case 'freelance':
      case 'bonus':
        return Colors.green.shade600;
      case 'food':
        return Colors.orange.shade600;
      case 'fuel':
        return Colors.yellow.shade800;
      case 'shopping':
        return Colors.pink.shade500;
      case 'bills':
        return Colors.blue.shade600;
      case 'entertainment':
        return Colors.purple.shade500;
      case 'travel':
        return Colors.teal.shade500;
      case 'medical':
        return Colors.red.shade400;
      default:
        return Colors.grey.shade600;
    }
  }

  static IconData getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'salary':
        return Icons.monetization_on;
      case 'freelance':
        return Icons.work;
      case 'bonus':
        return Icons.card_giftcard;
      case 'food':
        return Icons.fastfood;
      case 'fuel':
        return Icons.local_gas_station;
      case 'shopping':
        return Icons.shopping_bag;
      case 'bills':
        return Icons.receipt_long;
      case 'entertainment':
        return Icons.movie;
      case 'travel':
        return Icons.flight;
      case 'medical':
        return Icons.medical_services;
      default:
        return Icons.category;
    }
  }
}
