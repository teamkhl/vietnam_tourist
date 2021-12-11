import 'package:cloud_firestore/cloud_firestore.dart';

class Newplacenames{
  String name;
  String longitude;
  String latitude;
  String description;
  String specialties;
  String Image;
 accountID accountId;
 bool beBrowsed;
String? referenceId;
List<ImagesOfNewPlaceNames> ImagesOfNewPlaceNames;
Newplacenames(
   this.name, {
    this.longitude,
   this.latitude,
   this.description,
   this.specialties,
   this.referenceId,
   required this.Image,
   required this.beBrowsed,
   required this.accountId
   });
   factory Newplacenames.fromSnapshot(DocumentSnapshot snapshot) {
    final Newplacenames = Newplacenames.fromJson(snapshot.data() as Map<String, dynamic>);
    Newplacenames.referenceId = snapshot.reference.id;
    return Newplacenames;
  }

  factory Newplacenames.fromJson(Map<String, dynamic> json) => _NewplacenamesFromJson(json);

  Map<String, dynamic> toJson() => _NewplacenamesToJson(this);

  @override
  
  String Image;
 accountID accountId;
 bool beBrowsed;
  String toString() => 'Newplacenames<$name>';
  Newplacenames _NewplacenamesFromJson(Map<String, dynamic> json) {
  return Newplacenames(json['name'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      description: json['description'] as String,
      specialties: json['specialties'] as String,
      Image: json['Image'] as String,
      ImagesOfNewPlaceNames:
          _convertImagesOfNewPlaceNames(json['ImagesOfNewPlaceNames'] as List<dynamic>));
         
}

List<ImagesOfNewPlaceNames> _convertImagesOfNewPlaceNames(List<dynamic> ImagesOfNewPlaceNamesMap) {
  final ImagesOfNewPlaceNames = <ImagesOfNewPlaceNames>[];

  for (final ImagesOfNewPlaceNames in ImagesOfNewPlaceNamesMap) {
   ImagesOfNewPlaceNames.add(ImagesOfNewPlaceNames.fromJson(ImagesOfNewPlaceNames as Map<String, dynamic>));
  }
  return ImagesOfNewPlaceNames;
}
Map<String, dynamic> _placenamesToJson(Newplacenames instance) => <String, dynamic>{
      'name': instance.name,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'description': instance.description,
      'specialties': instance.specialties,
      'Image': instance.Image,
      'ImagesOfNewPlaceNames': _ImagesOfNewPlaceNamesList(instance.ImagesOfNewPlaceNames),
    };

List<Map<String, dynamic>>? _commentList(List<ImagesOfNewPlaceNames>? ImagesOfNewPlaceNames) {
  if (ImagesOfNewPlaceNames == null) {
    return null;
  }
  final ImagesOfNewPlaceNamesMap = <Map<String, dynamic>>[];
  ImagesOfNewPlaceNames.forEach((ImagesOfNewPlaceNames) {
    ImagesOfNewPlaceNamesMap.add(ImagesOfNewPlaceNames.toJson());
  });
  return ImagesOfNewPlaceNamesMap;
}
}