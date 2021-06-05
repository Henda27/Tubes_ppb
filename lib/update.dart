import 'package:api/pasien.dart';
import 'package:api/v_json.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdateScreen extends StatefulWidget {
  final String id, nik, nama, jk, usia, alamat, diagnosa;
  UpdateScreen(
      {Key key,
      this.id,
      this.nik,
      this.nama,
      this.jk,
      this.usia,
      this.alamat,
      this.diagnosa})
      : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  void initState() {
    super.initState();
    _controllerNik.text = widget.nik;
    _controllerNama.text = widget.nama;
    _controllerJk.text = widget.jk;
    _controllerUsia.text = widget.usia;
    _controllerAlamat.text = widget.alamat;
    _controllerDiagnosa.text = widget.diagnosa;
  }

  Future<Pasien> updatePasien(
      String id, nik, nama, jk, usia, alamat, diagnosa) async {
    final String apiURL = "http://192.168.1.11/data_pasien/api/pasien";
    final response = await http.put(apiURL, body: {
      "id": id,
      "nik": nik,
      "nama": nama,
      "jk": jk,
      "usia": usia,
      "alamat": alamat,
      "diagnosa": diagnosa
    });

    if (response.statusCode == 200) {
      var responseString = json.decode(response.body);

      return Pasien.fromJson(responseString);
    } else {
      return null;
    }
  }

  TextEditingController _controllerNik = TextEditingController();
  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerJk = TextEditingController();
  TextEditingController _controllerUsia = TextEditingController();
  TextEditingController _controllerAlamat = TextEditingController();
  TextEditingController _controllerDiagnosa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Data Pasien'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Update Data Pasien",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: Colors.blue),
                    hintText: "Enter Nik",
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                  ),
                  controller: _controllerNik,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: Colors.blue),
                    hintText: "Enter Nama",
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                  ),
                  controller: _controllerNama,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: Colors.blue),
                    hintText: "Enter Jenis Kelamin",
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                  ),
                  controller: _controllerJk,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: Colors.blue),
                    hintText: "Enter Usia",
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                  ),
                  controller: _controllerUsia,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: Colors.blue),
                    hintText: "Enter Alamat",
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                  ),
                  controller: _controllerAlamat,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: Colors.blue),
                    hintText: "Enter Diagnosa",
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                  ),
                  controller: _controllerDiagnosa,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () async {
                      final Pasien pasien = await updatePasien(
                          widget.id,
                          _controllerNik.text,
                          _controllerNama.text,
                          _controllerJk.text,
                          _controllerUsia.text,
                          _controllerAlamat.text,
                          _controllerDiagnosa.text);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ViewJson()));
                    },
                    padding: EdgeInsets.all(0),
                    child: Ink(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue),
                      child: Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints(
                            maxWidth: double.infinity, minHeight: 50),
                        child: Text(
                          "Perbarui",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
