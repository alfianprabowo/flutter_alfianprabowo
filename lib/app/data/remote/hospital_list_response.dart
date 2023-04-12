import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:teramedik/app/data/models/hospital.dart';

class HospitalListResponse extends Equatable {
  final List<Hospital>? hospital;
  final int? currentPage;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Links>? links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  const HospitalListResponse({
    this.hospital,
    this.currentPage,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory HospitalListResponse.fromRawJson(String str) => HospitalListResponse.fromJson(json.decode(str));

  factory HospitalListResponse.fromJson(Map<String, dynamic> json) => HospitalListResponse(
        currentPage: json['current_page'],
        hospital: json['data'] != null ? List<Hospital>.from(json['data'].map((x) => Hospital.fromJson(x))) : null,
        firstPageUrl: json['first_page_url'],
        from: json['from'],
        lastPage: json['last_page'],
        lastPageUrl: json['last_page_url'],
        links: json['links'] != null ? List<Links>.from(json['links'].map((x) => Links.fromJson(x))) : null,
        nextPageUrl: json['next_page_url'],
        path: json['path'],
        perPage: json['per_page'],
        prevPageUrl: json['prev_page_url'],
        to: json['to'],
        total: json['total'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "data": hospital != null
            ? List<Hospital>.from(
                hospital!.map((Hospital x) => x.toJson()),
              )
            : null,
        // "links": links != null ? links!.toJson() : null,
      };

  @override
  List<Object?> get props => [
        hospital,
        currentPage,
        firstPageUrl,
        from,
        lastPage,
        lastPageUrl,
        links,
        nextPageUrl,
        path,
        perPage,
        prevPageUrl,
        to,
        total,
      ];
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
