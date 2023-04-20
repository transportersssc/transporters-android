// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size_selector_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SizeSelectorStore on _SizeSelectorStore, Store {
  late final _$smallSelectedAtom =
      Atom(name: '_SizeSelectorStore.smallSelected', context: context);

  @override
  bool get smallSelected {
    _$smallSelectedAtom.reportRead();
    return super.smallSelected;
  }

  @override
  set smallSelected(bool value) {
    _$smallSelectedAtom.reportWrite(value, super.smallSelected, () {
      super.smallSelected = value;
    });
  }

  late final _$mediumSelectedAtom =
      Atom(name: '_SizeSelectorStore.mediumSelected', context: context);

  @override
  bool get mediumSelected {
    _$mediumSelectedAtom.reportRead();
    return super.mediumSelected;
  }

  @override
  set mediumSelected(bool value) {
    _$mediumSelectedAtom.reportWrite(value, super.mediumSelected, () {
      super.mediumSelected = value;
    });
  }

  late final _$largeSelectedAtom =
      Atom(name: '_SizeSelectorStore.largeSelected', context: context);

  @override
  bool get largeSelected {
    _$largeSelectedAtom.reportRead();
    return super.largeSelected;
  }

  @override
  set largeSelected(bool value) {
    _$largeSelectedAtom.reportWrite(value, super.largeSelected, () {
      super.largeSelected = value;
    });
  }

  late final _$selectedSizeAtom =
      Atom(name: '_SizeSelectorStore.selectedSize', context: context);

  @override
  String get selectedSize {
    _$selectedSizeAtom.reportRead();
    return super.selectedSize;
  }

  @override
  set selectedSize(String value) {
    _$selectedSizeAtom.reportWrite(value, super.selectedSize, () {
      super.selectedSize = value;
    });
  }

  late final _$_SizeSelectorStoreActionController =
      ActionController(name: '_SizeSelectorStore', context: context);

  @override
  void toggleSmallSelected() {
    final _$actionInfo = _$_SizeSelectorStoreActionController.startAction(
        name: '_SizeSelectorStore.toggleSmallSelected');
    try {
      return super.toggleSmallSelected();
    } finally {
      _$_SizeSelectorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleMediumSelected() {
    final _$actionInfo = _$_SizeSelectorStoreActionController.startAction(
        name: '_SizeSelectorStore.toggleMediumSelected');
    try {
      return super.toggleMediumSelected();
    } finally {
      _$_SizeSelectorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleLargeSelected() {
    final _$actionInfo = _$_SizeSelectorStoreActionController.startAction(
        name: '_SizeSelectorStore.toggleLargeSelected');
    try {
      return super.toggleLargeSelected();
    } finally {
      _$_SizeSelectorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
smallSelected: ${smallSelected},
mediumSelected: ${mediumSelected},
largeSelected: ${largeSelected},
selectedSize: ${selectedSize}
    ''';
  }
}
