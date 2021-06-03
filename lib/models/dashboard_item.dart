import 'package:flutter/material.dart';

class DashboardItem {
  final String title;
  final IconData icon;
  final Function onTap;
  bool? selected;

  DashboardItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.selected: false,
  });
  static List<DashboardItem> dashboardItems = [
    DashboardItem(
      icon: Icons.edit,
      title: 'Register a MicroChip',
      onTap: () {},
    ),
    DashboardItem(
      icon: Icons.menu,
      title: 'Registration History',
      onTap: () {},
    ),
    DashboardItem(
      icon: Icons.person,
      title: 'MircoChips in My Details',
      onTap: () {},
    ),
    DashboardItem(
      icon: Icons.search,
      title: 'Scanner',
      onTap: () {},
    ),
    DashboardItem(
      icon: Icons.phone,
      title: 'Contact and Support',
      onTap: () {},
    ),
    DashboardItem(
      icon: Icons.exit_to_app,
      title: 'Log Out',
      onTap: () {},
    ),
  ];
}
