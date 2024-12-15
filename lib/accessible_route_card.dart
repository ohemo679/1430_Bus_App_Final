import 'package:flutter/material.dart';

class AccessibleRouteCard extends StatelessWidget {
  final String routeNumber;
  final String destination;
  final String time;
  final VoidCallback onTap;

  const AccessibleRouteCard({
    super.key,
    required this.routeNumber,
    required this.destination,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Accessibility Options Bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Voice Guidance Option
              Column(
                children: const [
                  Icon(Icons.record_voice_over),
                  Text('Voice Guide', style: TextStyle(fontSize: 12)),
                ],
              ),
              // Color Blind Mode
              Column(
                children: const [
                  Icon(Icons.palette),
                  Text('Color Mode', style: TextStyle(fontSize: 12)),
                ],
              ),
              // Text Size
              Column(
                children: const [
                  Icon(Icons.text_fields),
                  Text('Text Size', style: TextStyle(fontSize: 12)),
                ],
              ),
              // Screen Reader
              Column(
                children: const [
                  Icon(Icons.visibility),
                  Text('Screen Reader', style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
        // Original Card Content
        Semantics(
          button: true,
          label: 'Route $routeNumber to $destination, arriving in $time',
          child: Card(
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.directions_bus, size: 24),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              routeNumber,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              destination,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}