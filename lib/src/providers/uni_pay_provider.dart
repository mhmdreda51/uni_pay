// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tabby_flutter_inapp_sdk/tabby_flutter_inapp_sdk.dart';
import 'package:uni_pay/src/modules/tabby/core/services/tabby_services.dart';
import 'package:uni_pay/src/utils/extension.dart';
import 'package:uni_pay/uni_pay.dart';

import '../views/widgets/payment_result_view.dart';

class UniPayControllers {
  UniPayControllers._();
  static late BuildContext context;

  /// Here the payement related data will be stored
  static UniPayData? _uniPayData;

  ///* Uni Pay Data to be used for payment request
  static UniPayData get uniPayData {
    if (_uniPayData == null) {
      throw Exception(
          "UniPay has not been initialized yet! kindly call UniPayServices.initUniPay() or pass the required data to widget you're calling first to proceed the payment ;)");
    }
    return _uniPayData!;
  }

  ///* Set UniPayData
  static void setUniPayData(UniPayData data, BuildContext appContext) {
    _uniPayData = data;
    context = appContext;

    // Initialize Tabby SDK
    TabbyServices.initTabbySDK(data);
  }

  ///* Initialize Tamara all payment methods
  static ValueNotifier<UniPayCurrentState> tamaraNotifier =
      ValueNotifier<UniPayCurrentState>(UniPayCurrentState.notSpecified);

  ///* Tamara checkout data
  static TamaraCheckoutData tamaraCheckout = TamaraCheckoutData();
  static Future<TamaraCheckoutData?> initTamaraPay() async {
    tamaraNotifier.value = UniPayCurrentState.loading;

    //* Check for Tamara checkout
    tamaraCheckout = await UniTamara.generateTamaraCheckoutUrls(uniPayData);
    //* Check for Moyasar gateway
    tamaraNotifier.value = tamaraCheckout.isSuccess
        ? UniPayCurrentState.success
        : UniPayCurrentState.failed;
    return tamaraCheckout;
  }

  ///* State changes
  UniPayCurrentState uniPayCurrentState = UniPayCurrentState.notSpecified;

  ///* Uni Pay payment status
  static UniPayStatus uniPayStatus = UniPayStatus.failed;

  ///* Handle and call the callback function for payment status
  static Future handlePaymentsResponseAndCallback(BuildContext context,
      {required UniPayResponse response}) async {
    uniPayStatus = response.status;
    context.uniPushReplacement(const PaymentResultView());
    await Future.delayed(const Duration(seconds: 2));
    //* Success
    if (response.status.isSuccess) {
      uniPayData.onPaymentSucess.call(response);
    }
    //* Failed
    else {
      uniPayData.onPaymentFailed.call(response);
    }
  }

  ///* Payment Methods
  static ValueNotifier<UniPayPaymentMethods> uniPayPaymentMethods =
      ValueNotifier(UniPayPaymentMethods.notSpecified);
  static void changePaymentMethod(UniPayPaymentMethods paymentMethod) {
    if (uniPayPaymentMethods.value != paymentMethod) {
      uniPayPaymentMethods.value = paymentMethod;
    } else {
      uniPayPaymentMethods.value = UniPayPaymentMethods.notSpecified;
    }
  }

  ///* Initialize Tamara all payment methods
  static ValueNotifier<UniPayCurrentState> tabbyNotifier =
      ValueNotifier<UniPayCurrentState>(UniPayCurrentState.notSpecified);

  ///* Tamara checkout data
  static TabbySession? tabbySession;
  static Future<TabbySession?> initTabbyCheckoutSession() async {
    tabbyNotifier.value = UniPayCurrentState.loading;

    // Create Tabby session
    tabbySession = await TabbyServices.createTabbySession(uniPayData);
    tabbyNotifier.value = tabbySession != null
        ? UniPayCurrentState.success
        : UniPayCurrentState.failed;
    return tabbySession;
  }
}
