import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HighlightsSection extends StatefulWidget {
  final List<String> items;

  const HighlightsSection({super.key, required this.items});

  @override
  State<HighlightsSection> createState() => _HighlightsSectionState();
}

class _HighlightsSectionState extends State<HighlightsSection> {
  // Track selected chips by index or name
  final Set<String> _selectedItems = {};

  @override
  Widget build(BuildContext context) {
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
          Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: widget.items.map((item) {
              final isSelected = _selectedItems.contains(item);
              return FilterChip(
                label: Text(item, style: GoogleFonts.dmSans(fontSize: 12.sp)),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedItems.add(item);
                    } else {
                      _selectedItems.remove(item);
                    }
                  });
                },
                backgroundColor: Colors.grey[200],
                selectedColor: Colors.blueAccent.withOpacity(0.4),
                labelStyle: TextStyle(
                  color: isSelected ? Colors.blueAccent : Colors.black,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
