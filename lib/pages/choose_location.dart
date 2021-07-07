import 'package:flutter/material.dart';
import 'package:mytourist/models/location_model.dart';

class Location extends StatefulWidget {
  //const Location({Key key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    final location =
        ModalRoute.of(context)!.settings.arguments as LocationModel;
    return Scaffold(
      backgroundColor: Colors.white,
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
        child: Column(
          children: <Widget>[
            Text(
              location.name,
              style: TextStyle(
                color: Color.fromRGBO(30, 30, 30, 1),
                fontFamily: 'Oswald',
                fontSize: 32.0,
              ),
            ),
            Text(
              location.details,
              style: TextStyle(
                color: Color.fromRGBO(30, 30, 30, 1),
                fontFamily: 'Oswald',
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(location.image), fit: BoxFit.fitWidth),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                    color: Colors.pink,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.location_on_outlined),
                    color: Colors.black,
                  ),
                ]),
                SizedBox(
                  width: 2.0,
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(30, 30, 30, 1)),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.add_location,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        'Book Location',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Oswald',
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
