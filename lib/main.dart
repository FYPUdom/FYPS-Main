/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> makePostRequest() async {
  var url = 'http://10.0.2.2:7687/getrecommendation';

  int convertToSeconds(int hour, int min) {
    var totalSeconds = (hour * 3600) + (min * 60);
    return totalSeconds.toInt();
  }

  var UserAvailHour = 8;
  var UserAvailMin = 0;

  final Map<String, dynamic> jsondata = {
    'uid': "108938050734323740126",
    'request_model_to_predict_ranked_pois_given_uid': "200",
    'topk': "2",
    'topn': "3",
    'useravailtime': convertToSeconds(UserAvailHour, UserAvailMin),
    'vehiclemode': "4",
    'mode': "2",
    'userendpoi': "lower seletar reservoir",
    'latuser': "1.3792633",
    'longuser': "103.8486083",
    'allow_consecutive_foodpoi_in_itinerary': true,
    'StartDateTime': "2023-05-23 12:00:00"
  };

  var headers = {
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*'
  };
  var body = jsonEncode(jsondata);

  // Create a client and use it for the request
  final client = http.Client();
  try {
    final response = await client.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      //final Map<String, dynamic> data = jsonDecode(response.body);
      //print('response: $data');
      printJsonInChunks(response.body);
      print('POST request successful profile');
    } else {
      print('POST request failed with status code ${response.statusCode}');
    }
  } finally {
    // Close the client after the request is done
    client.close();
  }
}

void main() {
  runApp(const MyApp());
}

void printJsonInChunks(String jsonString) {
  const int chunkSize = 1000;
  for (var i = 0; i < jsonString.length; i += chunkSize) {
    var end =
        (i + chunkSize < jsonString.length) ? i + chunkSize : jsonString.length;
    print(jsonString.substring(i, end));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await makePostRequest();
            },
            child: Text('Run Code'),
          ),
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:helloworld/explorer/unpackPolyline.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: MapController(),
      options: MapOptions(
        initialCenter: LatLng(1.3521, 103.8198),
        initialZoom: 13,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () =>
                  launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
            ),
          ],
        ),
          PolylineLayer(polylines: [
            Polyline(
              //points: [LatLng(1.2929049982, 103.8525965871), LatLng(1.2925000652,103.851453155), LatLng(1.35146352387757,103.835344599828)],
              points: decodePolyline('im{FgnzxRTLv@`@??fAh@rExBHD\\RHD??x@d@pBfAd@XhB|@pAv@l@VVLPJz@`@JFjAj@D@VNHDhBz@V@zC~An@ZtAt@LNjAf@B@FB^R??NHD@VLh@Xt@^pAp@bAd@^R|Av@TJDBv@^RJ~@d@ZPXNHDHFFDF@B@rB|@RV`BXTBp@Hl@?|@It@BpBf@b@JLBJ@????B?@?~@B|@HtCX~BXtAPPBj@HZ@L?D@X@xAMDzEBdCZMvAk@p@_@^S\\IR@VJPHVHBdC?@?@@b@?NDvDBnBBtB?@???B@Z?HFbFFzJCxB@L?@?@?@?@?B?B?BBbD?@?????@DhGRl@@??@@BRn@JVPXjDdEf@v@B@??@@BDV^z@rABBBBrDzDxAdAhBpA????????d@Zd@f@rAtAhC|CLNJJ`AdA\\d@???@f@t@b@bAZxARtCDp@@TR|H?J').unpackPolyline(), // Returns `List<LatLng>` for a map polyline
              color: Colors.blue,
              strokeWidth: 4 //Thickness of Line
            )
          ]),
              const MarkerLayer(
                markers: [
                Marker(
                point: LatLng(1.2684889249, 103.825717174),
                width: 40,
                height: 40,
                child: Icon(
                Icons.location_on, // You can replace this with your custom widget
                color: Colors.blue,
                size: 40.0,
                ),
                ),
                // Marker(
                // point: LatLng(1.2684889249, 103.825717174),
                // width: 40,
                // height: 40,
                // child: FlutterLogo(),
                // ),
              ],
            ),
      ],
    );
  }
}
