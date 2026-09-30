import 'package:flutter/material.dart';
import '../../utils/string_constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          StringConstants.settings,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(StringConstants.appearance),
            _buildCard([
              _buildListTile(
                icon: Icons.light_mode,
                iconColor: Colors.green,
                title: StringConstants.darkMode,
                subtitle: StringConstants.darkModeSubtitle,
                trailing: Switch(value: true, onChanged: (v) {}, activeColor: Colors.green),
              ),
            ]),
            
            const SizedBox(height: 24),
            _buildSectionHeader(StringConstants.general),
            _buildCard([
              _buildListTile(
                icon: Icons.attach_money,
                iconColor: Colors.purple,
                title: StringConstants.currency,
                subtitle: StringConstants.currencySubtitle,
                trailingText: 'USD (\$)',
                trailingColor: Colors.green,
              ),
              const Divider(height: 1),
              _buildListTile(
                icon: Icons.calendar_today,
                iconColor: Colors.blue,
                title: StringConstants.firstDayOfWeek,
                subtitle: StringConstants.firstDayOfWeekSubtitle,
                trailingText: 'Monday',
                trailingColor: Colors.green,
              ),
            ]),
            
            const SizedBox(height: 24),
            _buildSectionHeader(StringConstants.data),
            _buildCard([
              _buildListTile(
                icon: Icons.delete_outline,
                iconColor: Colors.orange,
                title: StringConstants.clearAllTransactions,
                subtitle: StringConstants.clearAllTransactionsSubtitle,
              ),
            ]),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                label: const Text(StringConstants.clearAllTransactions, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: Colors.red.shade200),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber_rounded, color: Colors.red),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(StringConstants.clearWarningTitle, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 12)),
                        const SizedBox(height: 4),
                        Text(StringConstants.clearWarningSubtitle, style: TextStyle(color: Colors.red.shade800, fontSize: 11)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            _buildSectionHeader(StringConstants.about),
            _buildCard([
              _buildListTile(
                icon: Icons.info_outline,
                iconColor: Colors.green,
                title: StringConstants.aboutApp,
                subtitle: StringConstants.aboutAppVersion,
              ),
              const Divider(height: 1),
              _buildListTile(
                icon: Icons.star_border,
                iconColor: Colors.orange,
                title: StringConstants.rateUs,
                subtitle: StringConstants.rateUsSubtitle,
              ),
            ]),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    Widget? trailing,
    String? trailingText,
    Color? trailingColor,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      trailing: trailing ??
          (trailingText != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(trailingText, style: TextStyle(color: trailingColor, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    const Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                )
              : const Icon(Icons.chevron_right, color: Colors.grey)),
    );
  }
}
