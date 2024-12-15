class RouteStop {
 final String stopName;
 final List<String> times;

 RouteStop({required this.stopName, required this.times});

 factory RouteStop.fromJson(Map<String, dynamic> json) {
   return RouteStop(
     stopName: json['stop_name'],
     times: List<String>.from(json['times']),
   );
 }
}

class BusRoute {
 final String routeId;
 final String routeName; 
 final List<RouteStop> stops;
 bool isFavorite;

 BusRoute({
   required this.routeId,
   required this.routeName,
   required this.stops,
   this.isFavorite = false,
 });

 factory BusRoute.fromJson(Map<String, dynamic> json) {
   return BusRoute(
     routeId: json['route_id'],
     routeName: json['route_name'],
     stops: (json['stops'] as List).map((i) => RouteStop.fromJson(i)).toList(),
     isFavorite: false,
   );
 }
}