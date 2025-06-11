import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'app_colors.dart';

Widget loader() {
  return Center(child: SpinKitWave(color: appDeepBlueColor, size: 30.h));
}

Widget loader2() {
  return Center(child: SpinKitFoldingCube(color: Colors.white, size: 40.h));
}

Widget loaderCubeGrid() {
  return Center(child: SpinKitCubeGrid(color: Colors.white, size: 40.h));
}

Widget loaderWaveSpinner() {
  return Center(child: SpinKitWaveSpinner(color: Colors.white, size: 20.h));
}

Widget loaderDancing() {
  return Center(child: SpinKitDancingSquare(color: Colors.white, size: 20.h));
}