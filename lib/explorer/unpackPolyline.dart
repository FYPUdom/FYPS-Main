import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
export 'package:google_polyline_algorithm/google_polyline_algorithm.dart' show decodePolyline;
//import 'package:google_polyline_algorithm/google_polyline_algorithm.dart' show decodePolyline;


  List<LatLng> polyLineCoordinates = [];
  class RouteResponse {
  Map<String, List<dynamic>> coordinates;
  Map<String, List<dynamic>> itinerary;
  Map<String, List<dynamic>> poiCategories;
  Map<String, List<dynamic>> leavetimepoi;

  dynamic vehicleMode;
  late Map<String, List<dynamic>> routing;

  RouteResponse(
      {required this.coordinates,
      required this.itinerary,
      required this.poiCategories,
      required this.vehicleMode,
      required this.routing,
      required this.leavetimepoi});

  factory RouteResponse.fromJson(Map<String, dynamic> json) {
    // coordinates Parsing
    Map<String, List<dynamic>> coordinates =
        Map<String, List<dynamic>>.from(json['Coords'] ?? {});
    debugPrint("Parsed Coordinates: $coordinates");

    // Parsing itinerary
    Map<String, List<dynamic>> itinerary =
        Map<String, List<dynamic>>.from(json['Itinerary'] ?? {});
    debugPrint("Parsed Itinerary: $itinerary");

    // Parsing poiCategories
    Map<String, List<dynamic>> poiCategories =
        Map<String, List<dynamic>>.from(json['POICategories'] ?? {});
    debugPrint("Parsed POICategories: $poiCategories");

    // Parsing vehicleMode
    dynamic vehicleMode = json['VehicleMode'];
    debugPrint("Parsed VehicleMode: $vehicleMode");

    // Parsing
    Map<String, List<dynamic>> leavetimepoi =
        Map<String, List<dynamic>>.from(json['LeaveTimePOI'] ?? {});
    debugPrint("Parsed LeaveTimePoI: $leavetimepoi");

    // routing Parsing
    Map<String, dynamic>? routingData = json['Routes'] as Map<String, dynamic>?;
    Map<String, List<dynamic>> routing = {};
    if (routingData != null) {
      routingData.forEach((key, value) {
        routing[key] = List.castFrom<dynamic, dynamic>(value);
      });
    }
    debugPrint("Parsed Routing: $routingData");

    return RouteResponse(
      coordinates: coordinates,
      itinerary: itinerary,
      poiCategories: poiCategories,
      vehicleMode: vehicleMode,
      routing: routing,
      leavetimepoi: leavetimepoi,
    );
  }
}


extension PolylineExt on List<List<num>> {
  List<LatLng> unpackPolyline() =>
      map((p) => LatLng(p[0].toDouble(), p[1].toDouble())).toList();
}
// Now you can use decodePolyline directly in your code
//List<LatLng> decodedPoints = decodePolyline('im{FgnzxRTLv@`@??fAh@rExBHD\\RHD??x@d@pBfAd@XhB|@pAv@l@VVLPJz@`@JFjAj@D@VNHDhBz@V@zC~An@ZtAt@LNjAf@B@FB^R??NHD@VLh@Xt@^pAp@bAd@^R|Av@TJDBv@^RJ~@d@ZPXNHDHFFDF@B@rB|@RV`BXTBp@Hl@?|@It@BpBf@b@JLBJ@????B?@?~@B|@HtCX~BXtAPPBj@HZ@L?D@X@xAMDzEBdCZMvAk@p@_@^S\\IR@VJPHVHBdC?@?@@b@?NDvDBnBBtB?@???B@Z?HFbFFzJCxB@L?@?@?@?@?B?B?BBbD?@?????@DhGRl@@??@@BRn@JVPXjDdEf@v@B@??@@BDV^z@rABBBBrDzDxAdAhBpA????????d@Zd@f@rAtAhC|CLNJJ`AdA\\d@???@f@t@b@bAZxARtCDp@@TR|H?J').cast<LatLng>();

