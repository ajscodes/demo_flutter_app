import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/transaction_model.dart';
import '../../providers/expense_provider.dart';
import '../../utils/color_constants.dart';
import '../../utils/string_constants.dart';
import '../add_transaction/add_transaction_screen.dart';

class TransactionDetailScreen extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionDetailScreen({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == TransactionType.income;
    final amountColor = isIncome ? ColorConstants.incomeColor : ColorConstants.expenseColor;
    final prefix = isIncome ? '+' : '-';
    
    final categoryColor = ColorConstants.getCategoryColor(transaction.category);
    final categoryIcon = ColorConstants.getCategoryIcon(transaction.category);

    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.transactionDetails),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ColorConstants.textPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTransactionScreen(transactionToEdit: transaction),
                ),
              ).then((_) {
                if (context.mounted) Navigator.pop(context);
              }); // pop after edit
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              _showDeleteDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: categoryColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                categoryIcon,
                color: categoryColor,
                size: 64,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              transaction.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              '$prefix\$${transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: amountColor,
              ),
            ),
            const SizedBox(height: 32),
            _buildDetailRow(StringConstants.category, transaction.category),
            const Divider(height: 32),
            _buildDetailRow(
              StringConstants.transactionType, 
              isIncome ? StringConstants.income : StringConstants.expense
            ),
            const Divider(height: 32),
            _buildDetailRow(StringConstants.date, DateFormat('MMMM dd, yyyy - hh:mm a').format(transaction.date)),
            if (transaction.notes != null && transaction.notes!.isNotEmpty) ...[
              const Divider(height: 32),
              _buildDetailRow(StringConstants.notes, transaction.notes!),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: ColorConstants.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: ColorConstants.textPrimary,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Transaction'),
        content: const Text('Are you sure you want to delete this transaction?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text(StringConstants.cancel),
          ),
          TextButton(
            onPressed: () {
              Provider.of<ExpenseProvider>(context, listen: false).deleteTransaction(transaction.id);
              Navigator.pop(ctx); // Close dialog
              Navigator.pop(context); // Close detail screen
            },
            child: const Text(StringConstants.delete, style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
