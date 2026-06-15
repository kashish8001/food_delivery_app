import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/restaurant/restaurant_menu.dart';

import 'data.dart';

class RestaurantScreen extends StatefulWidget {
  final String foodItem;

  const RestaurantScreen({super.key, required this.foodItem});

  @override
  RestaurantScreenState createState() => RestaurantScreenState();
}

class RestaurantScreenState extends State<RestaurantScreen> {
  int _currentPage = 0;
  int currentIndex = 0;
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredRestaurants = [];

  // String? _selectedSortOption; // Initial value for the dropdown

  final List<Map<String, dynamic>> _offers = offersList;

  // Define restaurant lists for each food category
  final Map<String, List<Map<String, dynamic>>> _restaurantData = restaurants;

  @override
  void initState() {
    super.initState();
    // Initial filter based on the widget.foodItem
    filteredRestaurants = _restaurantData[widget.foodItem] ?? [];
  }

  void _filterRestaurants(String query) {
    setState(() {
      filteredRestaurants = _restaurantData.entries
          .where(
              (entry) => entry.key.toLowerCase().contains(query.toLowerCase()))
          .expand((entry) => entry.value)
          .toList();
    });
  }

  void _sortRestaurants(String criterion) {
    setState(() {
      if (criterion == 'Relevance') {
        filteredRestaurants = _restaurantData[widget.foodItem] ?? [];
      } else if (criterion == 'Rating') {
        filteredRestaurants.sort((a, b) => b['rating'].compareTo(a['rating']));
      } else if (criterion == 'Delivery Time') {
        filteredRestaurants.sort((a, b) {
          // Convert delivery time to minutes for sorting
          int aTime = _parseTime(a['deliveryTime']);
          int bTime = _parseTime(b['deliveryTime']);
          return aTime.compareTo(bTime);
        });
      } else if (criterion == 'Distance') {
        filteredRestaurants.sort((a, b) {
          double aDistance = _parseDistance(a['distance']);
          double bDistance = _parseDistance(b['distance']);
          return aDistance.compareTo(bDistance);
        });
      }
    });
  }

  int _parseTime(String time) {
    // Extract numerical part of the delivery time and convert to minutes
    RegExp regExp = RegExp(r'(\d+)\s*min');
    Match? match = regExp.firstMatch(time);
    return match != null ? int.parse(match.group(1)!) : 0;
  }

