import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../widgets/cart.dart';

class FoodItemScreen extends StatefulWidget {
  final String foodName;
  final String imageUrl;
  final String description;
  final int foodPrice;  // Add price parameter

  const FoodItemScreen({
    super.key,
    required this.foodName,
    required this.imageUrl,
    required this.description,
    required this.foodPrice,
  });

  @override
  _FoodItemScreenState createState() => _FoodItemScreenState();
}

class _FoodItemScreenState extends State<FoodItemScreen> {
  bool isFavorite = false;
  String selectedPurchaseType = 'one-time';  // 'one-time' or 'subscribe'
  int quantity = 1;
  int deliveryInterval = 3;  // Default 3 months


  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool favoriteStatus = prefs.getBool(widget.foodName) ?? false;
    setState(() {
      isFavorite = favoriteStatus;
    });
  }

  Future<void> _saveFavoriteStatus(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(widget.foodName, value);
  }

  Widget _buildPurchaseOption({
    required String title,
    required int price,
    required String pricePerUnit,
    String? discount,
  }) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedPurchaseType == title.toLowerCase()
              ? Colors.lightBlue
              : Colors.grey[300]!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Radio<String>(
                value: title.toLowerCase(),
                groupValue: selectedPurchaseType,
                onChanged: (String? value) {
                  setState(() {
                    selectedPurchaseType = value!;
                  });
                },
                activeColor: Colors.lightBlue,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (discount != null)
                  Text(
                    discount,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '₹',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      '$price',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '($pricePerUnit)',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.foodName),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
                _saveFavoriteStatus(isFavorite);
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    widget.imageUrl,
                    height: 250.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.description,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24.0),

              // Purchase Options Section
              _buildPurchaseOption(
                title: 'Buy once',
                price: widget.foodPrice,
                pricePerUnit: '₹22.20 / milligram',
                discount: '-20%',
              ),
              const SizedBox(height: 16.0),
              _buildPurchaseOption(
                title: 'Subscribe & Save',
                price:  widget.foodPrice-20,
                pricePerUnit: '₹16.00 / milligram',
                discount: '-40%',
              ),

              // Additional subscription details
              if (selectedPurchaseType == 'subscribe & save')
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Save up to 20% on repeat deliveries',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 16.0),
              // Quantity selector
              Container(
                padding: const EdgeInsets.only(left:8.0, right:8.0, top:8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    const Text('Quantity:'),
                    const SizedBox(width: 8.0),
                    DropdownButton<int>(
                      value: quantity,
                      onChanged: (int? newValue) {
                        setState(() {
                          quantity = newValue!;
                        });
                      },
                      items: List.generate(10, (index) => index + 1)
                          .map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              if (selectedPurchaseType == 'subscribe & save')
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        const Text('Deliver every:'),
                        const SizedBox(width: 8.0),
                        DropdownButton<int>(
                          value: deliveryInterval,
                          onChanged: (int? newValue) {
                            setState(() {
                              deliveryInterval = newValue!;
                            });
                          },
                          items: [1, 2, 3, 6]
                              .map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text('$value week(s)'),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 24.0),

              // ADD TO CART Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    CartItem newCartItem = CartItem(
                      image: widget.imageUrl,
                      title: widget.foodName,
                      price: widget.foodPrice,
                      quantity: 1,
                    );
                    cartItems.add(newCartItem);
                        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCart(),)
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${widget.foodName} added to cart!'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'ADD TO CART',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
