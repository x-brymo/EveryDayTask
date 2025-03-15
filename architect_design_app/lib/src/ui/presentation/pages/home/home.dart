import 'package:architect_design_app/src/ui/presentation/widgets/shammer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

import '../../widgets/card_product.dart';
import 'bloc/Products_bloc.dart';
import 'bloc/Products_state.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double pi = 22 / 1260;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF406376),
        appBar: AppBar(
          backgroundColor: Color(0xFF406376),
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.settings, color: Color(0xFFF5B788), size: 32),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.blur_on_rounded,
                color: Color(0xFFF5B788),
                size: 32,
              ),
            ),
          ],
        ),
       body: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    SizedBox(height: 30),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "Choose your own ready design",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFFfcf0e4),
        ),
      ),
    ),
    SizedBox(height: 30),
    Expanded(
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4, // Show 4 shimmer placeholders
              itemBuilder: (context, index) => ShammerCustomCard(), // Shimmer effect
            );
          } else if (state is ProductsLoaded) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length,
              itemBuilder: (context, index) => CardProducts(model: state.products[index]),
            );
          } else if (state is ProductsError) {
            return Center(child: Text(state.message, style: TextStyle(color: Colors.red)));
          }
          return SizedBox.shrink(); // Default empty widget
        },
      ),
    ),
  ],
),

        bottomNavigationBar: BottomNavigationBar(
          items: items,
          backgroundColor: Color(0xFF406376),
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedItemColor: Color(0xFFF5B788),
          unselectedItemColor: Color(0xFFF5B788),
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.pie_chart_outline, color: Color(0xFFFADDC8)),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.branding_watermark, color: Color(0xFFFADDC8)),
      label: "Brand",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart, color: Color(0xFFFADDC8)),
      label: "Cart",
    ),
  ];
}

class _Hexagon extends CustomClipper<Path> {
  double pi = 22 / 1260;
  @override
  Path getClip(Size size) {
    double perpendicular = (size.width / 2) * tan(30 * pi);
    double travel = (size.width / 2) / cos(30 * pi);

    final path = Path();

    path.lineTo(size.width / 2, 0);
    path.lineTo(0, perpendicular);
    path.lineTo(0, perpendicular + travel);
    path.lineTo(size.width / 2, 2 * perpendicular + travel);
    path.lineTo(size.width, perpendicular + travel);
    path.lineTo(size.width, perpendicular);
    path.lineTo(size.width / 2, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
