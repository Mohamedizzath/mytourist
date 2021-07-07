class LocationModel{
  final String name;
  final String image;
  final String shortDetails;
  final String details;

  LocationModel({required this.name, required this.image, required this.shortDetails, required this.details});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
      name: json['name'],
      image: json['image'],
      shortDetails: json['short-details'],
      details: json['details']);
}

List<LocationModel> listOfLocations = [];