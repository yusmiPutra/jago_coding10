// To parse this JSON data, do
//
//     final resGetTransaksi = resGetTransaksiFromJson(jsonString);

import 'dart:convert';

ResGetTransaksi resGetTransaksiFromJson(String str) => ResGetTransaksi.fromJson(json.decode(str));

String resGetTransaksiToJson(ResGetTransaksi data) => json.encode(data.toJson());

class ResGetTransaksi {
  ResGetTransaksi({
    this.success,
    this.data,
  });

  bool? success;
  Data? data;

  factory ResGetTransaksi.fromJson(Map<String, dynamic> json) => ResGetTransaksi(
    success: json["success"] == null ? null : json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  Data({
    this.imageSignature,
    this.imageReport,
    this.transactionCode,
    this.idCustomer,
    this.idUser,
    this.transactionNote,
    this.totalPrice,
    this.latitude,
    this.longitude,
    this.paymentMethod,
    this.updatedAt,
    this.createdAt,
    this.idTransaction,
  });

  dynamic imageSignature;
  dynamic imageReport;
  String? transactionCode;
  String? idCustomer;
  String? idUser;
  String? transactionNote;
  String? totalPrice;
  String? latitude;
  String? longitude;
  String? paymentMethod;
  String? updatedAt;
  String? createdAt;
  int? idTransaction;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    imageSignature: json["image_signature"],
    imageReport: json["image_report"],
    transactionCode: json["transaction_code"] == null ? null : json["transaction_code"],
    idCustomer: json["id_customer"] == null ? null : json["id_customer"],
    idUser: json["id_user"] == null ? null : json["id_user"],
    transactionNote: json["transaction_note"] == null ? null : json["transaction_note"],
    totalPrice: json["total_price"] == null ? null : json["total_price"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    paymentMethod: json["payment_method"] == null ? null : json["payment_method"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    idTransaction: json["id_transaction"] == null ? null : json["id_transaction"],
  );

  Map<String, dynamic> toJson() => {
    "image_signature": imageSignature,
    "image_report": imageReport,
    "transaction_code": transactionCode == null ? null : transactionCode,
    "id_customer": idCustomer == null ? null : idCustomer,
    "id_user": idUser == null ? null : idUser,
    "transaction_note": transactionNote == null ? null : transactionNote,
    "total_price": totalPrice == null ? null : totalPrice,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "payment_method": paymentMethod == null ? null : paymentMethod,
    "updated_at": updatedAt == null ? null : updatedAt,
    "created_at": createdAt == null ? null : createdAt,
    "id_transaction": idTransaction == null ? null : idTransaction,
  };
}
