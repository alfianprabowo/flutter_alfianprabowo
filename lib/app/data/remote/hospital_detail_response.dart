import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:teramedik/app/data/models/hospital.dart';

class HospitalDetailResponse extends Equatable {
  final Hospital? data;

  const HospitalDetailResponse({
    this.data,
  });

  factory HospitalDetailResponse.fromRawJson(String str) =>
      HospitalDetailResponse.fromJson(json.decode(str));

  factory HospitalDetailResponse.fromJson(Map<String?, dynamic> json) =>
      HospitalDetailResponse(
        data: json['data'] != null ? Hospital.fromJson(json['data']) : null,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "data": data != null ? data!.toJson() : null,
      };

  @override
  List<Object?> get props => [
        data,
      ];
}
