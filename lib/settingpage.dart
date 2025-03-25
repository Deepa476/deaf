import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue, // Reverted to original theme
      ),
      home: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  String _selectedTheme = 'Light';
  String _selectedLanguage = 'English';
  double _volumeLevel = 50.0; // Default volume at 50%

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.lightBlue, // Matches the original theme
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Notifications Toggle
            SwitchListTile(
              title: const Text('Notifications'),
              subtitle: const Text('Enable push notifications'),
              value: _notificationsEnabled,
              activeColor: Colors.lightBlue, // Matches the theme
              secondary: const Icon(Icons.notifications),
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            const Divider(),

            // Theme Selection
            ListTile(
              title: const Text('Theme'),
              subtitle: Text('Current: $_selectedTheme'),
              leading: const Icon(Icons.brightness_6),
              onTap: () {
                _showThemeDialog(context);
              },
            ),
            const Divider(),

            // Language Selection
            ListTile(
              title: const Text('Language'),
              subtitle: Text('Current: $_selectedLanguage'),
              leading: const Icon(Icons.language),
              onTap: () {
                _showLanguageDialog(context);
              },
            ),
            const Divider(),

            // Volume Control
            ListTile(
              title: const Text('Volume'),
              subtitle: Text('Level: ${_volumeLevel.round()}%'),
              leading: const Icon(Icons.volume_up),
              trailing: SizedBox(
                width: 200,
                child: Slider(
                  value: _volumeLevel,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: _volumeLevel.round().toString(),
                  activeColor: Colors.lightBlue, // Matches the theme
                  onChanged: (value) {
                    setState(() {
                      _volumeLevel = value;
                    });
                  },
                ),
              ),
            ),
            const Divider(),

            // Reset Settings
            ListTile(
              title: const Text('Reset to Defaults'),
              leading: const Icon(Icons.restore),
              onTap: () {
                _resetSettings();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings reset to defaults')),
                );
              },
            ),
            const Divider(),

            // Save Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Save Settings'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue, // Matches the theme
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Settings Saved')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dialog for Theme Selection
  void _showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: const Text('Light'),
                value: 'Light',
                groupValue: _selectedTheme,
                onChanged: (value) {
                  setState(() {
                    _selectedTheme = value!;
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('Dark'),
                value: 'Dark',
                groupValue: _selectedTheme,
                onChanged: (value) {
                  setState(() {
                    _selectedTheme = value!;
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('System Default'),
                value: 'System Default',
                groupValue: _selectedTheme,
                onChanged: (value) {
                  setState(() {
                    _selectedTheme = value!;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Dialog for Language Selection
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: const Text('English'),
                value: 'English',
                groupValue: _selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('Spanish'),
                value: 'Spanish',
                groupValue: _selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('French'),
                value: 'French',
                groupValue: _selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Reset Settings to Defaults
  void _resetSettings() {
    setState(() {
      _notificationsEnabled = true;
      _selectedTheme = 'Light';
      _selectedLanguage = 'English';
      _volumeLevel = 50.0;
    });
  }
}