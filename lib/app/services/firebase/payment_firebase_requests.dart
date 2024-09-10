import 'dart:developer';

import 'package:admin_panel/app/modules/payment/models/payment_model.dart';
import 'package:admin_panel/app/utils/collection_name.dart';
import 'package:admin_panel/app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> initPayment() async {
  bool val = await FirebaseFirestore.instance
      .collection(CollectionName.settings)
      .doc("payment")
      .get()
      .then((value) => value.exists);
  if (!val) {
    Map<String, dynamic> body = {
      "wallet": {"enable": false, "name": ""},
      "cash": {"name": "", "enable": false},
      "paypal": {
        "name": "",
        "isSandbox": false,
        "paypalClient": "",
        "enable": false,
        "paypalSecret": "",
      },
      "strip": {
        "clientpublishableKey": "",
        "enable": false,
        "isSandbox": false,
        "name": "",
        "stripeSecret": "",
      }
    };
    FirebaseFirestore.instance
        .collection(CollectionName.settings)
        .doc("payment")
        .set(body);
  }
}

Future<PaymentModel?> getPayment() async {
  PaymentModel? paymentModel;
  await FirebaseFirestore.instance
      .collection(CollectionName.settings)
      .doc("payment")
      .get()
      .then((value) {
    if (value.exists) {
      Constant.paymentModel = PaymentModel.fromJson(value.data()!);
      paymentModel = PaymentModel.fromJson(value.data()!);
    }
  }).catchError((error) {
    log("Failed to update user: $error");
    paymentModel = null;
  });
  return paymentModel;
}

Future<bool> setPayment(PaymentModel paymentModel) async {
  return FirebaseFirestore.instance
      .collection(CollectionName.settings)
      .doc("payment")
      .update(paymentModel.toJson())
      .then(
    (value) {
      return true;
    },
  ).catchError((error) {
    return false;
  });
}

Future<bool> setPayment1(Map<String, dynamic> data) {
  return FirebaseFirestore.instance
      .collection(CollectionName.settings)
      .doc("payment")
      .update(data)
      .then(
    (value) {
      return true;
    },
  ).catchError((error) {
    return false;
  });
}
