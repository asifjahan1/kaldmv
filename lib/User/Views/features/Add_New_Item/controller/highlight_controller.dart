import 'package:get/get.dart';

class HighlightsController extends GetxController {
  final RxList<String> items = <String>[].obs;
  final RxSet<String> selectedItems = <String>{}.obs;

  void initializeItems(List<String> items) {
    this.items.assignAll(items);
    selectedItems.clear(); // Reset selections when new items are provided
  }

  void toggleSelection(String item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
  }

  List<String> getSelectedItems() => selectedItems.toList();
}