  double _parseDistance(String distance) {
    // Extract numerical part of the distance and convert to double
    RegExp regExp = RegExp(r'(\d+(\.\d+)?)\s*km');
    Match? match = regExp.firstMatch(distance);
    return match != null ? double.parse(match.group(1)!) : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenHeight = constraints.maxHeight;
          double screenWidth = constraints.maxWidth;

          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.05),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Search for dishes & restaurants",
                      ),
                    ),
                  ],
                ),
                Container(
                  height: screenHeight * 0.1,
                  margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      hintText: "Search for food",
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () {
                          searchController.clear();
                          _filterRestaurants('');
                        },
                      ),
                    ),
                    onChanged: _filterRestaurants,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.0005),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "All Restaurants",
                        style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            onChanged: (value) {
                              if (value != null) {
                                _sortRestaurants(value);
                              }
                            },
                            items: const [
                              DropdownMenuItem(
                                  value: 'Relevance', child: Text('Relevance')),
                              DropdownMenuItem(
                                  value: 'Rating', child: Text('Rating')),
                              DropdownMenuItem(
                                  value: 'Delivery Time',
                                  child: Text('Delivery Time')),
                              DropdownMenuItem(
                                  value: 'Distance', child: Text('Distance')),
                            ],
                            // No "value" property here, so dropdown will not be forced to keep any specific selection
                            icon: const Icon(Icons.arrow_drop_down),
                            hint: const Text("Sort By"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // PAGE VIEW BUILDER
                SizedBox(
                  height: screenHeight * 0.25,
                  child: PageView.builder(
                    itemCount: _offers.length,
                    onPageChanged: (int index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      var offer = _offers[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.03,
                            vertical: screenHeight * 0.005),
                        child: Card(
                          color: Colors.lightBlueAccent, //rgb()rgb()
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(screenWidth * 0.03)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.02),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(0, 31, 63, 1.0),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: BigText(
                                    data: offer['title'],
                                    screenWidth: screenWidth,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ),

                              // TEXT OF PAGE VIEW BUILDER
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding:
                                        EdgeInsets.all(screenWidth * 0.03),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(offer['restaurant'],
                                                style: const TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 31, 63, 1.0),
                                                    fontSize: 20)),
                                            SizedBox(
                                                height: screenHeight * 0.01),
                                            Row(
                                              children: [
                                                const Text('⭐ '),
                                                // Icon(Icons.star,
                                                //     color: const Color.fromRGBO(0, 31, 63, 1.0),
                                                //     size: screenWidth * 0.045),
                                                Text('${offer['rating']}'),
                                                SizedBox(
                                                    width: screenWidth * 0.02),
                                                Text(offer['deliveryTime']),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    // IMAGE OF PAGE VIEW BUILDER
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding:
                                        EdgeInsets.all(screenWidth * 0.03),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              screenWidth * 0.03),
                                          child: Image.asset(offer['image'],
                                              fit: BoxFit.cover,
                                              height: screenHeight * 0.3),
                                        ),
                                      ),
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
                ),

                // PAGE CONSTRUCTOR (USING LIST OF CIRCLES)
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_offers.length, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.01),
                        width: _currentPage == index
                            ? screenWidth * 0.04
                            : screenWidth * 0.02,
                        height: screenHeight * 0.01,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Colors.blueAccent
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ),

                // Restaurant list based on selected food item
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filteredRestaurants.length,
                  itemBuilder: (context, index) {
                    var restaurant = filteredRestaurants[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenHeight * 0.01),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RestaurantMenu(restaurant: restaurant),
                            ),
                          );
                        },
                        child: Card(
                          color: const Color.fromRGBO(209, 233, 246, 1.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.02),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        screenWidth * 0.03),
                                    child: Image.asset(
                                      restaurant['image'],
                                      fit: BoxFit.cover,
                                      height: screenHeight * 0.15,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.03),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        restaurant['name'],
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.05,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: const Color.fromRGBO(
                                                  100, 32, 170, 1.0),
                                              size: screenWidth * 0.045),
                                          Text('${restaurant['rating']}'),
                                          SizedBox(width: screenWidth * 0.02),
                                          Text(restaurant['deliveryTime'] ??
                                              "N/A"),
                                        ],
                                      ),
                                      Text(
                                        restaurant['description'] ?? '',
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.04),
                                      ),
                                      Text(
                                        '${restaurant['city']} - ${restaurant['distance']} away',
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.04),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/widgets/big_text.dart';
// import 'package:food_delivery_app/restaurant/restaurant_menu.dart';
//
// import 'data.dart';
//
// class RestaurantScreen extends StatefulWidget {
//   final String foodItem;
//
//   const RestaurantScreen({super.key, required this.foodItem});
//
//   @override
//   RestaurantScreenState createState() => RestaurantScreenState();
// }
//
// class RestaurantScreenState extends State<RestaurantScreen> {
//   int _currentPage = 0;
//   int currentIndex = 0;
//   TextEditingController searchController = TextEditingController();
//   List<Map<String, dynamic>> filteredRestaurants = [];
//
//   // String? _selectedSortOption; // Initial value for the dropdown
//
//   final List<Map<String, dynamic>> _offers = offersList;
//
//   // Define restaurant lists for each food category
//   final Map<String, List<Map<String, dynamic>>> _restaurantData = restaurants;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initial filter based on the widget.foodItem
//     filteredRestaurants = _restaurantData[widget.foodItem] ?? [];
//   }
//
//   void _filterRestaurants(String query) {
//     setState(() {
//       filteredRestaurants = _restaurantData.entries
//           .where(
//               (entry) => entry.key.toLowerCase().contains(query.toLowerCase()))
//           .expand((entry) => entry.value)
//           .toList();
//     });
//   }
//
//   void _sortRestaurants(String criterion) {
//     setState(() {
//       if (criterion == 'Relevance') {
//         filteredRestaurants = _restaurantData[widget.foodItem] ?? [];
//       } else if (criterion == 'Rating') {
//         filteredRestaurants.sort((a, b) => b['rating'].compareTo(a['rating']));
//       } else if (criterion == 'Delivery Time') {
//         filteredRestaurants.sort((a, b) {
//           // Convert delivery time to minutes for sorting
//           int aTime = _parseTime(a['deliveryTime']);
//           int bTime = _parseTime(b['deliveryTime']);
//           return aTime.compareTo(bTime);
//         });
//       } else if (criterion == 'Distance') {
//         filteredRestaurants.sort((a, b) {
//           double aDistance = _parseDistance(a['distance']);
//           double bDistance = _parseDistance(b['distance']);
//           return aDistance.compareTo(bDistance);
//         });
//       }
//     });
//   }
//
//   int _parseTime(String time) {
//     // Extract numerical part of the delivery time and convert to minutes
//     RegExp regExp = RegExp(r'(\d+)\s*min');
//     Match? match = regExp.firstMatch(time);
//     return match != null ? int.parse(match.group(1)!) : 0;
//   }
//
//   double _parseDistance(String distance) {
//     // Extract numerical part of the distance and convert to double
//     RegExp regExp = RegExp(r'(\d+(\.\d+)?)\s*km');
//     Match? match = regExp.firstMatch(distance);
//     return match != null ? double.parse(match.group(1)!) : 0.0;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           double screenHeight = constraints.maxHeight;
//           double screenWidth = constraints.maxWidth;
//
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(height: screenHeight * 0.05),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.arrow_back),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                     const Align(
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Search for dishes & restaurants",
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   height: screenHeight * 0.1,
//                   margin: const EdgeInsets.only(left: 8.0, right: 8.0),
//                   padding: const EdgeInsets.all(8.0),
//                   alignment: Alignment.bottomCenter,
//                   child: TextField(
//                     controller: searchController,
//                     decoration: InputDecoration(
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       hintText: "Search for food",
//                       prefixIcon: const Icon(Icons.search),
//                       suffixIcon: IconButton(
//                         icon: const Icon(Icons.close_rounded),
//                         onPressed: () {
//                           searchController.clear();
//                           _filterRestaurants('');
//                         },
//                       ),
//                     ),
//                     onChanged: _filterRestaurants,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: screenWidth * 0.05,
//                       vertical: screenHeight * 0.0005),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "All Restaurants",
//                         style: TextStyle(
//                             fontSize: screenWidth * 0.05,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(5.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: DropdownButtonHideUnderline(
//                           child: DropdownButton<String>(
//                             onChanged: (value) {
//                               if (value != null) {
//                                 _sortRestaurants(value);
//                               }
//                             },
//                             items: const [
//                               DropdownMenuItem(
//                                   value: 'Relevance', child: Text('Relevance')),
//                               DropdownMenuItem(
//                                   value: 'Rating', child: Text('Rating')),
//                               DropdownMenuItem(
//                                   value: 'Delivery Time',
//                                   child: Text('Delivery Time')),
//                               DropdownMenuItem(
//                                   value: 'Distance', child: Text('Distance')),
//                             ],
//                             // No "value" property here, so dropdown will not be forced to keep any specific selection
//                             icon: const Icon(Icons.arrow_drop_down),
//                             hint: const Text("Sort By"),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 // PAGE VIEW BUILDER
//                 SizedBox(
//                   height: screenHeight * 0.25,
//                   child: PageView.builder(
//                     itemCount: _offers.length,
//                     onPageChanged: (int index) {
//                       setState(() {
//                         _currentPage = index;
//                       });
//                     },
//                     itemBuilder: (context, index) {
//                       var offer = _offers[index];
//                       return Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: screenWidth * 0.03,
//                             vertical: screenHeight * 0.005),
//                         child: Card(
//                           color: Colors.lightBlueAccent, //rgb()rgb()
//                           shape: RoundedRectangleBorder(
//                               borderRadius:
//                               BorderRadius.circular(screenWidth * 0.03)),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.all(screenWidth * 0.02),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: const Color.fromRGBO(0, 31, 63, 1.0),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   child: BigText(
//                                     data: offer['title'],
//                                     screenWidth: screenWidth,
//                                     textColor: Colors.white,
//                                   ),
//                                 ),
//                               ),
//
//                               // TEXT OF PAGE VIEW BUILDER
//                               Expanded(
//                                 child: Row(
//                                   children: [
//                                     Expanded(
//                                       flex: 2,
//                                       child: Padding(
//                                         padding:
//                                         EdgeInsets.all(screenWidth * 0.03),
//                                         child: Column(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment.end,
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           children: [
//                                             Text(offer['restaurant'],
//                                                 style: const TextStyle(
//                                                     color: Color.fromRGBO(
//                                                         0, 31, 63, 1.0),
//                                                     fontSize: 20)),
//                                             SizedBox(
//                                                 height: screenHeight * 0.01),
//                                             Row(
//                                               children: [
//                                                 const Text('⭐ '),
//                                                 // Icon(Icons.star,
//                                                 //     color: const Color.fromRGBO(0, 31, 63, 1.0),
//                                                 //     size: screenWidth * 0.045),
//                                                 Text('${offer['rating']}'),
//                                                 SizedBox(
//                                                     width: screenWidth * 0.02),
//                                                 Text(offer['deliveryTime']),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//
//                                     // IMAGE OF PAGE VIEW BUILDER
//                                     Expanded(
//                                       flex: 2,
//                                       child: Padding(
//                                         padding:
//                                         EdgeInsets.all(screenWidth * 0.03),
//                                         child: ClipRRect(
//                                           borderRadius: BorderRadius.circular(
//                                               screenWidth * 0.03),
//                                           child: Image.asset(offer['image'],
//                                               fit: BoxFit.cover,
//                                               height: screenHeight * 0.3),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//
//                 // PAGE CONSTRUCTOR (USING LIST OF CIRCLES)
//                 Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(_offers.length, (index) {
//                       return Container(
//                         margin: EdgeInsets.symmetric(
//                             horizontal: screenWidth * 0.01),
//                         width: _currentPage == index
//                             ? screenWidth * 0.04
//                             : screenWidth * 0.02,
//                         height: screenHeight * 0.01,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: _currentPage == index
//                               ? Colors.blueAccent
//                               : Colors.grey,
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//
//                 // Restaurant list based on selected food item
//                 ListView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: filteredRestaurants.length,
//                   itemBuilder: (context, index) {
//                     var restaurant = filteredRestaurants[index];
//                     return Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: screenWidth * 0.05,
//                           vertical: screenHeight * 0.01),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   RestaurantMenu(restaurant: restaurant),
//                             ),
//                           );
//                         },
//                         child: Card(
//                           color: const Color.fromRGBO(209, 233, 246, 1.0),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex: 1,
//                                 child: Padding(
//                                   padding: EdgeInsets.all(screenWidth * 0.02),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(
//                                         screenWidth * 0.03),
//                                     child: Image.asset(
//                                       restaurant['image'],
//                                       fit: BoxFit.cover,
//                                       height: screenHeight * 0.15,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 flex: 2,
//                                 child: Padding(
//                                   padding: EdgeInsets.all(screenWidth * 0.03),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         restaurant['name'],
//                                         style: TextStyle(
//                                           fontSize: screenWidth * 0.05,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(Icons.star,
//                                               color: const Color.fromRGBO(
//                                                   100, 32, 170, 1.0),
//                                               size: screenWidth * 0.045),
//                                           Text('${restaurant['rating']}'),
//                                           SizedBox(width: screenWidth * 0.02),
//                                           Text(restaurant['deliveryTime'] ??
//                                               "N/A"),
//                                         ],
//                                       ),
//                                       Text(
//                                         restaurant['description'] ?? '',
//                                         style: TextStyle(
//                                             fontSize: screenWidth * 0.04),
//                                       ),
//                                       Text(
//                                         '${restaurant['city']} - ${restaurant['distance']} away',
//                                         style: TextStyle(
//                                             fontSize: screenWidth * 0.04),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
//
