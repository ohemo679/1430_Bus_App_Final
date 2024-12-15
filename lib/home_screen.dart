
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:multi_screen/app_theme.dart';
import 'route_models.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  late GoogleMapController mapController;
  final LatLng _pittsburghCoords = const LatLng(40.4406, -79.9959);
  List<BusRoute> routes = [];
  Map<String, Marker> _markers = {};
  List<String> _schedulingAlerts = [
    "Route 61A: 15-minute delays due to construction on Forbes Ave",
    "Route 71C: Service temporarily suspended between Oakland and Downtown",
    "Route P1: Weekend schedule changes effective December 10",
    "Route 28X: Airport service experiencing delays due to weather"
  ];
  BusRoute? selectedRoute;

  @override
  void initState() {
    super.initState();
    SemanticsService.announce('Pittsburgh Transit home screen loaded', TextDirection.ltr);
    _loadBusRoutes();
  }

  Future<void> _loadBusRoutes() async {
    try {
      final String response = await rootBundle.loadString('assets/bus_schedule.json');
      final List<dynamic> data = json.decode(response)['routes'];
      setState(() {
        routes = data.map((json) => BusRoute.fromJson(json)).toList();
        _updateMarkers();
      });
    } catch (e) {
      print('Error loading bus routes: $e');
    }
  }

  void _updateMarkers() {
    _markers = {};
    for (var route in routes) {
      for (var stop in route.stops) {
        final markerId = MarkerId(stop.stopName);
        _markers[stop.stopName] = Marker(
          markerId: markerId,
          position: _pittsburghCoords,
          infoWindow: InfoWindow(
            title: stop.stopName,
            snippet: 'Route: ${route.routeName}',
          ),
        );
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
  leading: IconButton(
    icon: const Icon(Icons.home),
    onPressed: () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false,
      );
    },
    tooltip: 'Home',
  ),
  title: const Text('Pittsburgh Transit'),
  actions: [
    IconButton(
      icon: const Icon(Icons.person),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProfileScreen()),
      ),
      tooltip: 'Open Profile',
    ),
    IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SettingsScreen()),
      ),
      tooltip: 'Open Settings',
    ),
  ],
),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: _pittsburghCoords,
                zoom: 12,
              ),
              markers: Set<Marker>.of(_markers.values),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search routes...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: (value) => setState(() {}),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: routes.length,
                    itemBuilder: (context, index) {
                      final route = routes[index];
                      if (_searchController.text.isNotEmpty &&
                          !route.routeName.toLowerCase().contains(
                                _searchController.text.toLowerCase(),
                              )) {
                        return const SizedBox.shrink();
                      }
                      return ListTile(
                        title: Text(route.routeName),
                        subtitle: Text('Route ${route.routeId}'),
                        selected: selectedRoute?.routeId == route.routeId,
                        selectedTileColor: Colors.blue.withOpacity(0.1),
                        onTap: () => setState(() => selectedRoute = route),
                      );
                    },
                  ),
                  if (selectedRoute != null)
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Stops & Times',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 16),
                            ...selectedRoute!.stops.map((stop) => Card(
                              elevation: 1,
                              margin: const EdgeInsets.only(bottom: 16),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on, color: AppTheme.secondaryColor),
                                        const SizedBox(width: 8),
                                        Text(
                                          stop.stopName,
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: stop.times.map((time) => Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: AppTheme.surfaceColor,
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: AppTheme.dividerColor),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.access_time, size: 16, color: AppTheme.primaryColor),
                                            const SizedBox(width: 4),
                                            Text(time),
                                          ],
                                        ),
                                      )).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            )).toList(),
                            const SizedBox(height: 16),
                            Card(
                              margin: const EdgeInsets.only(top: 16),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.warning_amber, color: AppTheme.secondaryColor),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Service Alerts',
                                          style: Theme.of(context).textTheme.titleLarge,
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    ...(_schedulingAlerts.map((alert) => Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Row(
                                        children: [
                                          Icon(Icons.info_outline, 
                                              size: 20, 
                                              color: AppTheme.primaryColor.withOpacity(0.7)),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(alert),
                                          ),
                                        ],
                                      ),
                                    ))),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
