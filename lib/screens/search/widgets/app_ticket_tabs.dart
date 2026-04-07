import 'package:flutter/material.dart';
import 'package:ticket_app/base/styles/app_styles.dart';

class AppTicketTabs extends StatelessWidget {
  final String firstTab;
  final String secondTab;
  const AppTicketTabs({super.key, required this.firstTab, required this.secondTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppStyles.ticketTabColor,
      ),
      child: Row(
        children: [
          AppTicketTab(
            tabText: firstTab, tabBorder: false, tabColor: true),
          AppTicketTab(
            tabText: secondTab, tabBorder: false, tabColor: false),
        ],
      ),
    );
  }
}

class AppTicketTab extends StatelessWidget {
  final String tabText;
  final bool tabBorder;
  final bool? tabColor;

  const AppTicketTab({super.key, required this.tabText, required this.tabBorder, this.tabColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: tabColor == true ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: tabBorder
              ? Border.all(color: Colors.grey.shade300)
              : null,
        ),
        child: Center(
          child: Text(
            tabText,
            style: TextStyle(
              color: tabColor == true ? Colors.black : Colors.grey.shade700,
            ),
          ),
        ),
      ),
    );
  }
}