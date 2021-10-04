import 'dart:convert';

import 'package:brn/presentation/screens/store/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

const String API_SERVER_URL = "https://shop.brnjuara.com/api/";
const String GET_PRODUCTS_URL = "product/index";
const String PRODUCT_IMAGE_URL = "img/product/";
const String STORE_CATEGORY_IMAGE = "img/category/";
const String ADD_ITEM_TO_CART_URL = "cart/post_add_product";
final currencyFormat =
    NumberFormat.simpleCurrency(decimalDigits: 0, locale: 'id_ID');

class CallStoreAPI {
  Future<List<ProductData>> getProducts() async {
    var fullUrl = API_SERVER_URL + GET_PRODUCTS_URL;
    List<ProductData> _productList = <ProductData>[];
    try {
      var post = http.get(fullUrl).timeout(Duration(seconds: 120));
      var res = await post;
      // print(res.body);
      if (res.statusCode == 200) {
        //print(json.decode(res.body));
        _productList = productFromJson(res.body).data;
        return _productList;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> addToCart(productId, colorId, sizeId, token) async {
    var fullUrl = API_SERVER_URL + ADD_ITEM_TO_CART_URL;
    try {
      var post = http.post(fullUrl, body: {
        'pd_id' : '$productId',
        'cl_id' : '$colorId',
        'sz_id' : '$sizeId',
        'qty' : '1'
      }, headers: {
        'Authorization': 'Bearer $token'
      }).timeout(Duration(seconds: 120));
      var res = await post;
      var body = json.decode(res.body);
      print(res.body);
      if (res.statusCode == 200) {
        if (body['status'] == true) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
