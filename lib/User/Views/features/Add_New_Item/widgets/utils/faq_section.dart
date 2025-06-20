// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/add_new_item_controller.dart';
import 'package:kaldmv/core/global_widegts/custom_button.dart';
import 'package:kaldmv/core/global_widegts/custom_text_field.dart';

class FAQSection extends StatelessWidget {
  final AddNewItemController controller;
  final double sw;

  const FAQSection({super.key, required this.controller, required this.sw});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text(
              'FAQs',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
            SizedBox(height: 10.h),

            // List of question-answer pairs
            ...List.generate(controller.faqItems.length, (index) {
              final faq = controller.faqItems[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question ${index + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),

                    CustomTextField(
                      textEditingController: faq.questionController,
                      hintText: 'Enter your question',
                      fillColor: Colors.white,
                      borderSide: BorderSide(
                        color: const Color(0xFF000000).withOpacity(0.3),
                      ),
                      hintTextColor: const Color(0xFFC3C0C0),
                      fontSize: 14.sp,
                      height: 40.h,
                    ),
                    SizedBox(height: 10.h),

                    Container(
                      height: 100.h,
                      width: sw * 0.9,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF000000).withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 5.h,
                        ),
                        child: TextField(
                          controller: faq.answerController,
                          maxLines: null,
                          expands: true,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Answer',
                            hintStyle: TextStyle(
                              color: Color(0xFFC3C0C0),
                              fontSize: 14.sp,
                            ),
                            isCollapsed: true,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 5.h),

                    // Show delete button only if more than one FAQ exists
                    if (controller.faqItems.length > 1)
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            controller.removeFAQ(index);
                          },
                        ),
                      ),
                  ],
                ),
              );
            }),

            // Add More Question Button
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: sw * 0.6,
                child: CustomButton(
                  borderSide: BorderSide(color: Color(0xFF3F201C)),
                  onPressed: () {
                    controller.addFAQ();
                  },
                  text: 'Add More Question',
                  textColor: const Color(0xFF3F201C),
                  prefixIconPath: 'assets/images/add.png',
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      );
    });
  }
}
