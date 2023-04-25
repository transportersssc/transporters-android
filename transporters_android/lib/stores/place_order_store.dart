import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:transporters_android/api/delivery_order.dart';
import 'package:transporters_android/stores/size_selector_store.dart';

import 'item_type_store.dart';

part 'place_order_store.g.dart';

class PlaceOrderStore = _PlaceOrderStore with _$PlaceOrderStore;

abstract class _PlaceOrderStore with Store {
  final ItemTypeStore itemTypeStore = GetIt.instance<ItemTypeStore>();
  final SizeSelectorStore sizeSelectorStore =
      GetIt.instance<SizeSelectorStore>();

  static const storage = FlutterSecureStorage();

  @observable
  String fromAddress = '';

  @observable
  String toAddress = '';

  @observable
  double distance = 0.0;

  @observable
  double subTotal = 0.0;

  @action
  bool correctInputs() {
    if (fromAddress.isEmpty) {
      return false;
    }

    if (toAddress.isEmpty) {
      return false;
    }

    if (itemTypeStore.itemSelected.toList() == []) {
      return false;
    }

    if (sizeSelectorStore.selectedSize.isEmpty) {
      return false;
    }

    return true;
  }

  Future<bool> createOrder({
    required String fromAddress,
    required double fromLatitude,
    required double fromLongitude,
    required String toAddress,
    required double toLatitude,
    required double toLongitude,
    required double distance,
    required List<String> packageType,
    required String packageSize,
  }) async {
    String? token = await storage.read(key: 'token');
    var placeOrderResponse = await placeOrder(
      token: token!,
      originAddress: fromAddress,
      destinationAddress: toAddress,
      packageType: packageType,
      packageSize: packageSize,
    );

    Map<String, dynamic> jsonData = jsonDecode(placeOrderResponse);
    bool success = jsonData['success'];
    if (success) {
      String? token = jsonData['token'];
      await storage.write(key: 'token', value: token);
      return true;
    }

    return false;
  }
}
