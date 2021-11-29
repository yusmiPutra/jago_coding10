// To parse this JSON data, do
//
//     final resGetTHistoryOrder = resGetTHistoryOrderFromJson(jsonString);

import 'dart:convert';

ResGetTHistoryOrder resGetTHistoryOrderFromJson(String str) => ResGetTHistoryOrder.fromJson(json.decode(str));

String resGetTHistoryOrderToJson(ResGetTHistoryOrder data) => json.encode(data.toJson());

class ResGetTHistoryOrder {
  ResGetTHistoryOrder({
    this.isSuccess,
    this.message,
    this.data,
    this.erros,
  });

  bool? isSuccess;
  String? message;
  List<DataHistory>? data;
  dynamic erros;

  factory ResGetTHistoryOrder.fromJson(Map<String, dynamic> json) => ResGetTHistoryOrder(
    isSuccess: json["isSuccess"] == null ? null : json["isSuccess"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<DataHistory>.from(json["data"].map((x) => DataHistory.fromJson(x))),
    erros: json["erros"],
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess == null ? null : isSuccess,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    "erros": erros,
  };
}

class DataHistory {
  DataHistory({
    this.idTransaction,
    this.idUser,
    this.idCustomer,
    this.transactionCode,
    this.transactionNote,
    this.totalPrice,
    this.paymentMethod,
    this.transactionStatus,
    this.reasonVoid,
    this.latitude,
    this.longitude,
    this.imageSignature,
    this.imageReport,
    this.dateVoid,
    this.createdAt,
    this.updatedAt,
    this.customer,
    this.userCompany,
  });

  int? idTransaction;
  int? idUser;
  int? idCustomer;
  String? transactionCode;
  String? transactionNote;
  String? totalPrice;
  String? paymentMethod;
  String? transactionStatus;
  dynamic reasonVoid;
  String? latitude;
  String? longitude;
  dynamic imageSignature;
  dynamic imageReport;
  dynamic dateVoid;
  String? createdAt;
  String? updatedAt;
  Customer? customer;
  UserCompany? userCompany;

  factory DataHistory.fromJson(Map<String, dynamic> json) => DataHistory(
    idTransaction: json["id_transaction"] == null ? null : json["id_transaction"],
    idUser: json["id_user"] == null ? null : json["id_user"],
    idCustomer: json["id_customer"] == null ? null : json["id_customer"],
    transactionCode: json["transaction_code"] == null ? null : json["transaction_code"],
    transactionNote: json["transaction_note"] == null ? null : json["transaction_note"],
    totalPrice: json["total_price"] == null ? null : json["total_price"],
    paymentMethod: json["payment_method"] == null ? null : json["payment_method"],
    transactionStatus: json["transaction_status"] == null ? null : json["transaction_status"],
    reasonVoid: json["reason_void"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    imageSignature: json["image_signature"],
    imageReport: json["image_report"],
    dateVoid: json["date_void"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
    userCompany: json["user_company"] == null ? null : UserCompany.fromJson(json["user_company"]),
  );

  Map<String, dynamic> toJson() => {
    "id_transaction": idTransaction == null ? null : idTransaction,
    "id_user": idUser == null ? null : idUser,
    "id_customer": idCustomer == null ? null : idCustomer,
    "transaction_code": transactionCode == null ? null : transactionCode,
    "transaction_note": transactionNote == null ? null : transactionNote,
    "total_price": totalPrice == null ? null : totalPrice,
    "payment_method": paymentMethod == null ? null : paymentMethod,
    "transaction_status": transactionStatus == null ? null : transactionStatus,
    "reason_void": reasonVoid,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "image_signature": imageSignature,
    "image_report": imageReport,
    "date_void": dateVoid,
    "created_at": createdAt == null ? null : createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
    "customer": customer == null ? null : customer!.toJson(),
    "user_company": userCompany == null ? null : userCompany!.toJson(),
  };
}

class Customer {
  Customer({
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

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
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

class UserCompany {
  UserCompany({
    this.idUser,
    this.idPaketSubscription,
    this.userIcNumber,
    this.userCode,
    this.companyId,
    this.userName,
    this.userTelp,
    this.userEmail,
    this.userAddress,
    this.userPhoto,
    this.cashInHand,
    this.userStatus,
    this.paidAt,
    this.userExpired,
    this.paymentStatus,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.emailVerifiedAt,
    this.apiToken,
  });

  int? idUser;
  int? idPaketSubscription;
  String? userIcNumber;
  String? userCode;
  int? companyId;
  String? userName;
  String? userTelp;
  String? userEmail;
  String? userAddress;
  String? userPhoto;
  String? cashInHand;
  String? userStatus;
  String? paidAt;
  String? userExpired;
  String? paymentStatus;
  String? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic emailVerifiedAt;
  dynamic apiToken;

  factory UserCompany.fromJson(Map<String, dynamic> json) => UserCompany(
    idUser: json["id_user"] == null ? null : json["id_user"],
    idPaketSubscription: json["id_paket_subscription"] == null ? null : json["id_paket_subscription"],
    userIcNumber: json["user_ic_number"] == null ? null : json["user_ic_number"],
    userCode: json["user_code"] == null ? null : json["user_code"],
    companyId: json["company_id"] == null ? null : json["company_id"],
    userName: json["user_name"] == null ? null : json["user_name"],
    userTelp: json["user_telp"] == null ? null : json["user_telp"],
    userEmail: json["user_email"] == null ? null : json["user_email"],
    userAddress: json["user_address"] == null ? null : json["user_address"],
    userPhoto: json["user_photo"] == null ? null : json["user_photo"],
    cashInHand: json["cash_in_hand"] == null ? null : json["cash_in_hand"],
    userStatus: json["user_status"] == null ? null : json["user_status"],
    paidAt: json["paid_at"] == null ? null : json["paid_at"],
    userExpired: json["user_expired"] == null ? null : json["user_expired"],
    paymentStatus: json["payment_status"] == null ? null : json["payment_status"],
    isActive: json["is_active"] == null ? null : json["is_active"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    emailVerifiedAt: json["email_verified_at"],
    apiToken: json["api_token"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser == null ? null : idUser,
    "id_paket_subscription": idPaketSubscription == null ? null : idPaketSubscription,
    "user_ic_number": userIcNumber == null ? null : userIcNumber,
    "user_code": userCode == null ? null : userCode,
    "company_id": companyId == null ? null : companyId,
    "user_name": userName == null ? null : userName,
    "user_telp": userTelp == null ? null : userTelp,
    "user_email": userEmail == null ? null : userEmail,
    "user_address": userAddress == null ? null : userAddress,
    "user_photo": userPhoto == null ? null : userPhoto,
    "cash_in_hand": cashInHand == null ? null : cashInHand,
    "user_status": userStatus == null ? null : userStatus,
    "paid_at": paidAt == null ? null : paidAt,
    "user_expired": userExpired == null ? null : userExpired,
    "payment_status": paymentStatus == null ? null : paymentStatus,
    "is_active": isActive == null ? null : isActive,
    "created_at": createdAt == null ? null : createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
    "email_verified_at": emailVerifiedAt,
    "api_token": apiToken,
  };
}
