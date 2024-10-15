import 'package:flutter/material.dart';
import 'package:food_delivery_app/CartBottomNavBar.dart';
import 'package:flutter/cupertino.dart'; // For CupertinoIcons
import 'package:food_delivery_app/widgets/drawer_widget.dart'; // Assuming you have DrawerWidget
import 'package:food_delivery_app/widgets/AppBarWidget.dart'; // Assuming you have AppBarWidget

class CartItem {
  String image;
  String title;
  String subtitle;
  int price;
  int quantity;

  CartItem({required this.image, required this.title, required this.subtitle, required this.price, required this.quantity});
}

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  // List of Cart items
  List<CartItem> cartItems = [
    CartItem(image: "assets/image1.jpg", title: "Hot Pizza", subtitle: "Taste Our Hot Pizza", price: 200, quantity: 2),
    CartItem(image: "assets/image2.webp", title: "Hot Burger", subtitle: "Taste Our Hot Burger", price: 90, quantity: 1),
    CartItem(image: "assets/image3.jpg", title: "Cold Drink", subtitle: "Taste Our Cold Drink", price: 50, quantity: 1),
  ];

  // Function to calculate total price
  int getTotalPrice() {
    int subTotal = cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
    int deliveryCharge = 60;
    return subTotal + deliveryCharge;
  }

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
              ...cartItems.map((item) => _buildCartItem(item)).toList(),

              const SizedBox(height: 30),

              // Order Summary Section
              _buildSummarySection(),
            ],
          ),
        ),
      ),
      drawer: DrawerWidget(), // Assuming you have a custom DrawerWidget
      bottomNavigationBar: CartBottomNavBar(totalAmount: getTotalPrice()), // Assuming you have a custom CartBottomNavBar
    );
  }

  // Widget to build a single cart item
  Widget _buildCartItem(CartItem item) {
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
              child: Image.asset(item.image, height: 80, width: 150, fit: BoxFit.cover),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      item.subtitle,
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      "₹${item.price * item.quantity}",
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            _buildQuantityControl(item),
          ],
        ),
      ),
    );
  }

  // Widget for quantity control (add/remove)
  Widget _buildQuantityControl(CartItem item) {
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
            GestureDetector(
              onTap: () {
                setState(() {
                  if (item.quantity > 1) {
                    item.quantity--;
                  }
                });
              },
              child: const Icon(CupertinoIcons.minus, color: Colors.white),
            ),
            Text(
              "${item.quantity}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  item.quantity++;
                });
              },
              child: const Icon(CupertinoIcons.plus, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build the summary section
  Widget _buildSummarySection() {
    int totalItems = cartItems.fold(0, (sum, item) => sum + item.quantity);
    int subTotal = cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
    int deliveryCharge = 60;
    int total = subTotal + deliveryCharge;

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
            _buildSummaryRow("Items:", "$totalItems"),
            const Divider(color: Colors.black),
            _buildSummaryRow("Sub-Total:", "₹$subTotal"),
            const Divider(color: Colors.black),
            _buildSummaryRow("Delivery Charge:", "₹$deliveryCharge"),
            const Divider(color: Colors.black),
            _buildSummaryRow("Total:", "₹$total", isTotal: true),
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
