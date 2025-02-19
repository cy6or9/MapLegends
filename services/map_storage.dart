import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:latlong2/latlong.dart';

class MapStorage extends ChangeNotifier {
    static Future<void> initialize() async {
          await FMTC.instance('offlineMap').manage.createAsync();
    }

    TileProvider getTileProvider() {
          return FMTC.instance('offlineMap').getTileProvider();
    }

    Future<void> downloadOfflineMap(LatLngBounds bounds, int minZoom, int maxZoom) async {
          await FMTC.instance('offlineMap').download.startForeground(
                  boundingBox: bounds,
                  minZoom: minZoom,
                  maxZoom: maxZoom,
                  buffer: 2,
                );
         notifyListeners();
    }
}
