import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(PointsOfInterestApp());


class PointsOfInterestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Points of Interest',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.cyan,
        scaffoldBackgroundColor: Colors.black,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.cyan,
        ),
     ),
     home: HomeScreen(),
   );
 }
}
lass HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();


class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController mapController;

  final LatLng _defaultLocation = LatLng(37.7749, -122.4194); // San Francisco Example

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Points of Interest"),
       centerTitle: true,
        backgroundColor: Colors.cyan[800],
     ),
     body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _defaultLocation,
              zoom: 12,
            ),
         ),
         Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(12),
             decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
               borderRadius: BorderRadius.circular(10),
             ),
             child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Explore Points of Interest",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                 ),
                 SizedBox(height: 8),
                 Text(
                    "Tap on the map to find interesting locations nearby.",
                    style: TextStyle(color: Colors.white70),
                 ),
               ],
             ),
           ),
         ),
       ],
     ),
     floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Placeholder for future offline maps button
        },
       child: Icon(Icons.map),
     ),
   );
 }
}
