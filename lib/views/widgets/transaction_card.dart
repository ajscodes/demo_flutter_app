import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/transaction_model.dart';
import '../../utils/color_constants.dart';
import '../transaction_detail/transaction_detail_screen.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  
  const TransactionCard({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == TransactionType.income;
    final amountColor = isIncome ? ColorConstants.incomeColor : ColorConstants.expenseColor;
    final prefix = isIncome ? '+' : '-';
    
    // color of text in transaction is based on category like if income then green, if food then orange, fuel then yellow etc. also it's icon colors are same as this color
    final categoryColor = ColorConstants.getCategoryColor(transaction.category);
    final categoryIcon = ColorConstants.getCategoryIcon(transaction.category);

    return Card(
      elevation: 0,
      color: ColorConstants.cardColor,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransactionDetailScreen(transaction: transaction),
            ),
          );
        },
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: categoryColor.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(
            categoryIcon,
            color: categoryColor,
            size: 24,
          ),
        ),
        title: Text(
          transaction.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              transaction.category,
              style: TextStyle(
                color: categoryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              DateFormat('MMM dd, yyyy').format(transaction.date),
              style: TextStyle(
                color: ColorConstants.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
        trailing: Text(
          '$prefix\$${transaction.amount.toStringAsFixed(2)}',
          style: TextStyle(
            color: amountColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
