// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlaceOrderStore on _PlaceOrderStore, Store {
  late final _$fromAddressAtom =
      Atom(name: '_PlaceOrderStore.fromAddress', context: context);

  @override
  String get fromAddress {
    _$fromAddressAtom.reportRead();
    return super.fromAddress;
  }

  @override
  set fromAddress(String value) {
    _$fromAddressAtom.reportWrite(value, super.fromAddress, () {
      super.fromAddress = value;
    });
  }

  late final _$toAddressAtom =
      Atom(name: '_PlaceOrderStore.toAddress', context: context);

  @override
  String get toAddress {
    _$toAddressAtom.reportRead();
    return super.toAddress;
  }

  @override
  set toAddress(String value) {
    _$toAddressAtom.reportWrite(value, super.toAddress, () {
      super.toAddress = value;
    });
  }

  late final _$distanceAtom =
      Atom(name: '_PlaceOrderStore.distance', context: context);

  @override
  double get distance {
    _$distanceAtom.reportRead();
    return super.distance;
  }

  @override
  set distance(double value) {
    _$distanceAtom.reportWrite(value, super.distance, () {
      super.distance = value;
    });
  }

  late final _$subTotalAtom =
      Atom(name: '_PlaceOrderStore.subTotal', context: context);

  @override
  double get subTotal {
    _$subTotalAtom.reportRead();
    return super.subTotal;
  }

  @override
  set subTotal(double value) {
    _$subTotalAtom.reportWrite(value, super.subTotal, () {
      super.subTotal = value;
    });
  }

  late final _$_PlaceOrderStoreActionController =
      ActionController(name: '_PlaceOrderStore', context: context);

  @override
  bool correctInputs() {
    final _$actionInfo = _$_PlaceOrderStoreActionController.startAction(
        name: '_PlaceOrderStore.correctInputs');
    try {
      return super.correctInputs();
    } finally {
      _$_PlaceOrderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fromAddress: ${fromAddress},
toAddress: ${toAddress},
distance: ${distance},
subTotal: ${subTotal}
    ''';
  }
}
