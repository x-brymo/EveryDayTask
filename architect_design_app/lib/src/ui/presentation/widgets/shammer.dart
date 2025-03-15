import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShammerCustomCard extends StatelessWidget {
  const ShammerCustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 228,
      child: Column(
        children: <Widget>[
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 150,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 20,
              width: 150,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 40,
              width: 180,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 20,
              width: 80,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 18),
        ],
      ),
    );
  
  }
}