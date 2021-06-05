import 'package:api/loading.dart';
import 'package:api/update.dart';
import 'package:flutter/material.dart';
import 'pasien.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewJson extends StatefulWidget {
  @override
  _ViewJsonState createState() => _ViewJsonState();
}

class _ViewJsonState extends State<ViewJson> {
  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Future<Pasien> createMhs(String id, String nik, String nama, String jk,
      String usia, String alamat, String diagnosa) async {
    final String apiURL = "http://192.168.1.11/data_pasien/api/pasien";
    final response = await http.post(apiURL, body: {
      "id": id,
      "nik": nik,
      "nama": nama,
      "jk": jk,
      "usia": usia,
      "alamat": alamat,
      "diagnosa": diagnosa
    });

    if (response.statusCode == 200) {
      var responseString = json.decode(response.body.toString());

      return Pasien.fromJson(responseString);
    } else {
      return null;
    }
  }

  List listPasien = [];

  Future<String> getData() async {
    http.Response response = await http.get(
        "http://192.168.1.11/data_pasien/api/pasien",
        headers: {"Accept": "application/json;charset=UTF-8"});
    setState(() {
      var body = json.decode(response.body.toString());
      listPasien = body;
    });
  }

  TextEditingController _controllerNik = TextEditingController();
  TextEditingController _controllerNama = TextEditingController();
  TextEditingController _controllerJk = TextEditingController();
  TextEditingController _controllerUsia = TextEditingController();
  TextEditingController _controllerAlamat = TextEditingController();
  TextEditingController _controllerDiagnosa = TextEditingController();
  GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();

  var akhir;
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffold,
        appBar: AppBar(
          title: Text("Data Pasien"),
        ),
        body: StreamBuilder(
            stream: Stream.periodic(Duration(seconds: 2)),
            builder: (context, snapshot) {
              return MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    Text("Form Input Data Pasien"),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                            child: TextField(
                          controller: _controllerNik,
                          decoration: InputDecoration(hintText: "Nik"),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                            child: TextField(
                          controller: _controllerNama,
                          decoration: InputDecoration(hintText: "Nama"),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                            child: TextField(
                          controller: _controllerJk,
                          decoration:
                              InputDecoration(hintText: "Jenis Kelamin"),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                            child: TextField(
                          controller: _controllerUsia,
                          decoration: InputDecoration(hintText: "Usia"),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                            child: TextField(
                          controller: _controllerAlamat,
                          decoration: InputDecoration(hintText: "Alamat"),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                            child: TextField(
                          controller: _controllerDiagnosa,
                          decoration: InputDecoration(hintText: "Diagnosa"),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      onPressed: () async {
                        final Pasien mhs = await createMhs(
                            "",
                            _controllerNik.text,
                            _controllerNama.text,
                            _controllerJk.text,
                            _controllerUsia.text,
                            _controllerAlamat.text,
                            _controllerDiagnosa.text);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Loading()));
                      },
                      child: Text(
                        "Simpan",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Text("Data Pasien"),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    new SingleChildScrollView(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              height: 300.0,
                              child: new ListView.builder(
                                itemCount: listPasien.length,
                                itemBuilder: (BuildContext ctxt, int index) {
                                  return new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              "Nik : ${listPasien[index]['nik']}"),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              "Nama : ${listPasien[index]['nama']}"),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              "Jenis Kelamin : ${listPasien[index]['jk']}"),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              "Usia : ${listPasien[index]['usia']}"),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              "Alamat : ${listPasien[index]['alamat']}"),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          // Fungsi Untuk Mengambil Keputusan Lulus atau Tidak
                                          Text(
                                              "Diagnosa : ${listPasien[index]['diagnosa']}"),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Divider(
                                            thickness: 2,
                                          ),
                                        ],
                                      ),
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpdateScreen(
                                                          id: listPasien[index]
                                                                  ['id']
                                                              .toString(),
                                                          nik: listPasien[index]
                                                              ['nik'],
                                                          nama:
                                                              listPasien[index]
                                                                  ['nama'],
                                                          jk: listPasien[index]
                                                              ['jk'],
                                                          usia:
                                                              listPasien[index]
                                                                  ['usia'],
                                                          alamat:
                                                              listPasien[index]
                                                                  ['alamat'],
                                                          diagnosa:
                                                              listPasien[index]
                                                                  ['diagnosa'],
                                                        )));
                                          },
                                          child: Icon(Icons.edit))
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
