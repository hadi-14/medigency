import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Marker> hospitalMarkers = [];

  @override
  void initState() {
    super.initState();
    fetchNearbyHospitals();
  }

  Future<void> fetchNearbyHospitals() async {
    // Get current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Fetch nearby hospitals using Google Places API
    String apiKey = 'YOUR_GOOGLE_PLACES_API_KEY';
    String apiUrl =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
        'location=${position.latitude},${position.longitude}'
        '&radius=5000&type=hospital&key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;

      for (var result in results) {
        final name = result['name'];
        final placeId = result['place_id'];
        final geometry = result['geometry'];
        final location = geometry['location'];

        final lat = location['lat'];
        final lng = location['lng'];

        final hospitalMarker = Marker(
          width: 40.0,
          height: 40.0,
          point: LatLng(lat, lng),
          child: Icon(
            Icons.local_hospital,
            color: Colors.red,
          ),
        );

        setState(() {
          hospitalMarkers.add(hospitalMarker);
        });
      }
    } else {
      throw Exception('Failed to fetch hospitals');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(75.0),
              child: AppBar(
                backgroundColor: Colors.red,
                elevation: 0.0,
                flexibleSpace: Container(
                  height: 68.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFFb7b6b6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          height: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/logo_text.png'),
                            ),
                          ),
                        ),
                        const Column(
                          children: [
                            SizedBox(height: 2),
                            Icon(
                              Icons.person_rounded,
                              size: 35,
                              color: Color.fromARGB(255, 112, 112, 112),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Abdullah',
                              style: TextStyle(
                                color: Color.fromARGB(255, 112, 112, 112),
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: FlutterMap(
              options: MapOptions(
                center: LatLng(0,
                    0), // Initial center (will be updated to current location)
                zoom: 15.0, // Zoom level
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(markers: hospitalMarkers),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
