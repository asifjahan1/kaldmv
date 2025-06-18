import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Profile/model/profile_model.dart';

class ProfileController extends GetxController {
  final Rx<TextEditingController> firstNameController =
      TextEditingController().obs;
  final Rx<TextEditingController> lastNameController =
      TextEditingController().obs;
  final Rx<TextEditingController> mobileNumberController =
      TextEditingController().obs;
  final Rx<TextEditingController> faxNumberController =
      TextEditingController().obs;
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> skypeUrlController =
      TextEditingController().obs;
  final Rx<TextEditingController> facebookUrlController =
      TextEditingController().obs;
  final Rx<TextEditingController> twitterUrlController =
      TextEditingController().obs;
  final Rx<TextEditingController> instagramUrlController =
      TextEditingController().obs;
  final Rx<TextEditingController> youtubeUrlController =
      TextEditingController().obs;
  final Rx<TextEditingController> pinterestUrlController =
      TextEditingController().obs;
  final Rx<TextEditingController> linkedinUrlController =
      TextEditingController().obs;
  final Rx<TextEditingController> websiteUrlController =
      TextEditingController().obs;
  final Rx<TextEditingController> oldPasswordController =
      TextEditingController().obs;
  final Rx<TextEditingController> newPasswordController =
      TextEditingController().obs;
  final Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;

  final Rx<ProfileModel> profile = ProfileModel().obs;

  void updateProfile() {
    profile.value = ProfileModel(
      firstName: firstNameController.value.text,
      lastName: lastNameController.value.text,
      mobileNumber: mobileNumberController.value.text,
      faxNumber: faxNumberController.value.text,
      email: emailController.value.text,
      skypeUrl: skypeUrlController.value.text,
      facebookUrl: facebookUrlController.value.text,
      twitterUrl: twitterUrlController.value.text,
      instagramUrl: instagramUrlController.value.text,
      youtubeUrl: youtubeUrlController.value.text,
      pinterestUrl: pinterestUrlController.value.text,
      linkedinUrl: linkedinUrlController.value.text,
      websiteUrl: websiteUrlController.value.text,
    );
  }

  @override
  void onClose() {
    firstNameController.value.dispose();
    lastNameController.value.dispose();
    mobileNumberController.value.dispose();
    faxNumberController.value.dispose();
    emailController.value.dispose();
    skypeUrlController.value.dispose();
    facebookUrlController.value.dispose();
    twitterUrlController.value.dispose();
    instagramUrlController.value.dispose();
    youtubeUrlController.value.dispose();
    pinterestUrlController.value.dispose();
    linkedinUrlController.value.dispose();
    websiteUrlController.value.dispose();
    oldPasswordController.value.dispose();
    newPasswordController.value.dispose();
    confirmPasswordController.value.dispose();
    super.onClose();
  }
}
