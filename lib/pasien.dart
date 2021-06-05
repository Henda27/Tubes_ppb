// To parse this JSON data, do
//
//     final pasien = pasienFromJson(jsonString);

import 'dart:convert';

List<Pasien> pasienFromJson(String str) =>
    List<Pasien>.from(json.decode(str).map((x) => Pasien.fromJson(x)));

String pasienToJson(List<Pasien> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pasien {
  Pasien({
    this.id,
    this.nik,
    this.nama,
    this.jk,
    this.usia,
    this.alamat,
    this.diagnosa,
  });

  String id;
  String nik;
  String nama;
  String jk;
  String usia;
  String alamat;
  String diagnosa;

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        id: json['id'],
        nik: json["nik"],
        nama: json["nama"],
        jk: json["jk"],
        usia: json["usia"],
        alamat: json["alamat"],
        diagnosa: json["diagnosa"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nik": nik,
        "nama": nama,
        "jk": jk,
        "usia": usia,
        "alamat": alamat,
        "diagnosa": diagnosa,
      };
}
