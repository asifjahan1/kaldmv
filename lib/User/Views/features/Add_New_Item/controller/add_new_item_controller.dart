import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:get/get.dart';

class AddNewItemController extends GetxController {
  final TextEditingController placeNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController hourController = TextEditingController();
  final TextEditingController noneController = TextEditingController();
  final quill.QuillController descriptionController =
      quill.QuillController.basic();
  final quill.QuillController menuDescriptionController =
      quill.QuillController.basic();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController placeTypeController = TextEditingController();
  final TextEditingController menuNameController = TextEditingController();
  final TextEditingController itemPriceController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  // Dropdown values
  var selectedHour = "".obs;
  var selectedNone = "".obs;
  var selectedCategory = "".obs;
  var selectedPlaceType = "".obs;
  var selectedItemPrice = "".obs;

  // Dropdown items
  final List<String> hourItems = ["Hour", "Day", "Month"];
  final List<String> noneItems = ["Service Charge", "Tax"];
  final List<String> categoryItems = ["Restaurant", "Cafe", "Hotel"];
  final List<String> placeTypeItems = ["Indoor", "Outdoor", "Rooftop"];
  final List<String> itemPriceItems = [
    "100\$ - 300\$",
    "300\$ - 500\$",
    "500\$ - 1000\$",
    "Above 1000\$",
  ];

  @override
  void onClose() {
    placeNameController.dispose();
    priceController.dispose();
    hourController.dispose();
    noneController.dispose();
    descriptionController.dispose();
    categoryController.dispose();
    placeTypeController.dispose();
    menuNameController.dispose();
    itemPriceController.dispose();
    typeController.dispose();
    menuDescriptionController.dispose();
    super.onClose();
  }
}
