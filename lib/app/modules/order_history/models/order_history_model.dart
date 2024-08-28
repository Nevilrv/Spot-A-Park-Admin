import 'package:admin_panel/app/modules/app_settings/models/admin_commission_model.dart';
import 'package:admin_panel/app/modules/coupon/models/coupon_model.dart';
import 'package:admin_panel/app/modules/parking_list/models/parking_model.dart';
import 'package:admin_panel/app/modules/tax/models/tax_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderHistoryModel {
  String? id;
  String? customerId;
  String? parkingId;
  Timestamp? bookingDate;
  Timestamp? bookingStartTime;
  Timestamp? bookingEndTime;
  String? duration;
  String? status;
  String? paymentType;
  String? subTotal;
  String? numberPlate;
  bool? paymentCompleted;
  ParkingModel? parkingDetails;
  List<TaxModel>? taxList;
  AdminCommissionModel? adminCommission;
  CouponModel? coupon;
  Timestamp? createdAt;
  Timestamp? checkIn;
  Timestamp? checkOut;

  OrderHistoryModel({
    this.id,
    this.customerId,
    this.parkingId,
    this.bookingDate,
    this.bookingStartTime,
    this.bookingEndTime,
    this.duration,
    this.status,
    this.numberPlate,
    this.paymentType,
    this.subTotal,
    this.paymentCompleted,
    this.parkingDetails,
    this.taxList,
    this.adminCommission,
    this.coupon,
    this.createdAt,
    this.checkIn,
    this.checkOut,
  });

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customerId'];
    parkingId = json['parkingId'];
    bookingDate = json['bookingDate'];
    numberPlate = json['numberPlate'];
    bookingStartTime = json['bookingStartTime'];
    bookingEndTime = json['bookingEndTime'];
    duration = json['duration'];
    status = json['status'];
    paymentType = json['paymentType'];
    subTotal = json['subTotal'];
    paymentCompleted = json['paymentCompleted'];
    parkingDetails = json['parkingDetails'] != null ? ParkingModel.fromJson(json['parkingDetails']) : null;
    if (json['taxList'] != null) {
      taxList = <TaxModel>[];
      json['taxList'].forEach((v) {
        taxList!.add(TaxModel.fromJson(v));
      });
    }
    adminCommission = json['adminCommission'] != null ? AdminCommissionModel.fromJson(json['adminCommission']) : null;
    coupon = json['coupon'] != null ? CouponModel.fromJson(json['coupon']) : null;
    createdAt = json['createdAt'];
    checkIn = json['checkIn'];
    checkOut = json['checkOut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customerId'] = customerId;
    data['parkingId'] = parkingId;
    data['numberPlate'] = numberPlate;
    data['bookingDate'] = bookingDate;
    data['bookingStartTime'] = bookingStartTime;
    data['bookingEndTime'] = bookingEndTime;
    data['duration'] = duration;
    data['status'] = status;
    data['paymentType'] = paymentType;
    data['subTotal'] = subTotal;
    data['paymentCompleted'] = paymentCompleted;

    if (parkingDetails != null) {
      data['parkingDetails'] = parkingDetails!.toJson();
    }
    if (taxList != null) {
      data['taxList'] = taxList!.map((v) => v.toJson()).toList();
    }
    if (adminCommission != null) {
      data['adminCommission'] = adminCommission!.toJson();
    }
    if (coupon != null) {
      data['coupon'] = coupon!.toJson();
    }
    data['createdAt'] = createdAt;
    data['checkIn'] = checkIn;
    data['checkOut'] = checkOut;
    return data;
  }
}
