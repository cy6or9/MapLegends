import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:points_of_interest/screens/home_screen.dart';
import 'package:points_of_interest/services/map_storage.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
   await MapStorage.initialize(); // Initialize offline storage
    runApp(PointsOfInterestApp());


  class PointsOfInterestApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
            return MultiProvider(
                    providers: [
                              ChangeNotifierProvider(create: (_) => MapStorage()),
                           ],
                   child: MaterialApp(
                             title: 'Points of Interest',
                             theme: ThemeData.dark().copyWith(
                                         primaryColor: Colors.cyan,
                                         scaffoldBackgroundColor: Colors.black,
                                         floatingActionButtonTheme: FloatingActionButtonThemeData(
                                                       backgroundColor: Colors.cyan,
                                                     ),
                                      ),
                            home: HomeScreen(),
                          ),
                 );
      }
  }
