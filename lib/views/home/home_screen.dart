import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/expense_provider.dart';
import '../../utils/color_constants.dart';
import '../../utils/string_constants.dart';
import '../widgets/summary_card.dart';
import '../widgets/transaction_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.appName),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ColorConstants.textPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 32),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Consumer<ExpenseProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Summary Cards
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SummaryCard(
                          title: StringConstants.totalBalance,
                          amount: provider.totalBalance,
                          color: ColorConstants.primaryColor,
                          icon: Icons.account_balance_wallet,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          children: [
                            SummaryCard(
                              title: StringConstants.totalIncome,
                              amount: provider.totalIncome,
                              color: ColorConstants.incomeColor,
                              icon: Icons.arrow_downward,
                            ),
                            const SizedBox(height: 12),
                            SummaryCard(
                              title: StringConstants.totalExpense,
                              amount: provider.totalExpense,
                              color: ColorConstants.expenseColor,
                              icon: Icons.arrow_upward,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Recent Transactions Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        StringConstants.recentTransactions,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Recent Transactions List
                provider.recentTransactions.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Center(
                          child: Text(
                            'No transactions yet.',
                            style: TextStyle(color: ColorConstants.textSecondary),
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: provider.recentTransactions.length,
                        itemBuilder: (context, index) {
                          return TransactionCard(
                            transaction: provider.recentTransactions[index],
                          );
                        },
                      ),
                const SizedBox(height: 80), // Padding for bottom FAB
              ],
            ),
          );
        },
      ),
    );
  }
}
