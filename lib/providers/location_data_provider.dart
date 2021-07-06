import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mytourist/models/location_model.dart';

class LocationDataProvider with ChangeNotifier{

  List<LocationModel> locationList = [];

  loadLocations(){
    FirebaseFirestore.instance.collection('locations').get().then((querySnapshot){
      querySnapshot.docs.forEach((queryDocSnapshot) {
        if(queryDocSnapshot.exists){
          locationList.add(LocationModel.fromJson(queryDocSnapshot.data()));
        }
      });
      notifyListeners();
    });
  }
}