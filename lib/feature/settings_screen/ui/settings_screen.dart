import 'package:aizere_app/common/widgets/app_custom_app_bar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppCustomAppBar(
        title: 'Настройка',
        isSettings: true,
      ),
      body: L,
    );
  }
}
