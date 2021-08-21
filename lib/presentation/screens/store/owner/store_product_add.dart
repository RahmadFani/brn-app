import 'package:brn/presentation/screens/store/owner/chart.dart';
import 'package:brn/presentation/screens/store/store_header.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreOwnerProductAddScreen extends StatefulWidget {
  const StoreOwnerProductAddScreen({Key key}) : super(key: key);

  @override
  _StoreOwnerProductAddScreenState createState() =>
      _StoreOwnerProductAddScreenState();
}

class _StoreOwnerProductAddScreenState
    extends State<StoreOwnerProductAddScreen> {
  bool ulasan = false;
  List<bool> _isChecked;

  int screen = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isChecked = List<bool>.filled(10, false);
  }

  void kategori(context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (context) {
          return Container(
            height: height * 0.6,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Pilih Kategori',
                    textAlign: TextAlign.center,
                    style: primaryTextStyle(size: 14, weight: FontWeight.w600)),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(5),
                          width: width,
                          height: 43,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.black87)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Kateori ' + index.toString(),
                                  textAlign: TextAlign.center,
                                  style: primaryTextStyle(
                                      size: 14, weight: FontWeight.w400)),
                              Checkbox(
                                checkColor: Colors.white, // color of tick Mark
                                activeColor: Color(0xFF14B4F9),
                                value: _isChecked[index],
                                onChanged: (val) {
                                  setState(
                                    () {
                                      _isChecked[index] = val;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }

  void variasi(context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (context) {
          return Container(
            height: height * 0.4,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width,
                  alignment: Alignment(0, 0),
                  child: Text('Variasi',
                      textAlign: TextAlign.center,
                      style:
                          primaryTextStyle(size: 16, weight: FontWeight.w700)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Warna',
                    textAlign: TextAlign.left,
                    style: primaryTextStyle(size: 14, weight: FontWeight.w600)),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.all(5),
                      height: 28,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black87)),
                      child: Text('Hitam',
                          textAlign: TextAlign.center,
                          style: primaryTextStyle(
                              size: 14, weight: FontWeight.w600)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.all(5),
                      height: 28,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black87)),
                      child: Text('Putih',
                          textAlign: TextAlign.center,
                          style: primaryTextStyle(
                              size: 14, weight: FontWeight.w600)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.all(5),
                      height: 28,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black87)),
                      child: Text('Biru',
                          textAlign: TextAlign.center,
                          style: primaryTextStyle(
                              size: 14, weight: FontWeight.w600)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Ukuran',
                    textAlign: TextAlign.left,
                    style: primaryTextStyle(size: 14, weight: FontWeight.w600)),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.all(5),
                      height: 28,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black87)),
                      child: Text('L',
                          textAlign: TextAlign.center,
                          style: primaryTextStyle(
                              size: 14, weight: FontWeight.w600)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.all(5),
                      height: 28,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black87)),
                      child: Text('M',
                          textAlign: TextAlign.center,
                          style: primaryTextStyle(
                              size: 14, weight: FontWeight.w600)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.all(5),
                      height: 28,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black87)),
                      child: Text('XXL',
                          textAlign: TextAlign.center,
                          style: primaryTextStyle(
                              size: 14, weight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  void gambar(context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (context) {
          return Container(
            height: height * 0.3,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width,
                  alignment: Alignment(0, 0),
                  child: Text('Upload Gambar',
                      textAlign: TextAlign.center,
                      style:
                          primaryTextStyle(size: 16, weight: FontWeight.w700)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Ambil Melalui Galeri',
                    textAlign: TextAlign.center,
                    style: primaryTextStyle(size: 14, weight: FontWeight.w400)),
                SizedBox(height: 5),
                CustomTextfield(
                  label: "Browse",
                  height: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Ambil Melalui Kamera',
                    textAlign: TextAlign.center,
                    style: primaryTextStyle(size: 14, weight: FontWeight.w400)),
                SizedBox(height: 5),
                CustomTextfield(
                  label: "Browse",
                  height: 40,
                ),
              ],
            ),
          );
        });
  }

  void ongkir(context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (context) {
          return Container(
            height: height * 0.5,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width,
                  alignment: Alignment(0, 0),
                  child: Text('Ongkos Kirim',
                      textAlign: TextAlign.center,
                      style:
                          primaryTextStyle(size: 16, weight: FontWeight.w700)),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Berat Produk',
                              textAlign: TextAlign.center,
                              style: primaryTextStyle(
                                  size: 14, weight: FontWeight.w400)),
                          SizedBox(height: 5),
                          Container(
                            width: width * 0.35,
                            child: CustomTextfield(
                              height: 60,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lebar (cm)',
                              textAlign: TextAlign.center,
                              style: primaryTextStyle(
                                  size: 14, weight: FontWeight.w400)),
                          SizedBox(height: 5),
                          Container(
                            width: width * 0.35,
                            child: CustomTextfield(
                              height: 60,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Panjang (cm)',
                              textAlign: TextAlign.center,
                              style: primaryTextStyle(
                                  size: 14, weight: FontWeight.w400)),
                          SizedBox(height: 5),
                          Container(
                            width: width * 0.35,
                            child: CustomTextfield(
                              height: 60,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tinggi (cm)',
                              textAlign: TextAlign.center,
                              style: primaryTextStyle(
                                  size: 14, weight: FontWeight.w400)),
                          SizedBox(height: 5),
                          Container(
                            width: width * 0.35,
                            child: CustomTextfield(
                              height: 60,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.all(5),
                          width: width,
                          height: 43,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.black87)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('JNE',
                                  textAlign: TextAlign.center,
                                  style: primaryTextStyle(
                                      size: 14, weight: FontWeight.w400)),
                              Checkbox(
                                checkColor: Colors.white, // color of tick Mark
                                activeColor: Color(0xFF14B4F9),
                                value: _isChecked[index],
                                onChanged: (val) {
                                  setState(
                                    () {
                                      _isChecked[index] = val;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return CustomScaffold(
      backgroundHeigh: height * 0.5,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: width,
              height: 50,
              padding: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Tambah Produk',
                      textAlign: TextAlign.left,
                      style: primaryTextStyle(
                          size: 14,
                          weight: FontWeight.w600,
                          color: Colors.white)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          IntrinsicHeight(
            child: Container(
              width: width,
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(10),
              height: height * 0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        offset: Offset(0, 4),
                        blurRadius: 10),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      gambar(context);
                    },
                    child: Container(
                      height: 70,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black54)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.library_add,
                            color: Colors.black87,
                            size: 14,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Upload Gambar',
                              textAlign: TextAlign.center,
                              style: primaryTextStyle(
                                  size: 12, weight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Nama Produk',
                      textAlign: TextAlign.center,
                      style:
                          primaryTextStyle(size: 14, weight: FontWeight.w400)),
                  SizedBox(height: 5),
                  CustomTextfield(
                    height: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Deskripsi Produk',
                      textAlign: TextAlign.center,
                      style:
                          primaryTextStyle(size: 14, weight: FontWeight.w400)),
                  SizedBox(height: 5),
                  CustomTextfield(
                    height: 60,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Kategori',
                      textAlign: TextAlign.center,
                      style:
                          primaryTextStyle(size: 14, weight: FontWeight.w400)),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      kategori(context);
                    },
                    child: Container(
                      width: width,
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          // color: Color(0xFFF3F3F3),
                          border:
                              Border.all(width: 1, color: Color(0xFFC4C4C4))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Pilih',
                              textAlign: TextAlign.left,
                              style: primaryTextStyle(
                                  size: 16,
                                  color: Color(0xFF494949),
                                  weight: FontWeight.w600)),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF494949),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Harga',
                              textAlign: TextAlign.center,
                              style: primaryTextStyle(
                                  size: 14, weight: FontWeight.w400)),
                          SizedBox(height: 5),
                          Container(
                            width: width * 0.35,
                            child: CustomTextfield(
                              height: 60,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Stok',
                              textAlign: TextAlign.center,
                              style: primaryTextStyle(
                                  size: 14, weight: FontWeight.w400)),
                          SizedBox(height: 5),
                          Container(
                            width: width * 0.35,
                            child: CustomTextfield(
                              height: 60,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Variasi',
                      textAlign: TextAlign.center,
                      style:
                          primaryTextStyle(size: 14, weight: FontWeight.w400)),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      variasi(context);
                    },
                    child: Container(
                      width: width,
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          // color: Color(0xFFF3F3F3),
                          border:
                              Border.all(width: 1, color: Color(0xFFC4C4C4))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Pilih',
                              textAlign: TextAlign.left,
                              style: primaryTextStyle(
                                  size: 16,
                                  color: Color(0xFF494949),
                                  weight: FontWeight.w600)),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF494949),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Ongkos Kirim',
                      textAlign: TextAlign.center,
                      style:
                          primaryTextStyle(size: 14, weight: FontWeight.w400)),
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      ongkir(context);
                    },
                    child: Container(
                      width: width,
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          // color: Color(0xFFF3F3F3),
                          border:
                              Border.all(width: 1, color: Color(0xFFC4C4C4))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Pilih',
                              textAlign: TextAlign.left,
                              style: primaryTextStyle(
                                  size: 16,
                                  color: Color(0xFF494949),
                                  weight: FontWeight.w600)),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF494949),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 53,
                        width: 140,
                        alignment: Alignment(0, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFED7471),
                        ),
                        child: Text('Reset',
                            textAlign: TextAlign.left,
                            style: primaryTextStyle(
                                size: 16,
                                color: Colors.white,
                                weight: FontWeight.w600)),
                      ),
                      Container(
                        height: 53,
                        width: 140,
                        alignment: Alignment(0, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF2F3E5A),
                        ),
                        child: Text('Simpan',
                            textAlign: TextAlign.left,
                            style: primaryTextStyle(
                                size: 16,
                                color: Colors.white,
                                weight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
