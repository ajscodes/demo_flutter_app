import 'package:flutter/material.dart';
import '../../utils/color_constants.dart';
import '../../utils/string_constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.settings),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ColorConstants.textPrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'APPEARANCE',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: ListTile(
              leading: const Icon(Icons.dark_mode, color: Colors.green),
              title: const Text('Dark Mode'),
              subtitle: const Text('Use dark theme across the app'),
              trailing: Switch(
                value: false,
                onChanged: (val) {},
                activeColor: Colors.green,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'GENERAL',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.attach_money, color: Colors.purple),
                  title: const Text('Currency'),
                  subtitle: const Text('Select your preferred currency'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('USD (\$)', style: TextStyle(color: Colors.green.shade700)),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.calendar_today, color: Colors.blue),
                  title: const Text('First Day of Week'),
                  subtitle: const Text('Choose which day starts the week'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Monday', style: TextStyle(color: Colors.green.shade700)),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'DATA',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.red.shade200),
            ),
            color: Colors.red.shade50,
            child: ListTile(
              leading: Icon(Icons.delete_outline, color: Colors.red.shade600),
              title: Text('Clear All Transactions', style: TextStyle(color: Colors.red.shade600, fontWeight: FontWeight.bold)),
              subtitle: Text('This will remove all your transactions', style: TextStyle(color: Colors.red.shade400)),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
