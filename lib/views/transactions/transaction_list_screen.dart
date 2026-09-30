import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/transaction_model.dart';
import '../../providers/expense_provider.dart';
import '../../utils/color_constants.dart';
import '../../utils/string_constants.dart';
import '../widgets/transaction_card.dart';

class TransactionListScreen extends StatelessWidget {
  const TransactionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.transactions),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ColorConstants.textPrimary,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              onChanged: (value) {
                Provider.of<ExpenseProvider>(context, listen: false).searchTransactions(value);
              },
              decoration: InputDecoration(
                hintText: 'Search transactions...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
        ),
      ),
      body: Consumer<ExpenseProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              // Filters
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    _buildFilterChip(
                      context: context,
                      label: 'All',
                      isSelected: provider.filterType == null,
                      onSelected: () => provider.filterTransactions(null),
                    ),
                    const SizedBox(width: 8),
                    _buildFilterChip(
                      context: context,
                      label: 'Income',
                      isSelected: provider.filterType == TransactionType.income,
                      onSelected: () => provider.filterTransactions(TransactionType.income),
                    ),
                    const SizedBox(width: 8),
                    _buildFilterChip(
                      context: context,
                      label: 'Expense',
                      isSelected: provider.filterType == TransactionType.expense,
                      onSelected: () => provider.filterTransactions(TransactionType.expense),
                    ),
                  ],
                ),
              ),
              
              // List
              Expanded(
                child: provider.transactions.isEmpty
                    ? Center(
                        child: Text(
                          'No transactions found.',
                          style: TextStyle(color: ColorConstants.textSecondary),
                        ),
                      )
                    : ListView.builder(
                        itemCount: provider.transactions.length,
                        itemBuilder: (context, index) {
                          return TransactionCard(
                            transaction: provider.transactions[index],
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFilterChip({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required VoidCallback onSelected,
  }) {
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? ColorConstants.onPrimaryColor : ColorConstants.textPrimary,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      onSelected: (_) => onSelected(),
      backgroundColor: Colors.grey.shade200,
      selectedColor: ColorConstants.primaryColor,
      checkmarkColor: ColorConstants.onPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide.none,
      ),
    );
  }
}
