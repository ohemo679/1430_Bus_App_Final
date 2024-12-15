import 'package:flutter/material.dart';

class NextBusAlert extends StatelessWidget {
  final String routeNumber;
  final String destination;
  final String arrivalTime;

  const NextBusAlert({
    super.key,
    required this.routeNumber,
    required this.destination,
    required this.arrivalTime,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Next bus alert: Route $routeNumber to $destination arriving in $arrivalTime',
      child: Card(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.directions_bus,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next Bus',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$routeNumber - $destination',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Arriving in $arrivalTime',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
