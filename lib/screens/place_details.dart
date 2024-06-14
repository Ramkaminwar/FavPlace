import 'package:favourite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:favourite_places/widgets/map_view.dart';
import 'package:favourite_places/screens/map.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(place.title),
        ),
        body: Stack(children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 40,
            right: 0,
            left: 0,
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => MapScreen(
                              location: place.location,
                              isSelecting: true,
                            ),
                          ),
                        );
                      },
                      child: AbsorbPointer(
                        // helps GestureDetector to listen for tap
                        child: MapView(
                          latitude: place.location.latitude,
                          longitude: place.location.longitude,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
