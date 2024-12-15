import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _locationEnabled = true;
  bool _darkModeEnabled = false;
  bool _highContrastEnabled = false;
  double _textSize = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // Accessibility Settings
         _buildSection(
  title: 'Accessibility',
  children: [
    SwitchListTile(
      title: const Text('High Contrast Mode'),
      subtitle: const Text('Increase contrast for better visibility'),
      value: _highContrastEnabled,
      onChanged: (value) {
        setState(() => _highContrastEnabled = value);
      },
    ),
    ListTile(
      title: const Text('Text Size'),
      subtitle: Slider(
        value: _textSize,
        min: 0.8,
        max: 1.4,
        divisions: 3,
        label: _textSize.toString(),
        onChanged: (value) {
          setState(() => _textSize = value);
        },
      ),
    ),
    // New Accessibility Options
    SwitchListTile(
      title: const Text('Voice Guidance'),
      subtitle: const Text('Audio announcements for navigation'),
      value: false,
      onChanged: (value) {}, // Non-functional for demo
    ),
    SwitchListTile(
      title: const Text('Screen Reader Support'),
      subtitle: const Text('Enable enhanced screen reader descriptions'),
      value: false,
      onChanged: (value) {}, // Non-functional for demo
    ),
    SwitchListTile(
      title: const Text('Color Blind Mode'),
      subtitle: const Text('Optimize colors for color vision deficiencies'),
      value: false,
      onChanged: (value) {}, // Non-functional for demo
    ),
    SwitchListTile(
      title: const Text('Reduce Motion'),
      subtitle: const Text('Minimize animations and transitions'),
      value: false,
      onChanged: (value) {}, // Non-functional for demo
    ),
  ],
),
          // Notification Settings
          _buildSection(
            title: 'Notifications',
            children: [
              SwitchListTile(
                title: const Text('Enable Notifications'),
                subtitle: const Text('Get updates about your routes'),
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() => _notificationsEnabled = value);
                },
              ),
            ],
          ),

          // Location Settings
          _buildSection(
            title: 'Location',
            children: [
              SwitchListTile(
                title: const Text('Location Services'),
                subtitle: const Text('Allow access to your location'),
                value: _locationEnabled,
                onChanged: (value) {
                  setState(() => _locationEnabled = value);
                },
              ),
            ],
          ),

          // Display Settings
          _buildSection(
            title: 'Display',
            children: [
              SwitchListTile(
                title: const Text('Dark Mode'),
                subtitle: const Text('Enable dark theme'),
                value: _darkModeEnabled,
                onChanged: (value) {
                  setState(() => _darkModeEnabled = value);
                },
              ),
            ],
          ),

          // About Section
          _buildSection(
            title: 'About',
            children: [
              const ListTile(
                title: Text('Version'),
                subtitle: Text('1.0.0'),
              ),
              ListTile(
                title: const Text('Terms of Service'),
                onTap: () {/* Navigate to Terms */},
              ),
              ListTile(
                title: const Text('Privacy Policy'),
                onTap: () {/* Navigate to Privacy Policy */},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ...children,
        const Divider(),
      ],
    );
  }
}
