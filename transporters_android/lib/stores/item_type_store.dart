import 'package:mobx/mobx.dart';

part 'item_type_store.g.dart';

class ItemTypeStore = _ItemTypeStore with _$ItemTypeStore;

abstract class _ItemTypeStore with Store {
  @observable
  bool foodSelected = false;

  @observable
  bool medicineSelected = false;

  @observable
  bool grocerySelected = false;

  @observable
  bool giftSelected = false;

  @observable
  bool documentSelected = false;

  @observable
  bool packageSelected = false;

  @observable
  ObservableSet<String> itemSelected = ObservableSet<String>();

  @action
  void toggleFoodSelected() {
    foodSelected = !foodSelected;
    if (itemSelected.contains('food')) {
      itemSelected.remove('food');
    } else {
      itemSelected.add('food');
    }
  }

  @action
  void toggleMedicineSelected() {
    medicineSelected = !medicineSelected;
    if (itemSelected.contains('medicine')) {
      itemSelected.remove('medicine');
    } else {
      itemSelected.add('medicine');
    }
  }

  @action
  void toggleGrocerySelected() {
    grocerySelected = !grocerySelected;
    if (itemSelected.contains('grocery')) {
      itemSelected.remove('grocery');
    } else {
      itemSelected.add('grocery');
    }
  }

  @action
  void toggleGiftSelected() {
    giftSelected = !giftSelected;
    if (itemSelected.contains('gift')) {
      itemSelected.remove('gift');
    } else {
      itemSelected.add('gift');
    }
  }

  @action
  void toggleDocumentSelected() {
    documentSelected = !documentSelected;
    if (itemSelected.contains('document')) {
      itemSelected.remove('document');
    } else {
      itemSelected.add('document');
    }
  }

  @action
  void togglePackageSelected() {
    packageSelected = !packageSelected;
    if (itemSelected.contains('package')) {
      itemSelected.remove('package');
    } else {
      itemSelected.add('package');
    }
  }
}
