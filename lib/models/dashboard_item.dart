import 'package:flutter/material.dart';
import 'package:school_project/utils/utils.dart';

class DashboardItem {
  final String title;
  final IconData icon;
  final String route;
  bool? selected;

  DashboardItem({
    required this.title,
    required this.icon,
    required this.route,
    this.selected: false,
  });
  static List<DashboardItem> dashboardItems = [
    DashboardItem(
      icon: Icons.edit,
      title: 'Register a MicroChip',
      route: ChipRegistrationViewRoute,
    ),
    DashboardItem(
      icon: Icons.menu,
      title: 'Registration History',
      route: RegistrationHistoryViewRoute,
    ),
    DashboardItem(
      icon: Icons.person,
      title: 'My MircoChips',
      route: MicroChipsViewRoute,
    ),
    DashboardItem(
      icon: Icons.search,
      title: 'Scanner',
      route: SearchViewRoute,
    ),
    DashboardItem(
      icon: Icons.phone,
      title: 'Contact Support',
      route: SupportViewRoute,
    ),
    DashboardItem(
      icon: Icons.exit_to_app,
      title: 'Log Out',
      route: LoginViewRoute,
    ),
  ];
}
