import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  double textScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Tema escuro (simulado)'),
            value: darkMode,
            onChanged: (v) => setState(() => darkMode = v),
          ),
          ListTile(
            title: const Text('Tamanho do texto'),
            subtitle: Slider(
              value: textScale,
              min: 0.8, max: 1.4,
              divisions: 3,
              label: textScale.toStringAsFixed(1),
              onChanged: (v) => setState(() => textScale = v),
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text('Termos e privacidade'),
            trailing: Icon(Icons.chevron_right),
          ),
          const ListTile(
            title: Text('Sobre'),
            subtitle: Text('Recipe Social v1.0'),
          ),
        ],
      ),
    );
  }
}
