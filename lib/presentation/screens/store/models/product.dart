// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
        this.status,
        this.totalRows,
        this.page,
        this.data,
    });

    bool status;
    int totalRows;
    int page;
    List<ProductData> data;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        status: json["status"],
        totalRows: json["total_rows"],
        page: json["page"],
        data: List<ProductData>.from(json["data"].map((x) => ProductData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "total_rows": totalRows,
        "page": page,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ProductData {
    ProductData({
        this.id,
        this.datetimeAdd,
        this.adminAdder,
        this.lastEdited,
        this.adminEditor,
        this.isOneSet,
        this.productSet,
        this.code,
        this.published,
        this.title,
        this.brand,
        this.dispPrice,
        this.totalStock,
        this.totalView,
        this.pointRate,
        this.totalRate,
        this.totalWishlist,
        this.totalBought,
        this.description,
        this.weight,
        this.hasColor,
        this.hasSize,
        this.stockFrom,
        this.priceFrom,
        this.imgSource,
        this.bestTitle,
        this.bestSellerTitle,
        this.newTitle,
        this.newTitleUntil,
        this.discountTitle,
        this.delPrice,
        this.discount,
        this.distributorOnly,
        this.distributorOnlyUntil,
        this.discountReseller,
        this.discountAgent,
        this.discountDistributor,
        this.discountDiamond,
        this.delPriceReseller,
        this.delPriceAgent,
        this.delPriceDistributor,
        this.dispPriceReseller,
        this.dispPriceAgent,
        this.dispPriceDistributor,
        this.dispPriceDiamond,
        this.facebook,
        this.twitter,
        this.instagram,
        this.googlePlus,
        this.pinterest,
        this.whatsapp,
        this.bukalapak,
        this.shopee,
        this.tokopedia,
        this.olx,
        this.line,
        this.lazada,
    });

    String id;
    DateTime datetimeAdd;
    String adminAdder;
    DateTime lastEdited;
    String adminEditor;
    String isOneSet;
    String productSet;
    String code;
    String published;
    String title;
    String brand;
    String dispPrice;
    String totalStock;
    String totalView;
    String pointRate;
    String totalRate;
    String totalWishlist;
    String totalBought;
    String description;
    String weight;
    String hasColor;
    String hasSize;
    String stockFrom;
    String priceFrom;
    String imgSource;
    String bestTitle;
    String bestSellerTitle;
    String newTitle;
    String newTitleUntil;
    String discountTitle;
    String delPrice;
    String discount;
    String distributorOnly;
    String distributorOnlyUntil;
    String discountReseller;
    String discountAgent;
    String discountDistributor;
    String discountDiamond;
    String delPriceReseller;
    String delPriceAgent;
    String delPriceDistributor;
    String dispPriceReseller;
    String dispPriceAgent;
    String dispPriceDistributor;
    String dispPriceDiamond;
    String facebook;
    String twitter;
    String instagram;
    String googlePlus;
    String pinterest;
    String whatsapp;
    String bukalapak;
    String shopee;
    String tokopedia;
    String olx;
    String line;
    String lazada;

    factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["id"],
        datetimeAdd: DateTime.parse(json["datetime_add"]),
        adminAdder: json["admin_adder"],
        lastEdited: DateTime.parse(json["last_edited"]),
        adminEditor: json["admin_editor"],
        isOneSet: json["is_one_set"],
        productSet: json["product_set"],
        code: json["code"],
        published: json["published"],
        title: json["title"],
        brand: json["brand"],
        dispPrice: json["disp_price"],
        totalStock: json["total_stock"],
        totalView: json["total_view"],
        pointRate: json["point_rate"],
        totalRate: json["total_rate"],
        totalWishlist: json["total_wishlist"],
        totalBought: json["total_bought"],
        description: json["description"],
        weight: json["weight"],
        hasColor: json["has_color"],
        hasSize: json["has_size"],
        stockFrom: json["stock_from"],
        priceFrom: json["price_from"],
        imgSource: json["img_source"],
        bestTitle: json["best_title"],
        bestSellerTitle: json["best_seller_title"],
        newTitle: json["new_title"],
        newTitleUntil: json["new_title_until"],
        discountTitle: json["discount_title"],
        delPrice: json["del_price"],
        discount: json["discount"],
        distributorOnly: json["distributor_only"],
        distributorOnlyUntil: json["distributor_only_until"],
        discountReseller: json["discount_reseller"],
        discountAgent: json["discount_agent"],
        discountDistributor: json["discount_distributor"],
        discountDiamond: json["discount_diamond"],
        delPriceReseller: json["del_price_reseller"],
        delPriceAgent: json["del_price_agent"],
        delPriceDistributor: json["del_price_distributor"],
        dispPriceReseller: json["disp_price_reseller"],
        dispPriceAgent: json["disp_price_agent"],
        dispPriceDistributor: json["disp_price_distributor"],
        dispPriceDiamond: json["disp_price_diamond"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        instagram: json["instagram"],
        googlePlus: json["google_plus"],
        pinterest: json["pinterest"],
        whatsapp: json["whatsapp"],
        bukalapak: json["bukalapak"],
        shopee: json["shopee"],
        tokopedia: json["tokopedia"],
        olx: json["olx"],
        line: json["line"],
        lazada: json["lazada"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "datetime_add": datetimeAdd.toIso8601String(),
        "admin_adder": adminAdder,
        "last_edited": lastEdited.toIso8601String(),
        "admin_editor": adminEditor,
        "is_one_set": isOneSet,
        "product_set": productSet,
        "code": code,
        "published": published,
        "title": title,
        "brand": brand,
        "disp_price": dispPrice,
        "total_stock": totalStock,
        "total_view": totalView,
        "point_rate": pointRate,
        "total_rate": totalRate,
        "total_wishlist": totalWishlist,
        "total_bought": totalBought,
        "description": description,
        "weight": weight,
        "has_color": hasColor,
        "has_size": hasSize,
        "stock_from": stockFrom,
        "price_from": priceFrom,
        "img_source": imgSource,
        "best_title": bestTitle,
        "best_seller_title": bestSellerTitle,
        "new_title": newTitle,
        "new_title_until": newTitleUntil,
        "discount_title": discountTitle,
        "del_price": delPrice,
        "discount": discount,
        "distributor_only": distributorOnly,
        "distributor_only_until": distributorOnlyUntil,
        "discount_reseller": discountReseller,
        "discount_agent": discountAgent,
        "discount_distributor": discountDistributor,
        "discount_diamond": discountDiamond,
        "del_price_reseller": delPriceReseller,
        "del_price_agent": delPriceAgent,
        "del_price_distributor": delPriceDistributor,
        "disp_price_reseller": dispPriceReseller,
        "disp_price_agent": dispPriceAgent,
        "disp_price_distributor": dispPriceDistributor,
        "disp_price_diamond": dispPriceDiamond,
        "facebook": facebook,
        "twitter": twitter,
        "instagram": instagram,
        "google_plus": googlePlus,
        "pinterest": pinterest,
        "whatsapp": whatsapp,
        "bukalapak": bukalapak,
        "shopee": shopee,
        "tokopedia": tokopedia,
        "olx": olx,
        "line": line,
        "lazada": lazada,
    };
}
