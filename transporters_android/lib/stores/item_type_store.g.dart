// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_type_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemTypeStore on _ItemTypeStore, Store {
  late final _$foodSelectedAtom =
      Atom(name: '_ItemTypeStore.foodSelected', context: context);

  @override
  bool get foodSelected {
    _$foodSelectedAtom.reportRead();
    return super.foodSelected;
  }

  @override
  set foodSelected(bool value) {
    _$foodSelectedAtom.reportWrite(value, super.foodSelected, () {
      super.foodSelected = value;
    });
  }

  late final _$medicineSelectedAtom =
      Atom(name: '_ItemTypeStore.medicineSelected', context: context);

  @override
  bool get medicineSelected {
    _$medicineSelectedAtom.reportRead();
    return super.medicineSelected;
  }

  @override
  set medicineSelected(bool value) {
    _$medicineSelectedAtom.reportWrite(value, super.medicineSelected, () {
      super.medicineSelected = value;
    });
  }

  late final _$grocerySelectedAtom =
      Atom(name: '_ItemTypeStore.grocerySelected', context: context);

  @override
  bool get grocerySelected {
    _$grocerySelectedAtom.reportRead();
    return super.grocerySelected;
  }

  @override
  set grocerySelected(bool value) {
    _$grocerySelectedAtom.reportWrite(value, super.grocerySelected, () {
      super.grocerySelected = value;
    });
  }

  late final _$giftSelectedAtom =
      Atom(name: '_ItemTypeStore.giftSelected', context: context);

  @override
  bool get giftSelected {
    _$giftSelectedAtom.reportRead();
    return super.giftSelected;
  }

  @override
  set giftSelected(bool value) {
    _$giftSelectedAtom.reportWrite(value, super.giftSelected, () {
      super.giftSelected = value;
    });
  }

  late final _$documentSelectedAtom =
      Atom(name: '_ItemTypeStore.documentSelected', context: context);

  @override
  bool get documentSelected {
    _$documentSelectedAtom.reportRead();
    return super.documentSelected;
  }

  @override
  set documentSelected(bool value) {
    _$documentSelectedAtom.reportWrite(value, super.documentSelected, () {
      super.documentSelected = value;
    });
  }

  late final _$packageSelectedAtom =
      Atom(name: '_ItemTypeStore.packageSelected', context: context);

  @override
  bool get packageSelected {
    _$packageSelectedAtom.reportRead();
    return super.packageSelected;
  }

  @override
  set packageSelected(bool value) {
    _$packageSelectedAtom.reportWrite(value, super.packageSelected, () {
      super.packageSelected = value;
    });
  }

  late final _$itemSelectedAtom =
      Atom(name: '_ItemTypeStore.itemSelected', context: context);

  @override
  ObservableSet<String> get itemSelected {
    _$itemSelectedAtom.reportRead();
    return super.itemSelected;
  }

  @override
  set itemSelected(ObservableSet<String> value) {
    _$itemSelectedAtom.reportWrite(value, super.itemSelected, () {
      super.itemSelected = value;
    });
  }

  late final _$_ItemTypeStoreActionController =
      ActionController(name: '_ItemTypeStore', context: context);

  @override
  void toggleFoodSelected() {
    final _$actionInfo = _$_ItemTypeStoreActionController.startAction(
        name: '_ItemTypeStore.toggleFoodSelected');
    try {
      return super.toggleFoodSelected();
    } finally {
      _$_ItemTypeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleMedicineSelected() {
    final _$actionInfo = _$_ItemTypeStoreActionController.startAction(
        name: '_ItemTypeStore.toggleMedicineSelected');
    try {
      return super.toggleMedicineSelected();
    } finally {
      _$_ItemTypeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleGrocerySelected() {
    final _$actionInfo = _$_ItemTypeStoreActionController.startAction(
        name: '_ItemTypeStore.toggleGrocerySelected');
    try {
      return super.toggleGrocerySelected();
    } finally {
      _$_ItemTypeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleGiftSelected() {
    final _$actionInfo = _$_ItemTypeStoreActionController.startAction(
        name: '_ItemTypeStore.toggleGiftSelected');
    try {
      return super.toggleGiftSelected();
    } finally {
      _$_ItemTypeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleDocumentSelected() {
    final _$actionInfo = _$_ItemTypeStoreActionController.startAction(
        name: '_ItemTypeStore.toggleDocumentSelected');
    try {
      return super.toggleDocumentSelected();
    } finally {
      _$_ItemTypeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePackageSelected() {
    final _$actionInfo = _$_ItemTypeStoreActionController.startAction(
        name: '_ItemTypeStore.togglePackageSelected');
    try {
      return super.togglePackageSelected();
    } finally {
      _$_ItemTypeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
foodSelected: ${foodSelected},
medicineSelected: ${medicineSelected},
grocerySelected: ${grocerySelected},
giftSelected: ${giftSelected},
documentSelected: ${documentSelected},
packageSelected: ${packageSelected},
itemSelected: ${itemSelected}
    ''';
  }
}
