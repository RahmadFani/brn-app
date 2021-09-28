import 'package:flutter/material.dart';

class FilterPetaInduk extends StatefulWidget {
  FilterPetaInduk({Key key}) : super(key: key);

  @override
  _FilterPetaIndukState createState() => _FilterPetaIndukState();
}

class _FilterPetaIndukState extends State<FilterPetaInduk> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      height: 65,
      width: MediaQuery.of(context).size.width - 20,
      child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  // controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    labelText: 'Cari Rental',
                  ),
                  onChanged: (text) {
                    print(text);
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(Icons.filter_alt),
              )
            ],
          )),
    );
  }
}
