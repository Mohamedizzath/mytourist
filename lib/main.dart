import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mytourist/providers/location_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LocationApp());
}

class LocationApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}


List<SingleChildWidget> providers = [
  ChangeNotifierProvider<LocationDataProvider>(create: (_) => LocationDataProvider())
];