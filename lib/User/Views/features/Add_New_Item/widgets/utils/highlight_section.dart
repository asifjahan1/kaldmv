import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaldmv/User/Views/features/Add_New_Item/controller/highlight_controller.dart';

class HighlightsSection extends StatelessWidget {
  final List<String> items;

  const HighlightsSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HighlightsController());
    controller.initializeItems(items);

    // Split items into rows of exactly 3 (last row may have fewer)
    List<List<String>> rows = [];
    for (var i = 0; i < items.length; i += 2) {
      rows.add(items.sublist(i, i + 3 > items.length ? items.length : i + 2));
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            "Highlights",
            style: GoogleFonts.dmSans(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Obx(
            () => Column(
              children: rows.map((rowItems) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(2, (index) {
                      if (index < rowItems.length) {
                        final item = rowItems[index];
                        final isSelected = controller.selectedItems.contains(
                          item,
                        );
                        return Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: CheckboxListTile(
                              value: isSelected,
                              onChanged: (value) {
                                controller.toggleSelection(item);
                              },
                              title: Text(
                                item,
                                style: GoogleFonts.dmSans(
                                  fontSize: 12.sp,
                                  color: isSelected
                                      ? Color(0xFF867B79)
                                      : Color(0xFF867B79),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                              ),
                              dense: true,
                            ),
                          ),
                        );
                      } else {
                        return Expanded(child: Container());
                      }
                    }),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
