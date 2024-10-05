import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/CartBottomNavBar.dart';
import 'package:flutter/cupertino.dart'; // For CupertinoIcons
// import 'package:food_delivery_app/widgets/drawer_widget.dart'; // Assuming you have DrawerWidget
import 'package:food_delivery_app/widgets/AppBarWidget.dart'; // Assuming you have AppBarWidget

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(), // Assuming you have a custom AppBarWidget
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
                child: Text(
                  "Order List",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              // List of Cart Items
              _buildCartItem("assets/cart1.jpg", "Hot Pizza", "Taste Our Hot Pizza", 200, 2),
              _buildCartItem("assets/cart2.jpg", "Hot Burger", "Taste Our Hot Burger", 90, 1),
              _buildCartItem("assets/cart3.jpg", "Cold Drink", "Taste Our Cold Drink", 50, 1),

              const SizedBox(height: 30),

              // Order Summary Section
              _buildSummarySection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CartBottomNavBar(), // Assuming you have a custom CartBottomNavBar
    );
  }

  // Widget to build a single cart item
  Widget _buildCartItem(String image, String title, String subtitle, int price, int quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(image, height: 80, width: 150, fit: BoxFit.cover),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      "₹$price",
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            _buildQuantityControl(quantity),
          ],
        ),
      ),
    );
  }

  // Widget for quantity control (add/remove)
  Widget _buildQuantityControl(int quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(CupertinoIcons.minus, color: Colors.white),
            Text(
              "$quantity",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Icon(CupertinoIcons.plus, color: Colors.white),
          ],
        ),
      ),
    );
  }

  // Widget to build the summary section
  Widget _buildSummarySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            _buildSummaryRow("Items:", "4"),
            const Divider(color: Colors.black),
            _buildSummaryRow("Sub-Total:", "₹340"),
            const Divider(color: Colors.black),
            _buildSummaryRow("Delivery Charge:", "₹60"),
            const Divider(color: Colors.black),
            _buildSummaryRow("Total:", "₹400", isTotal: true),
          ],
        ),
      ),
    );
  }

  // Widget to build each row in the summary section
  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

