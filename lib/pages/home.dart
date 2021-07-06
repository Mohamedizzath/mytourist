import 'package:flutter/material.dart';
import 'package:mytourist/main.dart';
import 'package:mytourist/models/location_model.dart';
import 'package:mytourist/providers/location_data_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    final mdl = Provider.of<LocationDataProvider>(context, listen: false);
    mdl.loadLocations();
  }

  @override
  Widget build(BuildContext context) {
    final mdl = Provider.of<LocationDataProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 30, 1),
      appBar: AppBar(
        title: Text(
          'MyTourist',
          style: TextStyle(
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Color.fromRGBO(30, 30, 30, 1),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
        child: ListView.builder(
            padding: EdgeInsets.all(4.0),
            itemCount: mdl.locationList.length,
            itemBuilder: (context, index) {
              LocationModel location = mdl.locationList[index];
              return LocationCard(
                name: location.name,
                shortDetails: location.shortDetails,
                image: location.image,
              );
            }),
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  final String image;
  final String name;
  final String shortDetails;

  LocationCard(
      {required this.image, required this.name, required this.shortDetails});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          Text(
            name,
            style: TextStyle(
              color: Color.fromRGBO(30, 30, 30, 1),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              fontFamily: 'Oswald',
            ),
          ),
          SizedBox(
            height: 3.0,
          ),
          Text(
            shortDetails,
            style: TextStyle(
              color: Color.fromRGBO(30, 30, 30, 1),
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              fontFamily: 'Oswald',
            ),
          ),
          SizedBox(
            height: 3.0,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.fitWidth),
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward),
                tooltip: 'More details',
              )
            ],
          ),
        ],
      ),
    );
  }
}
