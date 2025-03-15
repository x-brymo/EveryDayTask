import 'package:flutter/material.dart';

import '../../data/export_datasource.dart';

class CardProducts extends StatefulWidget {
  final ArchitectModel model;

  const CardProducts({super.key, required this.model});

  @override
  State<CardProducts> createState() => _CardProductsState();
}

class _CardProductsState extends State<CardProducts> {
  int selectedIndex = 0;

  void nextProduct() {
    setState(() {
      selectedIndex = (selectedIndex + 1) % listModel.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 228,
      child: Column(
        children: <Widget>[
          Container(
            height: 150, // Adjust as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/${widget.model.imageUrl}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.model.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFfcf0e4),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.model.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xFFaacedc)),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 50,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFCD9274),
                ),
                child: IconButton(
                  onPressed: () {
                    // when tab on container next product if end start in first
                    nextProduct();
                  },
                  icon: Icon(
                    Icons.shopping_bag_rounded,
                    size: 22.5,
                    color: Color(0xFFFADDC8),
                  ),
                ),
              ),
              Text(
                widget.model.price,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFecdfcf),
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
        ],
      ),
    );
  }
}
