import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/widgets/utils/model/FAQ_item.dart';

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
  final TextEditingController cityController = TextEditingController();
  final TextEditingController newCityController = TextEditingController();
  final TextEditingController timeZoneController = TextEditingController();
  final TextEditingController placeAddressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phone1Controller = TextEditingController();
  final TextEditingController phone2Controller = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController twitterController = TextEditingController();
  final TextEditingController mondayController = TextEditingController();
  final TextEditingController tuesdayController = TextEditingController();
  final TextEditingController wednesdayController = TextEditingController();
  final TextEditingController thursdayController = TextEditingController();
  final TextEditingController fridayController = TextEditingController();
  final TextEditingController saturdayController = TextEditingController();
  final TextEditingController sundayController = TextEditingController();
  final TextEditingController videoController = TextEditingController();
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  // Dropdown values
  var selectedHour = "".obs;
  var selectedNone = "".obs;
  var selectedCategory = "".obs;
  var selectedPlaceType = "".obs;
  var selectedItemPrice = "".obs;
  var selectedCity = "".obs;
  var selectedTime = "".obs;
  RxBool isFeatured = false.obs;

  RxList<FAQItem> faqItems = <FAQItem>[].obs;

  // Dropdown items
  final List<String> hourItems = ["Hour", "Day", "Month"];
  final List<String> noneItems = ["Service Charge", "Tax"];
  final List<String> categoryItems = ["Restaurant", "Cafe", "Hotel"];
  final List<String> cityItems = ["London", "Manchester", "Birmingham"];
  final List<String> timeItems = ["Riyadh", "Madinah", "Jeddha", "Dhaka"];
  final List<String> placeTypeItems = ["Indoor", "Outdoor", "Rooftop"];
  final List<String> itemPriceItems = [
    "100\$ - 300\$",
    "300\$ - 500\$",
    "500\$ - 1000\$",
    "Above 1000\$",
  ];

  @override
  void onInit() {
    super.onInit();
    faqItems.add(FAQItem());
  }

  void addFAQ() {
    faqItems.add(FAQItem());
  }

  void removeFAQ(int index) {
    faqItems[index].dispose();
    faqItems.removeAt(index);
  }

  @override
  void onClose() {
    for (var faq in faqItems) {
      faq.dispose();
    }
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
    cityController.dispose();
    newCityController.dispose();
    timeZoneController.dispose();
    placeAddressController.dispose();
    emailController.dispose();
    phone1Controller.dispose();
    phone2Controller.dispose();
    websiteController.dispose();
    facebookController.dispose();
    instagramController.dispose();
    twitterController.dispose();
    mondayController.dispose();
    tuesdayController.dispose();
    wednesdayController.dispose();
    thursdayController.dispose();
    fridayController.dispose();
    saturdayController.dispose();
    sundayController.dispose();
    videoController.dispose();
    questionController.dispose();
    answerController.dispose();
    super.onClose();
  }
}
