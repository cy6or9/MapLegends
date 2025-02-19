import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:points_of_interest/services/map_storage.dart';

class HomeScreen extends StatefulWidget {
    @override
    _HomeScreenState createState() => _HomeScreenState();


  class _HomeScreenState extends State<HomeScreen> {
      final LatLng _initialCenter = LatLng(37.7749, -122.4194); // Default to San Francisco

      @override
      Widget build(BuildContext context) {
            final mapStorage = Provider.of<MapStorage>(context);
           return Scaffold(
                   appBar: AppBar(title: Text('Points of Interest')),
                  body: FlutterMap(
                            options: MapOptions(center: _initialCenter, zoom: 12),
                           children: [
                                       TileLayer(
                                                     urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                                     subdomains: ['a', 'b', 'c'],
                                                    tileProvider: mapStorage.getTileProvider(),
                                                  ),
                                      MarkerLayer(
                                                    markers: [
                                                                    Marker(
                                                                                      point: LatLng(37.7749, -122.4194),
                                                                                     builder: (ctx) => Icon(Icons.location_on, color: Colors.red, size: 30),
                                                                                   ),
                                                                 ],
                                                 ),
                                    ],
                         ),
                  floatingActionButton: FloatingActionButton(
                            onPressed: () async {
                                        await mapStorage.downloadOfflineMap(
                                                      LatLngBounds(LatLng(37.70, -122.50), LatLng(37.80, -122.35)),
                                                     10,
                                                      16,
                                                    );
                                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Offline map saved!')));
                            },
                           child: Icon(Icons.download),
                         ),
                );
      }
  }
