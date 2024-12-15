import 'package:flutter/material.dart';

import 'app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Header
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: AppTheme.primaryColor,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'James Bond',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Text('Regular Commuter'),
                ],
              ),
            ),
          ),

          //Payment
          Card(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment & Passes',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        // QR Code Container
        Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppTheme.primaryColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                Icons.qr_code_2,
                size: 150,
                color: AppTheme.primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Pass Information
        const ListTile(
          leading: Icon(Icons.credit_card),
          title: Text('Monthly Pass'),
          subtitle: Text('Valid until Dec 31, 2024'),
          trailing: Text('ACTIVE'),
        ),
        const Divider(),
        // Add Pass Button
        Center(
          child: ElevatedButton.icon(
            onPressed: () {
              // This would open pass upload functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Pass upload feature coming soon!'),
                ),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Bus Pass'),
          ),
        ),
      ],
    ),
  ),
),

          // Favorite Routes
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Favorite Routes',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('1 - Freeport Road'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('12 - Brighton'),
                  ),
                ],
              ),
            ),
          ),

          // Travel History
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Trips',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const ListTile(
                    leading: Icon(Icons.history),
                    title: Text('Downtown → Oakland'),
                    subtitle: Text('Yesterday, 3:30 PM'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.history),
                    title: Text('Oakland → South Side'),
                    subtitle: Text('Yesterday, 9:00 AM'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
