import 'package:flutter/material.dart';
import 'package:kaldmv/core/global_widegts/Resizer/model/ResizerModel.dart';

// Resizer widget যেটা children কে wrap করবে
class ResizerWidget extends StatelessWidget {
  final Widget child;
  final double designWidth;
  final double designHeight;
  final ResizerModel resizerModel;

  ResizerWidget({
    super.key,
    required this.child,
    this.designWidth = 375.0,
    this.designHeight = 812.0,
    ResizerModel? resizerModel,
  }) : resizerModel = resizerModel ?? ResizerModel();

  @override
  Widget build(BuildContext context) {
    resizerModel.init(context, designWidth: designWidth, designHeight: designHeight);
    return child;
  }
}
