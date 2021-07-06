class LocationModel{
  final String name;
  final String image;
  final String shortDetails;

  LocationModel({required this.name, required this.image, required this.shortDetails});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
      name: json['name'],
      image: json['image'],
      shortDetails: json['short-details']);
}

List<LocationModel> listOfLocations = [];