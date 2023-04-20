import 'package:mobx/mobx.dart';

part 'size_selector_store.g.dart';

class SizeSelectorStore = _SizeSelectorStore with _$SizeSelectorStore;

abstract class _SizeSelectorStore with Store {
  @observable
  bool smallSelected = false;

  @observable
  bool mediumSelected = false;

  @observable
  bool largeSelected = false;

  @observable
  String selectedSize = '';

  @action
  void toggleSmallSelected() {
    smallSelected = !smallSelected;
    mediumSelected = false;
    largeSelected = false;
    selectedSize = 'S';
  }

  @action
  void toggleMediumSelected() {
    mediumSelected = !mediumSelected;
    smallSelected = false;
    largeSelected = false;
    selectedSize = 'M';
  }

  @action
  void toggleLargeSelected() {
    largeSelected = !largeSelected;
    smallSelected = false;
    mediumSelected = false;
    selectedSize = 'L';
  }
}
