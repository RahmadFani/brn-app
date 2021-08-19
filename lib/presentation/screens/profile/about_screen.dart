import 'dart:convert';
import 'dart:io';

import 'package:brn/config/constants.dart';
import 'package:brn/config/ip.dart';
import 'package:brn/model/about.dart';
import 'package:brn/presentation/component/shimmer_dark.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/profile/setting_card.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  List<AboutModel> history = [];
  List<AboutModel> regulation = [];
  List<AboutModel> sapta = [];
  List<AboutModel> adart = [];
  List<AboutModel> structure = [];
  void getData() async {
    Uri url = Uri.parse(IpClass().getip() + "/api/about");
    final response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
    });
    final res = json.decode(response.body);

    if (response.statusCode == 200) {
      if (mounted)
        setState(() {
          for (Map data in res['histories']) {
            history.add(AboutModel.fromJson(data));
          }
          for (Map data in res['organizational_regulations']) {
            regulation.add(AboutModel.fromJson(data));
          }
          for (Map data in res['tujuh_sapta_cipta']) {
            sapta.add(AboutModel.fromJson(data));
          }
          for (Map data in res['adarts']) {
            adart.add(AboutModel.fromJson(data));
          }
          for (Map data in res['organizational_structures']) {
            structure.add(AboutModel.fromJson(data));
          }
          loading = false;
        });
    }
  }

  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  int _currentTab = 0;
  String _title = 'Tentang';
  List<Widget> _tabPages = [
    SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 175,
            height: 175,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/brn.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            'Buser Rencar Nasional',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
            ),
          ),
          Text(
            'v 1.0.0',
            style: TextStyle(
              color: Colors.blue[800],
              fontSize: 12,
            ),
          ),
          SizedBox(height: kPaddingM),
          Text(
            'BRN sendiri merupakan sebuah wadah yang akan menangani berbagai kasus kejahatan terhadap para pelaku usaha rental mobil yang kerap muncul dan menjadi ancaman bagi kelangsungan usaha rentcar.',
          ),
        ],
      ),
    ),
    SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 175,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/images/sejarah.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: kPaddingM),
          Text(
            'Sejarah Buser Rencar Nasional',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
            ),
          ),
          SizedBox(height: kPaddingM),
          Text(
              'Kasus penggelapan mobil yang menimpa para pengusaha rental di masa pandemi Covid-19 meningkat. Modus yang mendominasi adalah kendaraan digadaikan oleh konsumen di luar kota.')
        ],
      ),
    ),
    SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'AD/ART',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
            ),
          ),
          SizedBox(height: kPaddingL * 1.5),
          Text(
            'BAB 1\nNAMA, WAKTU DAN TEMPAT KEDUDUKAN',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: kPaddingM),
          Text(
            'Pasal 1\n Nama Organisasi',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          Text('Organisasi ini bernama "BUSER RENTCAR NASIONAL"'),
          SizedBox(height: kPaddingM),
          Text(
            'Pasal 2\nWaktu dan Tempat Pendiritan',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: kPaddingS),
          Text(
              '(1) Di Jawa Barat, sampai saat ini sudah 195 pengusaha rental modbil yang menjadi anggota BRN di Kabupaten dan Kota yang ada di Jawa Barat. Pada Selasa 19 November 2019, dilakukan pertemuan bulanan BRN Koordinator Daerah (Korda)  Jawa Barat yang berlangsung di Kota Cimahi, sekaligus melaksanakan pelantikan pengurus BRN Korwil Kota Cimahi, yang diketuai oleh Abie.'),
          SizedBox(height: kPaddingM),
          Text('BAR 2'),
          Text(
            'AZAZ, SIFAT DAN CIRI PRGANISASI',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: kPaddingM),
          Text(
            'Pasal 3',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: kPaddingS),
          Text(
            '(1) Terdiri Dari Sekelompok Orang. Suatu organisasi harus memiliki anggota yang terdiri dari dua orang atau lebih.',
          ),
          SizedBox(height: kPaddingS),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '(2) Memiliki Tujuan.',
            ),
          ),
          SizedBox(height: kPaddingS),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '(3)Saling Bekerjasama.',
            ),
          ),
          SizedBox(height: kPaddingL),
          Text(
            'BAB 3\nMAKSUD DAN TUJUAN',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: kPaddingM),
          Text(
            'Pasal 4',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: kPaddingS),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Organisasi ini bermaksud untuk :',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: kPaddingS),
          Text(
              '(1)Terdiri Dari Sekelompok Orang. Suatu organisasi harus memiliki anggota yang terdiri dari dua orang atau lebih.'),
        ],
      ),
    ),
    SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Peraturan Organisasi',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
            ),
          ),
          SizedBox(height: kPaddingL * 1.5),
          Text(
            'BAB 1\nPENDAHULUAN',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: kPaddingM),
          Text(
              'Peraturan umum dan kode etik BRN, dibuat dengan maksud dan tujuan sebagai berikut:'),
          SizedBox(height: kPaddingS),
          Text(
              '(1) bahwa dalam rangka melindungi kedaulatan Negara Kesatuan Republik Indonesia berdasarkan Pancasila dan Undang-Undang Dasar Negara Republik Indonesia Tahun 1945, negara wajib menjaga persatuan dan kesatuan bangsa.'),
          SizedBox(height: kPaddingS),
          Text(
            '(2)bahwa berdasarkan pertimbangan sebagaimana dimaksud dalam huruf a dan huruf b, perlu membentuk Undang-Undang tentang Penetapan Peraturan Pemerintah Pengganti Undang-Undang Nomor 2 Tahun 2017 tentang Perubahan atas Undang-Undang Nomor 17 Tahun 2013 tentang Organisasi Kemasyarakatan menjadi Undang-Undang.',
          ),
          SizedBox(height: kPaddingL),
          Text(
            'BAB 2\nISTILAH DAN PENGERTIAN',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: kPaddingM),
          Text(
              'Untuk menyamakan persepsi dalam memahami peraturan tata tertib dan etika organisasi BRN dipandang perlu memberikan penjelasan tentang istilah dan pengertian yang dipergunakan dalam peraturan tata tertib dan etika organisasi.'),
          SizedBox(height: kPaddingS),
          Text(
              '(1) bahwa dalam rangka melindungi kedaulatan Negara Kesatuan Republik Indonesia berdasarkan Pancasila dan Undang-Undang Dasar Negara Republik Indonesia Tahun 1945, negara wajib menjaga persatuan dan kesatuan bangsa.'),
          SizedBox(height: kPaddingS),
          Text(
              '(2) bahwa dalam rangka melindungi kedaulatan Negara Kesatuan Republik Indonesia berdasarkan Pancasila dan Undang-Undang Dasar Negara Republik Indonesia Tahun 1945, negara wajib menjaga persatuan dan kesatuan bangsa.'),
        ],
      ),
    ),
    SingleChildScrollView(
      child: Column(
        children: [
          Text(
            '7 Sapta Cipta',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
            ),
          ),
          SizedBox(height: kPaddingL * 1.5),
          Text(
              '(1) Memberikan pendalaman materi usaha rental sehingga dapat mengurangi kasus kejahatan dalam usaha sewa mobil.'),
          SizedBox(height: kPaddingS),
          Text(
              '(2) Memberikan pendampingan, pemantauan   pengejaran dan eksekusi unit dari pelaku dimanapun dan siapapun.'),
          SizedBox(height: kPaddingS),
          Text(
              '(3) Memberantas habis pelaku kejahatan sewa mobil dengan membangun komunitas asosiasi mobil diseluruh indonesia.'),
          SizedBox(height: kPaddingS),
          Text(
              '(4) Bekerja sama dengan para penegak hukum di Indonesia dan memberikan sosialisasi BRN di daerah rawan kejahatan sewa kendaraan.'),
          SizedBox(height: kPaddingS),
          Text(
              '(5) Mengembangkan program keamanan yang tinggi dalam usaha sewa kendaraan dengan mengikuti perubahan jaman yang berbasis teknologi IT.'),
          SizedBox(height: kPaddingS),
          Text(
              '(6) Membantu memberikan talangan untuk operasional buser unit apabila korban dalam posisi keuangan yang tidak memungkinkan.'),
          SizedBox(height: kPaddingS),
          Text(
              '(7) Dukungan dana BRN di dapat dari para sponsorship, donatur dan penjualan merchandise dan pernak pernik Buser Rentcar Nasional.'),
          SizedBox(height: kPaddingS),
        ],
      ),
    ),
    SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 175,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/images/so.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: kPaddingM),
          Text(
            'Struktur Organisasi',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
            ),
          ),
          SizedBox(height: kPaddingM),
          Text(
              'Di Jawa Barat, sampai saat ini sudah 195 pengusaha rental modbil yang menjadi anggota BRN di Kabupaten dan Kota yang ada di Jawa Barat. Pada Selasa 19 November 2019, dilakukan pertemuan bulanan BRN Koordinator Daerah (Korda)  Jawa Barat yang berlangsung di Kota Cimahi, sekaligus melaksanakan pelantikan pengurus BRN Korwil Kota Cimahi, yang diketuai oleh Abie.')
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      backgroundHeigh: MediaQuery.of(context).size.height * 0.6,
      appBar: [
        SimpleAppBarTitle(title: _title),
      ],
      body: Column(
        children: [
          loading != true
              ? SettingCard(
                  child: Column(
                    children: [
                      Container(
                        height: 28.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: tabs(
                            labels: [
                              'Tentang',
                              'Sejarang',
                              'AD/ART',
                              'Pengaturan Organisasi',
                              '7 Sapta Cipta',
                              'Struktur Organisasi'
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: kPaddingM * 2),
                      Expanded(child: _tabPages[_currentTab]),
                      FittedBox(
                        child: Text(
                          'Copyright 2021 Buser Rentcar Nasional | Alll Rights Reserved',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                )
              : ShimmerDark(
                  height: height * 0.7,
                  width: width,
                ),
          SizedBox(height: kPaddingL),
        ],
      ),
    );
  }

  List<Widget> tabs({@required List<String> labels}) {
    return labels
        .asMap()
        .map(
          (i, e) => MapEntry(
            i,
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentTab = i;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                padding: const EdgeInsets.symmetric(horizontal: kPaddingS),
                decoration: i == _currentTab
                    ? BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff334263),
                            Color(0xff334263).withOpacity(0.8),
                          ],
                        ),
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      )
                    : BoxDecoration(),
                child: Center(
                  child: Text(
                    e,
                    style: TextStyle(
                      color:
                          i == _currentTab ? Colors.white : Color(0xff9A9A9A),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
        .values
        .toList();
  }
}
