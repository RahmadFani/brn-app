import 'package:brn/config/constants.dart';
import 'package:brn/presentation/screens/store/store_cart.dart';
import 'package:brn/presentation/screens/store/store_like.dart';
import 'package:flutter/material.dart';

class StoreHeaderComponent extends StatelessWidget {
  const StoreHeaderComponent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 42,
            width: width * 0.6,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: Color(0xFF192834),
                ),
                Container(
                  width: width * 0.4,
                  height: 32,
                  padding: EdgeInsets.only(top: 26, left: 5),
                  alignment: Alignment(0, 0),
                  child: TextField(
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: kPaddingS),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => StoreLikeScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    Icons.favorite,
                    color: Color(0xFF192834),
                  ),
                ),
              ),
              SizedBox(width: kPaddingS),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => StoreCartScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    Icons.shopping_bag_rounded,
                    color: Color(0xFF192834),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
