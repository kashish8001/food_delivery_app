import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/small_text.dart';
import 'food_item.dart';

class RestaurantMenu extends StatefulWidget {
  final Map<String, dynamic> restaurant;

  const RestaurantMenu({super.key, required this.restaurant});

  @override
  RestaurantMenuState createState() => RestaurantMenuState();
}

class RestaurantMenuState extends State<RestaurantMenu> {
  bool isFavorite = false; // Default value for favorite status

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  // Load favorite status from SharedPreferences
  _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    String restaurantKey =
        widget.restaurant['name']; // Use the restaurant name as a unique key
    bool favoriteStatus = prefs.getBool(restaurantKey) ??
        false; // Default to false if no value is found
    setState(() {
      isFavorite = favoriteStatus; // Set the state to the saved favorite status
    });
  }

  // Save favorite status to SharedPreferences
  _saveFavoriteStatus(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    String restaurantKey =
        widget.restaurant['name']; // Use the restaurant name as a unique key
    prefs.setBool(restaurantKey, value); // Save the state of the favorite icon
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Extract the restaurant name, items, etc.
    final restaurant = widget.restaurant;
    final String restaurantName = restaurant['name'];
    final String restaurantDescription = restaurant['description'];
    final String city = restaurant['city'];
    final String rating = restaurant['rating'].toString();
    final String deliveryTime = restaurant['deliveryTime'];
    final String distance = restaurant['distance'];
    final List<Map<String, dynamic>> items = restaurant['items'];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(restaurantName, style: const TextStyle(fontSize: 20)),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null, // Red when favorited
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite; // Toggle favorite state
                _saveFavoriteStatus(isFavorite); // Save the updated state
              });
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // double screenHeight = constraints.maxHeight;
          // double screenWidth = constraints.maxWidth;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                      data: restaurantDescription, screenWidth: screenWidth),
                  SmallText(data: city, screenWidth: screenWidth),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("⭐ $rating  ", style: TextStyle(fontSize: 16)),
                        Row(
                          children: [
                            Icon(Icons.delivery_dining, color: Colors.brown),
                            Text("$deliveryTime  ",
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.more_rounded,
                                color: Colors.indigoAccent),
                            Text(" Rs 200 For Two",
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    color: Colors.black12,
                    child: Column(
                      children: [
                        ListTile(
                          leading:
                              const Icon(Icons.local_offer, color: Colors.red),
                          title: SmallText(
                              data:
                                  "30% off up to Rs 75 | Use code CRAVETOSAVE",
                              screenWidth: screenWidth),
                        ),
                        ListTile(
                          leading:
                              const Icon(Icons.local_offer, color: Colors.red),
                          title: SmallText(
                              data:
                                  "20% off up to Rs 100 with SBI credit cards, once per week | Use code 100SBI",
                              screenWidth: screenWidth),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(thickness: 1),
                  const SizedBox(height: 5),
                  const Text(
                    "MENU",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MenuItem(
                          imageUrl: items[0]['image'],
                          name: items[0]['name'],
                          price: items[0]['price'],
                          description: items[0]['description'],
                        ),
                        MenuItem(
                          imageUrl: items[1]['image'],
                          name: items[1]['name'],
                          price: items[1]['price'],
                          description: items[1]['description'],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MenuItem(
                          imageUrl: items[2]['image'],
                          name: items[2]['name'],
                          price: items[2]['price'],
                          description: items[2]['description'],
                        ),
                        MenuItem(
                          imageUrl: items[3]['image'],
                          name: items[3]['name'],
                          price: items[3]['price'],
                          description: items[3]['description'],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 1),
                  // Pizza section
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Pizza section title
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          // List should not scroll independently
                          shrinkWrap: true,
                          // Wraps content to the available height
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 1.0),
                              child: ListTile(
                                leading: const Icon(Icons.restaurant,
                                    color: Colors.lightBlueAccent),
                                title: Text(
                                  items[index]['name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: items[index]['description'] != null
                                    ? Text(
                                        items[index]['description'],
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      )
                                    : null,
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rs ${items[index]['price']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 82,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  FoodItemScreen(
                                                foodName: items[index]['name'],
                                                imageUrl: items[index]['image'],
                                                description: items[index]['description'],
                                                foodPrice: items[index]['price'],
                                              ),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              209, 233, 246, 1.0),
                                          // rgb(209, 233, 246)
                                          foregroundColor:
                                              Colors.lightBlueAccent,
                                        ),
                                        child: const Text('VIEW'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int price;
  final String description;

  const MenuItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.fastfood_outlined, color: Colors.blue, size: 15),
              Text(
                " $name ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Rs ${price.toString()}"),
              const SizedBox(width: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodItemScreen(
                        foodName: name,
                        imageUrl: imageUrl,
                        description: description,
                        foodPrice: price,
                      ),
                    ),
                  );
                },
                child: const Text('VIEW'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
