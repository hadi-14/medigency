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
  LatLng userLocation =
      LatLng(24.8573019, 67.0728381); // Initialize user's location with (0, 0)

  @override
  void initState() {
    super.initState();
    fetchUserLocation();
  }

  Future<void> fetchUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      userLocation = LatLng(position.latitude, position.longitude);
      print(userLocation);
      fetchNearbyHospitals(position.latitude, position.longitude);
    });
  }

  Future<void> fetchNearbyHospitals(double lat, double lng) async {
    String apiKey = 'fsq3JW9sjElDQeSf3ZyTiaP5kYSi3KZEOoGPqUqtnUUpZVE=';

    String apiUrl =
        'https://api.foursquare.com/v2/venues/search?client_id=$apiKey'
        '&v=20211101&ll=$lat,$lng'
        '&query=hospital';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final venues = data['response']['venues'] as List<dynamic>;

      for (var venue in venues) {
        final location = venue['location'];

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
                    color: Color(0xFFb7b6b6), // Gray color in hex
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pop(); // Navigate to main page
                          },
                          child: Container(
                            width: 150, // Set your desired width
                            height: 50, // Set your desired height
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/logo_text.png'), // Replace with your logo
                              ),
                            ),
                          ),
                        ), // Profile Icon and Name
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
                              'Abdullah', // Replace with the actual name
                              style: TextStyle(
                                  color: Color.fromARGB(255, 112, 112, 112),
                                  fontSize: 10),
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
                center: userLocation, // Set the map's center to user's location
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
