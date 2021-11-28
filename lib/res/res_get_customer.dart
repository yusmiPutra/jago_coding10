// To parse this JSON data, do
//
//     final resGetCustomer = resGetCustomerFromJson(jsonString);

import 'dart:convert';

ResGetCustomer resGetCustomerFromJson(String str) => ResGetCustomer.fromJson(json.decode(str));

String resGetCustomerToJson(ResGetCustomer data) => json.encode(data.toJson());

class ResGetCustomer {
  ResGetCustomer({
    this.success,
    this.data,
  });

  String? success;
  List<DataCustomer>? data;

  factory ResGetCustomer.fromJson(Map<String, dynamic> json) => ResGetCustomer(
    success: json["success"] == null ? null : json["success"],
    data: json["data"] == null ? null : List<DataCustomer>.from(json["data"].map((x) => DataCustomer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DataCustomer {
  DataCustomer({
    this.idCustomer,
    this.idCompany,
    this.customerName,
    this.customerTelp,
    this.customerEmail,
    this.customerAddress,
    this.customerImage,
    this.createdAt,
    this.updatedAt,
  });

  int? idCustomer;
  int? idCompany;
  String? customerName;
  String? customerTelp;
  String? customerEmail;
  String? customerAddress;
  String? customerImage;
  String? createdAt;
  String? updatedAt;

  factory DataCustomer.fromJson(Map<String, dynamic> json) => DataCustomer(
    idCustomer: json["id_customer"] == null ? null : json["id_customer"],
    idCompany: json["id_company"] == null ? null : json["id_company"],
    customerName: json["customer_name"] == null ? null : json["customer_name"],
    customerTelp: json["customer_telp"] == null ? null : json["customer_telp"],
    customerEmail: json["customer_email"] == null ? null : json["customer_email"],
    customerAddress: json["customer_address"] == null ? null : json["customer_address"],
    customerImage: json["customer_image"] == null ? null : json["customer_image"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id_customer": idCustomer == null ? null : idCustomer,
    "id_company": idCompany == null ? null : idCompany,
    "customer_name": customerName == null ? null : customerName,
    "customer_telp": customerTelp == null ? null : customerTelp,
    "customer_email": customerEmail == null ? null : customerEmail,
    "customer_address": customerAddress == null ? null : customerAddress,
    "customer_image": customerImage == null ? null : customerImage,
    "created_at": createdAt == null ? null : createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
  };
}
