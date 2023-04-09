import 'package:equatable/equatable.dart';

class Hospital extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? address;
  final String? province;
  final String? city;
  final String? district;
  final String? subDistrict;
  final String? lat;
  final String? lng;
  final String? phone;
  final String? email;
  final String? description;
  final String? createdAt;
  final String? updatedAt;

  const Hospital({
    this.id,
    this.name,
    this.image,
    this.address,
    this.province,
    this.city,
    this.district,
    this.subDistrict,
    this.lat,
    this.lng,
    this.phone,
    this.email,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        address: json['address'],
        province: json['province'],
        city: json['city'],
        district: json['district'],
        subDistrict: json['sub_district'],
        lat: json['lat'],
        lng: json['lng'],
        phone: json['phone'],
        email: json['email'],
        description: json['description'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "name": name,
        "image": image,
        "address": address,
        "province": province,
        "city": city,
        "district": district,
        "sub_district": subDistrict,
        "lat": lat,
        "lng": lng,
        "phone": phone,
        "email": email,
        "description": description,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        address,
        province,
        city,
        district,
        subDistrict,
        lat,
        lng,
        phone,
        email,
        description,
        createdAt,
        updatedAt,
      ];
}
