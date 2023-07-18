import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:skillmaestro/common/widgets/common_widget.dart';

Shimmer getGridShimmer(width, height) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: SizedBox(
        width: width / 2,
        child: Column(
          children: [
            Container(
              height: height / 7.7,
              width: width / 2.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9), color: Colors.white),
            ),
            widgets().sizedboxHeight10(),
            Row(
              children: [
                Container(
                  height: 10,
                  width: 120,
                  color: Colors.white,
                )
              ],
            ),
            widgets().sizedboxHeight10(),
            Row(
              children: [
                Container(
                  height: 10,
                  width: 70,
                  color: Colors.white,
                )
              ],
            ),
            widgets().sizedboxHeight10(),
            Row(
              children: [
                Container(
                  height: 10,
                  width: 50,
                  color: Colors.white,
                )
              ],
            ),
          ],
        )),
  );
}
