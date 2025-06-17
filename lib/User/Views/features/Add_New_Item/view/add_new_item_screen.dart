// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/add_new_item_controller.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/widgets/utils/contact_info_section.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/widgets/utils/dotted_builder_widget.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/widgets/utils/faq_section.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/widgets/utils/featured_checkbox_section.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/widgets/utils/general_section.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/widgets/utils/highlight_section.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/widgets/utils/location_section.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/widgets/utils/media_section.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/widgets/utils/menu_section.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/widgets/utils/opening_hours_section.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/widgets/utils/social_network_section.dart';
import 'package:kaldmv/User/Views/features/Home/views/custom_drawer.dart';
import 'package:kaldmv/core/global_widegts/custom_button.dart';
import 'package:kaldmv/core/global_widegts/custom_header.dart';

class AddNewItemScreen extends StatelessWidget {
  const AddNewItemScreen({super.key});

  final LatLng placeLatLng = const LatLng(21.4858, 39.1925);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(AddNewItemController());

    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              menuIconPath: 'assets/images/menu11.png',
              logoPath: 'assets/images/logo22.png',
              backgroundColor: Colors.white,
              showFilters: false,
              showSearchBar: false,
              isAISuggestionPanelVisible: false,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        "Add new place",
                        style: GoogleFonts.dmSans(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    /// GENERAL
                    Container(
                      height: 650.h,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white),
                      child: GeneralSection(
                        controller: controller,
                        buildCustomQuillField:
                            ({
                              required quill.QuillController controller,
                              required String label,
                            }) => _buildCustomQuillField(
                              controller: controller,
                              label: label,
                            ),
                      ),
                    ),
                    SizedBox(height: 30.h),

                    /// HIGHLIGHTS
                    Container(
                      height: 200.h,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white),

                      child: HighlightsSection(
                        items: [
                          "Air Condition",
                          "Car Parking",
                          "Cocktails",
                          "Credit Cards",
                          "Non Smoking",
                          "Reservations",
                          "Swimming Pool",
                          "WiFi",
                        ],
                      ),
                    ),

                    SizedBox(height: 30.h),

                    /// Menu
                    Container(
                      height: 725.h,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white),
                      child: MenuSection(
                        controller: controller,
                        buildCustomQuillField:
                            ({
                              required quill.QuillController controller,
                              required String label,
                            }) => _buildCustomQuillField(
                              controller: controller,
                              label: label,
                            ),
                      ),
                    ),

                    SizedBox(height: 30.h),

                    Container(
                      height: 650.h,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white),
                      child: LocationSection(
                        controller: controller,
                        placeLatLng: LatLng(24.7136, 46.6753), // Riyadh
                      ),
                    ),

                    SizedBox(height: 30.h),

                    /// Contact Info
                    Container(
                      height: 340.h,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white),
                      child: ContactInfoSection(controller: controller),
                    ),

                    SizedBox(height: 30.h),

                    /// Social Network
                    Container(
                      height: 270.h,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white),
                      child: SocialNetworkSection(controller: controller),
                    ),

                    SizedBox(height: 30.h),

                    /// Opening Hours
                    Container(
                      height: 550.h,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white),
                      child: OpeningHoursSection(controller: controller),
                    ),

                    SizedBox(height: 30.h),

                    /// Media
                    Container(
                      height: 580.h,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white),
                      child: MediaSection(
                        controller: controller,
                        buildDottedBorderWidget: buildDottedBorderWidget,
                      ),
                    ),

                    SizedBox(height: 30.h),

                    /// FAQ Section
                    Container(
                      height: 560.h,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white),
                      child: FAQSection(
                        controller: controller,
                        sw: screenWidth,
                      ),
                    ),

                    SizedBox(height: 30.h),

                    /// Mark this place as featured
                    Container(
                      height: 100.h,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white),
                      child: FeaturedCheckbox(controller: controller),
                    ),

                    SizedBox(height: 30.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: CustomButton(
                        onPressed: () {},
                        text: 'Submit',
                        fontSize: 20.sp,
                        textColor: const Color(0xFFFFFFFF),
                        backgroundColor: Color(0xFFF97C68),
                        borderRadius: 16.r,
                        centerText: true,
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomQuillField({
    required quill.QuillController controller,
    required String label,
  }) {
    final focusNode = FocusNode();

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          SizedBox(height: 4.h),
          Container(
            height: 200.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Column(
              children: [
                // Toolbar
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // Formatting buttons
                      _buildToolbarButton(
                        icon: Icons.format_bold,
                        onPressed: () =>
                            controller.formatSelection(quill.Attribute.bold),
                      ),
                      _buildToolbarButton(
                        icon: Icons.format_italic,
                        onPressed: () =>
                            controller.formatSelection(quill.Attribute.italic),
                      ),
                      _buildToolbarButton(
                        icon: Icons.format_underlined,
                        onPressed: () => controller.formatSelection(
                          quill.Attribute.underline,
                        ),
                      ),
                      _buildToolbarButton(
                        icon: Icons.format_strikethrough,
                        onPressed: () => controller.formatSelection(
                          quill.Attribute.strikeThrough,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      _buildToolbarButton(
                        icon: Icons.format_list_bulleted,
                        onPressed: () =>
                            controller.formatSelection(quill.Attribute.ul),
                      ),
                      _buildToolbarButton(
                        icon: Icons.format_list_numbered,
                        onPressed: () =>
                            controller.formatSelection(quill.Attribute.ol),
                      ),
                      SizedBox(width: 8.w),
                      _buildToolbarButton(
                        icon: Icons.format_quote,
                        onPressed: () => controller.formatSelection(
                          quill.Attribute.blockQuote,
                        ),
                      ),
                      _buildToolbarButton(
                        icon: Icons.code,
                        onPressed: () => controller.formatSelection(
                          quill.Attribute.codeBlock,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      _buildToolbarButton(
                        icon: Icons.link,
                        onPressed: () async {
                          final index = controller.selection.baseOffset;
                          final length =
                              controller.selection.extentOffset - index;
                          // String? url;

                          final result = await showDialog<String>(
                            context: Get.context!,
                            builder: (context) {
                              String dialogUrl = '';
                              return AlertDialog(
                                title: Text(
                                  'Add Link',
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                content: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter URL',
                                    hintStyle: TextStyle(fontSize: 14.sp),
                                  ),
                                  style: TextStyle(fontSize: 14.sp),
                                  onChanged: (value) => dialogUrl = value,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Get.back(),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Get.back(result: dialogUrl),
                                    child: Text(
                                      'Add',
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );

                          if (result != null && result.isNotEmpty) {
                            controller.formatText(
                              index,
                              length,
                              quill.LinkAttribute(result),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                // Editor
                Expanded(
                  child: quill.QuillEditor(
                    controller: controller,
                    focusNode: focusNode,
                    scrollController: ScrollController(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolbarButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      icon: Icon(icon, size: 20.sp),
      onPressed: onPressed,
      splashRadius: 20,
      padding: EdgeInsets.all(6.w),
      constraints: BoxConstraints(minWidth: 36.w, minHeight: 36.w),
    );
  }
}
