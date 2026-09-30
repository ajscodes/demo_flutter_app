import 'package:flutter/material.dart';
import '../../utils/color_constants.dart';
import '../../utils/string_constants.dart';
import '../home/home_screen.dart';
import '../transactions/transaction_list_screen.dart';
import '../settings/settings_screen.dart';
import '../add_transaction/add_transaction_screen.dart'; // Needed for FAB

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const TransactionListScreen(),
    const Center(child: Text('Reports Screen (Coming Soon)')),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.secondaryColor,
      body: _screens[_selectedIndex],
      
      // Kept the Add button only for the home screen
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              backgroundColor: Colors.blue.shade600,
              child: const Icon(Icons.add, color: Colors.white, size: 28),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTransactionScreen(),
                  ),
                );
              },
            )
          : null,
      
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorConstants.primaryColor,
          backgroundColor: ColorConstants.bottomNavigationBackGroundColor,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: StringConstants.bottomNavigationLabel1),
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: StringConstants.bottomNavigationLabel2),
            BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart_rounded),
                label: StringConstants.bottomNavigationLabel3),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: StringConstants.bottomNavigationLabel4),
          ],
        ),
      ),
    );
  }
}
