List<Map<String, dynamic>> offersList = [
  {
    'title': ' FLAT 200/- OFF ',
    'restaurant': 'Sweet Truth',
    'rating': 4.9,
    'deliveryTime': '45 mins',
    'image': 'assets/images/offer-1.jpg'
  },
  {
    'title': ' ITEMS @99 ',
    'restaurant': 'Burger Farm',
    'rating': 4.7,
    'deliveryTime': '25-30 mins',
    'image': 'assets/images/offer-2.jpg'
  },
  {
    'title': ' FLAT 100/- OFF ',
    'restaurant': "Starbucks",
    'rating': 4.4,
    'deliveryTime': '30-35 mins',
    'image': 'assets/images/offer-3.jpg'
  },
];

Map<String, List<Map<String, dynamic>>> restaurants = {
  'Pizza': [
    {
      'name': 'Western Pizza Hub',
      'rating': 4.4,
      'deliveryTime': '60-65 mins',
      'description': 'Pizzas, Italian, Burgers',
      'city': 'Gandhinagar',
      'distance': '13.7 km',
      'image': 'assets/images/pizza-1.jpg',
      'items': [
        {
          'name': 'Cheesy Pizza',
          'description':
              'An indulgent pizza loaded with rich, melted cheese for the ultimate comfort food experience.',
          'price': 109,
          'image': 'assets/images/cheesy-pizza.jpg',
        },
        {
          'name': 'Capsicum Paneer Pizza',
          'description':
              'A delicious fusion of soft paneer, crunchy capsicum, and rich cheese on a crispy crust.',
          'price': 129,
          'image': 'assets/images/capsicum-paneer-pizza.jpg',
        },
        {
          'name': 'Tomato Corn Pizza',
          'description':
              'A delightful blend of juicy tomatoes and sweet corn on a crispy crust.',
          'price': 149,
          'image': 'assets/images/tomato-golden-corn-pizza.jpg',
        },
        {
          'name': 'Onion Capsicum Pizza',
          'description':
              'A flavorful combo of crunchy capsicum and caramelized onions on a cheesy base.',
          'price': 109,
          'image': 'assets/images/onion-capsicum-pizza.jpg',
        },
        {
          'name': 'Veggie Delight Burger',
          'description':
              'A hearty patty made from fresh vegetables, served with lettuce, tomato, and a zesty mayo.',
          'price': 59,
          'image': 'assets/images/veggie-delight-burger.jpg',
        },
        {
          'name': 'Paneer Tikka Burger',
          'description':
              'Grilled paneer cubes marinated in Indian spices, topped with onions and mint chutney.',
          'price': 79,
          'image': 'assets/images/paneer-tikka-burger.jpeg',
        },
      ],
    },
    {
      'name': "Drizzle's Pizza",
      'rating': 4.5,
      'deliveryTime': '40 mins',
      'description': 'Pizzas, Pastas, Fast Food',
      'city': 'Radhe Square',
      'distance': '10.1 km',
      'image': 'assets/images/pizza-2.jpg',
      'items': [
        {
          'name': 'Margherita Pizza',
          'description':
              'Classic margherita pizza with fresh tomatoes, mozzarella, and basil.',
          'price': 99,
          'image': 'assets/images/margherita-pizza.jpg',
        },
        {
          'name': 'Farmhouse Pizza',
          'description':
              'A tasty combination of mushrooms, bell peppers, onions, and tomatoes on a cheesy base.',
          'price': 139,
          'image': 'assets/images/farmhouse-pizza.jpg',
        },
        {
          'name': 'BBQ Paneer Pizza',
          'description':
              'Spicy paneer chunks with BBQ sauce, onions, and a mix of melted cheese.',
          'price': 159,
          'image': 'assets/images/bbq-paneer-pizza.jpg',
        },
        {
          'name': 'Spaghetti',
          'description':
              'Long, thin noodles that pair perfectly with classic tomato or meat sauces.',
          'price': 129,
          'image': 'assets/images/spaghetti.jpg',
        },
        {
          'name': 'Macaroni',
          'description':
              'Small, curved tubes best known for cheesy mac and cheese recipes.',
          'price': 119,
          'image': 'assets/images/macaroni.jpg',
        },
        {
          'name': 'Creamy Alfredo Pasta',
          'description':
              'Noodles tossed in a smooth sauce made with butter, cream, and Parmesan cheese.',
          'price': 139,
          'image': 'assets/images/creamy-alfredo-pasta.jpg',
        },
      ],
    },
    {
      'name': 'Pizza Hut',
      'rating': 4.0,
      'deliveryTime': '50 mins',
      'description': 'Pizzas, Fast Food',
      'city': 'Vastrapur',
      'distance': '8.3 km',
      'image': 'assets/images/pizza-3.jpg',
      'items': [
        {
          'name': 'Pepperoni Pizza',
          'description':
              'Classic pizza topped with spicy pepperoni and mozzarella cheese.',
          'price': 149,
          'image': 'assets/images/pepperoni-pizza.jpg',
        },
        {
          'name': 'Veg Supreme Pizza',
          'description':
              'Loaded with bell peppers, olives, onions, and tomatoes on a cheesy base.',
          'price': 139,
          'image': 'assets/images/Veg-Supreme-Pizza.png',
        },
        {
          'name': 'Mushroom Truffle Pizza',
          'description':
              'A gourmet pizza with truffle oil, mushrooms, and a blend of cheeses.',
          'price': 179,
          'image': 'assets/images/mushroom-truffle-pizza.jpg',
        },
        {
          'name': 'Four Cheese Pizza',
          'description':
              'A pizza topped with mozzarella, cheddar, Parmesan, and blue cheese.',
          'price': 189,
          'image': 'assets/images/four-cheese-pizza.jpg',
        },
        {
          'name': 'French Fries',
          'description': 'Crispy, golden French fries with a side of ketchup.',
          'price': 49,
          'image': 'assets/images/French-fries.jpg',
        },
        {
          'name': 'Cheesy Garlic Bread',
          'description':
              'Warm garlic bread topped with melted cheese and herbs.',
          'price': 59,
          'image': 'assets/images/Cheesy-Garlic-Bread.jpg',
        },
      ],
    },
    {
      'name': 'Papa John\'s Pizza',
      'rating': 4.3,
      'deliveryTime': '45 mins',
      'description': 'Pizzas, Pastas, Italian',
      'city': 'Sarkhej',
      'distance': '12.1 km',
      'image': 'assets/images/pizza-4.jpg',
      'items': [
        {
          'name': 'Margherita Pizza',
          'description':
              'Classic pizza topped with fresh tomatoes, mozzarella, and basil.',
          'price': 129,
          'image': 'assets/images/margherita-pizza.jpg',
        },
        {
          'name': 'BBQ Chicken Pizza',
          'description':
              'Pizza with BBQ chicken, onions, and a blend of mozzarella and cheddar.',
          'price': 159,
          'image': 'assets/images/BBQ-Chicken-Pizza.jpg',
        },
        {
          'name': 'Spinach and Ricotta Pizza',
          'description':
              'A light pizza with spinach, ricotta, and a hint of garlic.',
          'price': 149,
          'image': 'assets/images/Spinach-and-Ricotta-Pizza.jpg',
        },
        {
          'name': 'Creamy Alfredo Pasta',
          'description':
              'Pasta in a rich and creamy Alfredo sauce with Parmesan.',
          'price': 119,
          'image': 'assets/images/creamy-alfredo-pasta.jpg',
        },
        {
          'name': 'Bruschetta',
          'description':
              'Toasted bread topped with a mixture of fresh tomatoes, basil, and olive oil.',
          'price': 69,
          'image': 'assets/images/Bruschetta.jpg',
        },
        {
          'name': 'Caprese Salad',
          'description':
              'Fresh tomatoes, mozzarella, and basil, drizzled with olive oil and balsamic glaze.',
          'price': 89,
          'image': 'assets/images/Caprese-Salad.jpg',
        },
      ],
    },
    {
      'name': 'The Pizza Bakery',
      'rating': 4.7,
      'deliveryTime': '40 mins',
      'description': 'Pizzas, Italian, Desserts',
      'city': 'Bodakdev',
      'distance': '15.2 km',
      'image': 'assets/images/pizza-5.jpg',
      'items': [
        {
          'name': 'Pepperoni Pizza',
          'description':
              'Classic pizza topped with pepperoni, mozzarella, and tomato sauce.',
          'price': 139,
          'image': 'assets/images/pepperoni-pizza.jpg',
        },
        {
          'name': 'Four Cheese Pizza',
          'description':
              'A rich blend of mozzarella, cheddar, Parmesan, and blue cheese on a crispy crust.',
          'price': 159,
          'image': 'assets/images/four-cheese-pizza.jpg',
        },
        {
          'name': 'Chocolate Lava Cake',
          'description':
              'Warm chocolate cake with a gooey molten center, served with vanilla ice cream.',
          'price': 89,
          'image': 'assets/images/Chocolate-Lava-Cake.jpg',
        },
        {
          'name': 'Cheesecake',
          'description':
              'Creamy cheesecake with a graham cracker crust and a hint of lemon.',
          'price': 99,
          'image': 'assets/images/cheesecake.jpg',
        },
        {
          'name': 'Vegetarian Pizza',
          'description':
              'Loaded with bell peppers, olives, mushrooms, and onions on a cheesy base.',
          'price': 149,
          'image': 'assets/images/Veg-Supreme-Pizza.png',
        },
        {
          'name': 'Tiramisu',
          'description':
              'Classic Italian dessert with layers of coffee-soaked ladyfingers and mascarpone.',
          'price': 109,
          'image': 'assets/images/tiramisu.jpg',
        },
      ],
    },
  ],
  'Burger': [
    {
      'name': 'Burger Farm',
      'rating': 4.7,
      'deliveryTime': '25-30 mins',
      'description': 'Burgers, Fast Food',
      'city': 'Downtown',
      'distance': '5.2 km',
      'image': 'assets/images/burger-1.jpg',
      'items': [
        {
          'name': 'Classic Veggie Burger',
          'description':
              'A timeless veggie burger with a wholesome patty, crisp lettuce, tomato, and creamy mayo.',
          'price': 69,
          'image': 'assets/images/veggie-delight-burger.jpg',
        },
        {
          'name': 'Spicy Bean Burger',
          'description':
              'A zesty black bean patty paired with jalapeños, spicy sauce, and fresh veggies.',
          'price': 79,
          'image': 'assets/images/spicy-bean-burger.jpg',
        },
        {
          'name': 'Cheese Burst Burger',
          'description':
              'A juicy patty smothered in gooey, melted cheese with crisp lettuce and tangy sauce.',
          'price': 89,
          'image': 'assets/images/cheese-burst-burger.jpg',
        },
        {
          'name': 'Crispy Potato Burger',
          'description':
              'Golden-fried potato patty topped with fresh veggies and a creamy, flavorful sauce.',
          'price': 59,
          'image': 'assets/images/crispy-potato-burger.jpg',
        },
        {
          'name': 'Mushroom Melt Burger',
          'description':
              'A savory patty with sautéed mushrooms, melted cheese, and garlic aioli on a soft bun.',
          'price': 99,
          'image': 'assets/images/mushroom-melt-burger.jpg',
        },
        {
          'name': 'Peri-Peri Paneer Burger',
          'description':
              'Spicy grilled paneer with peri-peri sauce, crunchy veggies, and a soft bun.',
          'price': 109,
          'image': 'assets/images/paneer-tikka-burger.jpeg',
        },
      ],
    },
    {
      'name': 'Burger King',
      'rating': 4.6,
      'deliveryTime': '20-25 mins',
      'description': 'Burgers, American',
      'city': 'City Square',
      'distance': '7.8 km',
      'image': 'assets/images/burger-2.jpg',
      'items': [
        {
          'name': 'Classic Veggie Burger',
          'description':
              'A timeless veggie burger with a wholesome patty, crisp lettuce, tomato, and creamy mayo.',
          'price': 69,
          'image': 'assets/images/veggie-delight-burger.jpg',
        },
        {
          'name': 'Spicy Bean Burger',
          'description':
              'A zesty black bean patty paired with jalapeños, spicy sauce, and fresh veggies.',
          'price': 79,
          'image': 'assets/images/spicy-bean-burger.jpg',
        },
        {
          'name': 'Cheese Burst Burger',
          'description':
              'A juicy patty smothered in gooey, melted cheese with crisp lettuce and tangy sauce.',
          'price': 89,
          'image': 'assets/images/cheese-burst-burger.jpg',
        },
        {
          'name': 'Crispy Potato Burger',
          'description':
              'Golden-fried potato patty topped with fresh veggies and a creamy, flavorful sauce.',
          'price': 59,
          'image': 'assets/images/crispy-potato-burger.jpg',
        },
        {
          'name': 'Mushroom Melt Burger',
          'description':
              'A savory patty with sautéed mushrooms, melted cheese, and garlic aioli on a soft bun.',
          'price': 99,
          'image': 'assets/images/mushroom-melt-burger.jpg',
        },
        {
          'name': 'Peri-Peri Paneer Burger',
          'description':
              'Spicy grilled paneer with peri-peri sauce, crunchy veggies, and a soft bun.',
          'price': 109,
          'image': 'assets/images/paneer-tikka-burger.jpeg',
        },
      ],
    },
    {
      'name': 'Shake Shack',
      'rating': 4.3,
      'deliveryTime': '35-40 mins',
      'description': 'Burgers, Shakes, Fast Food',
      'city': 'MG Road',
      'distance': '6.5 km',
      'image': 'assets/images/burger-3.jpg',
      'items': [
        {
          'name': 'Classic Veggie Burger',
          'description':
              'A timeless veggie burger with a wholesome patty, crisp lettuce, tomato, and creamy mayo.',
          'price': 69,
          'image': 'assets/images/veggie-delight-burger.jpg',
        },
        {
          'name': 'Spicy Bean Burger',
          'description':
              'A zesty black bean patty paired with jalapeños, spicy sauce, and fresh veggies.',
          'price': 79,
          'image': 'assets/images/spicy-bean-burger.jpg',
        },
        {
          'name': 'Cheese Burst Burger',
          'description':
              'A juicy patty smothered in gooey, melted cheese with crisp lettuce and tangy sauce.',
          'price': 89,
          'image': 'assets/images/cheese-burst-burger.jpg',
        },
        {
          'name': 'Crispy Potato Burger',
          'description':
              'Golden-fried potato patty topped with fresh veggies and a creamy, flavorful sauce.',
          'price': 59,
          'image': 'assets/images/crispy-potato-burger.jpg',
        },
        {
          'name': 'Mushroom Melt Burger',
          'description':
              'A savory patty with sautéed mushrooms, melted cheese, and garlic aioli on a soft bun.',
          'price': 99,
          'image': 'assets/images/mushroom-melt-burger.jpg',
        },
        {
          'name': 'Peri-Peri Paneer Burger',
          'description':
              'Spicy grilled paneer with peri-peri sauce, crunchy veggies, and a soft bun.',
          'price': 109,
          'image': 'assets/images/paneer-tikka-burger.jpeg',
        },
      ],
    },
    {
      'name': 'Five Guys',
      'rating': 4.4,
      'deliveryTime': '20-25 mins',
      'description': 'Burgers, Fast Food, Fries',
      'city': 'C.G. Road',
      'distance': '9.4 km',
      'image': 'assets/images/burger-4.jpg',
      'items': [
        {
          'name': 'Classic Veggie Burger',
          'description':
              'A timeless veggie burger with a wholesome patty, crisp lettuce, tomato, and creamy mayo.',
          'price': 69,
          'image': 'assets/images/veggie-delight-burger.jpg',
        },
        {
          'name': 'Spicy Bean Burger',
          'description':
              'A zesty black bean patty paired with jalapeños, spicy sauce, and fresh veggies.',
          'price': 79,
          'image': 'assets/images/spicy-bean-burger.jpg',
        },
        {
          'name': 'Cheese Burst Burger',
          'description':
              'A juicy patty smothered in gooey, melted cheese with crisp lettuce and tangy sauce.',
          'price': 89,
          'image': 'assets/images/cheese-burst-burger.jpg',
        },
        {
          'name': 'Crispy Potato Burger',
          'description':
              'Golden-fried potato patty topped with fresh veggies and a creamy, flavorful sauce.',
          'price': 59,
          'image': 'assets/images/crispy-potato-burger.jpg',
        },
        {
          'name': 'Mushroom Melt Burger',
          'description':
              'A savory patty with sautéed mushrooms, melted cheese, and garlic aioli on a soft bun.',
          'price': 99,
          'image': 'assets/images/mushroom-melt-burger.jpg',
        },
        {
          'name': 'Peri-Peri Paneer Burger',
          'description':
              'Spicy grilled paneer with peri-peri sauce, crunchy veggies, and a soft bun.',
          'price': 109,
          'image': 'assets/images/paneer-tikka-burger.jpeg',
        },
      ],
    },
    {
      'name': 'Smashburger',
      'rating': 4.2,
      'deliveryTime': '30-35 mins',
      'description': 'Burgers, Fries, Fast Food',
      'city': 'Navrangpura',
      'distance': '12.0 km',
      'image': 'assets/images/burger-5.jpg',
      'items': [
        {
          'name': 'Classic Veggie Burger',
          'description':
              'A timeless veggie burger with a wholesome patty, crisp lettuce, tomato, and creamy mayo.',
          'price': 69,
          'image': 'assets/images/veggie-delight-burger.jpg',
        },
        {
          'name': 'Spicy Bean Burger',
          'description':
              'A zesty black bean patty paired with jalapeños, spicy sauce, and fresh veggies.',
          'price': 79,
          'image': 'assets/images/spicy-bean-burger.jpg',
        },
        {
          'name': 'Cheese Burst Burger',
          'description':
              'A juicy patty smothered in gooey, melted cheese with crisp lettuce and tangy sauce.',
          'price': 89,
          'image': 'assets/images/cheese-burst-burger.jpg',
        },
        {
          'name': 'Crispy Potato Burger',
          'description':
              'Golden-fried potato patty topped with fresh veggies and a creamy, flavorful sauce.',
          'price': 59,
          'image': 'assets/images/crispy-potato-burger.jpg',
        },
        {
          'name': 'Mushroom Melt Burger',
          'description':
              'A savory patty with sautéed mushrooms, melted cheese, and garlic aioli on a soft bun.',
          'price': 99,
          'image': 'assets/images/mushroom-melt-burger.jpg',
        },
        {
          'name': 'Peri-Peri Paneer Burger',
          'description':
              'Spicy grilled paneer with peri-peri sauce, crunchy veggies, and a soft bun.',
          'price': 109,
          'image': 'assets/images/paneer-tikka-burger.jpeg',
        },
      ],
    },
    // More burger restaurants
  ],
  'Sushi': [
    {
      'name': 'Sushi World',
      'rating': 4.8,
      'deliveryTime': '45 min',
      'description': 'Japanese, Sushi, Fish',
      'city': 'City Center',
      'distance': '3.5 km',
      'image': 'assets/images/sushi-1.jpg',
      'items': [
        {
          'name': 'California Roll',
          'description':
              'A refreshing sushi roll filled with crab sticks, creamy avocado, and crunchy cucumber.',
          'price': 199,
          'image': 'assets/images/california-roll.jpg',
        },
        {
          'name': 'Spicy Tuna Roll',
          'description':
              'A fiery delight with fresh tuna, spicy mayo, and a hint of sesame seeds.',
          'price': 249,
          'image': 'assets/images/spicy-tuna-roll.jpg',
        },
        {
          'name': 'Vegetable Sushi Roll',
          'description':
              'A medley of fresh veggies wrapped in sushi rice and seaweed for a healthy treat.',
          'price': 179,
          'image': 'assets/images/vegetable-sushi-roll.jpg',
        },
        {
          'name': 'Salmon Nigiri',
          'description':
              'Delicate slices of fresh salmon over seasoned sushi rice for a classic experience.',
          'price': 299,
          'image': 'assets/images/salmon-nigiri.jpg',
        },
        {
          'name': 'Avocado Maki',
          'description':
              'Simple yet delicious sushi rolls with creamy avocado wrapped in seaweed and rice.',
          'price': 189,
          'image': 'assets/images/avocado-maki.jpg',
        },
        {
          'name': 'Tempura Shrimp Roll',
          'description':
              'Crispy shrimp tempura wrapped in sushi rice and nori, served with a tangy dipping sauce.',
          'price': 269,
          'image': 'assets/images/tempura-shrimp-roll.jpg',
        },
      ],
    },
    {
      'name': 'Sushi Bar',
      'rating': 4.6,
      'deliveryTime': '35 min',
      'description': 'Japanese, Sushi',
      'city': 'Downtown',
      'distance': '2.9 km',
      'image': 'assets/images/sushi-2.jpg',
      'items': [
        {
          'name': 'California Roll',
          'description':
              'A refreshing sushi roll filled with crab sticks, creamy avocado, and crunchy cucumber.',
          'price': 199,
          'image': 'assets/images/california-roll.jpg',
        },
        {
          'name': 'Spicy Tuna Roll',
          'description':
              'A fiery delight with fresh tuna, spicy mayo, and a hint of sesame seeds.',
          'price': 249,
          'image': 'assets/images/spicy-tuna-roll.jpg',
        },
        {
          'name': 'Vegetable Sushi Roll',
          'description':
              'A medley of fresh veggies wrapped in sushi rice and seaweed for a healthy treat.',
          'price': 179,
          'image': 'assets/images/vegetable-sushi-roll.jpg',
        },
        {
          'name': 'Salmon Nigiri',
          'description':
              'Delicate slices of fresh salmon over seasoned sushi rice for a classic experience.',
          'price': 299,
          'image': 'assets/images/salmon-nigiri.jpg',
        },
        {
          'name': 'Avocado Maki',
          'description':
              'Simple yet delicious sushi rolls with creamy avocado wrapped in seaweed and rice.',
          'price': 189,
          'image': 'assets/images/avocado-maki.jpg',
        },
        {
          'name': 'Tempura Shrimp Roll',
          'description':
              'Crispy shrimp tempura wrapped in sushi rice and nori, served with a tangy dipping sauce.',
          'price': 269,
          'image': 'assets/images/tempura-shrimp-roll.jpg',
        },
      ],
    },
    {
      'name': 'Sakura Sushi',
      'rating': 4.7,
      'deliveryTime': '30 min',
      'description': 'Japanese, Sushi, Seafood',
      'city': 'Harborview',
      'distance': '1.3 km',
      'image': 'assets/images/sushi-3.jpg',
      'items': [
        {
          'name': 'California Roll',
          'description':
              'A refreshing sushi roll filled with crab sticks, creamy avocado, and crunchy cucumber.',
          'price': 199,
          'image': 'assets/images/california-roll.jpg',
        },
        {
          'name': 'Spicy Tuna Roll',
          'description':
              'A fiery delight with fresh tuna, spicy mayo, and a hint of sesame seeds.',
          'price': 249,
          'image': 'assets/images/spicy-tuna-roll.jpg',
        },
        {
          'name': 'Vegetable Sushi Roll',
          'description':
              'A medley of fresh veggies wrapped in sushi rice and seaweed for a healthy treat.',
          'price': 179,
          'image': 'assets/images/vegetable-sushi-roll.jpg',
        },
        {
          'name': 'Salmon Nigiri',
          'description':
              'Delicate slices of fresh salmon over seasoned sushi rice for a classic experience.',
          'price': 299,
          'image': 'assets/images/salmon-nigiri.jpg',
        },
        {
          'name': 'Avocado Maki',
          'description':
              'Simple yet delicious sushi rolls with creamy avocado wrapped in seaweed and rice.',
          'price': 189,
          'image': 'assets/images/avocado-maki.jpg',
        },
        {
          'name': 'Tempura Shrimp Roll',
          'description':
              'Crispy shrimp tempura wrapped in sushi rice and nori, served with a tangy dipping sauce.',
          'price': 269,
          'image': 'assets/images/tempura-shrimp-roll.jpg',
        },
      ],
    },
    {
      'name': 'Sushiko',
      'rating': 4.4,
      'deliveryTime': '25 min',
      'description': 'Sushi, Japanese Cuisine',
      'city': 'East End',
      'distance': '2.4 km',
      'image': 'assets/images/sushi-4.jpg',
      'items': [
        {
          'name': 'California Roll',
          'description':
              'A refreshing sushi roll filled with crab sticks, creamy avocado, and crunchy cucumber.',
          'price': 199,
          'image': 'assets/images/california-roll.jpg',
        },
        {
          'name': 'Spicy Tuna Roll',
          'description':
              'A fiery delight with fresh tuna, spicy mayo, and a hint of sesame seeds.',
          'price': 249,
          'image': 'assets/images/spicy-tuna-roll.jpg',
        },
        {
          'name': 'Vegetable Sushi Roll',
          'description':
              'A medley of fresh veggies wrapped in sushi rice and seaweed for a healthy treat.',
          'price': 179,
          'image': 'assets/images/vegetable-sushi-roll.jpg',
        },
        {
          'name': 'Salmon Nigiri',
          'description':
              'Delicate slices of fresh salmon over seasoned sushi rice for a classic experience.',
          'price': 299,
          'image': 'assets/images/salmon-nigiri.jpg',
        },
        {
          'name': 'Avocado Maki',
          'description':
              'Simple yet delicious sushi rolls with creamy avocado wrapped in seaweed and rice.',
          'price': 189,
          'image': 'assets/images/avocado-maki.jpg',
        },
        {
          'name': 'Tempura Shrimp Roll',
          'description':
              'Crispy shrimp tempura wrapped in sushi rice and nori, served with a tangy dipping sauce.',
          'price': 269,
          'image': 'assets/images/tempura-shrimp-roll.jpg',
        },
      ],
    },
    {
      'name': 'Wasabi Sushi',
      'rating': 4.3,
      'deliveryTime': '40 min',
      'description': 'Sushi, Asian, Seafood',
      'city': 'West Side',
      'distance': '3.0 km',
      'image': 'assets/images/sushi-5.jpg',
      'items': [
        {
          'name': 'California Roll',
          'description':
              'A refreshing sushi roll filled with crab sticks, creamy avocado, and crunchy cucumber.',
          'price': 199,
          'image': 'assets/images/california-roll.jpg',
        },
        {
          'name': 'Spicy Tuna Roll',
          'description':
              'A fiery delight with fresh tuna, spicy mayo, and a hint of sesame seeds.',
          'price': 249,
          'image': 'assets/images/spicy-tuna-roll.jpg',
        },
        {
          'name': 'Vegetable Sushi Roll',
          'description':
              'A medley of fresh veggies wrapped in sushi rice and seaweed for a healthy treat.',
          'price': 179,
          'image': 'assets/images/vegetable-sushi-roll.jpg',
        },
        {
          'name': 'Salmon Nigiri',
          'description':
              'Delicate slices of fresh salmon over seasoned sushi rice for a classic experience.',
          'price': 299,
          'image': 'assets/images/salmon-nigiri.jpg',
        },
        {
          'name': 'Avocado Maki',
          'description':
              'Simple yet delicious sushi rolls with creamy avocado wrapped in seaweed and rice.',
          'price': 189,
          'image': 'assets/images/avocado-maki.jpg',
        },
        {
          'name': 'Tempura Shrimp Roll',
          'description':
              'Crispy shrimp tempura wrapped in sushi rice and nori, served with a tangy dipping sauce.',
          'price': 269,
          'image': 'assets/images/tempura-shrimp-roll.jpg',
        },
      ],
    },
  ],
  'Pasta': [
    {
      'name': 'Pasta House',
      'rating': 4.3,
      'deliveryTime': '35 min',
      'description': 'Italian, Pasta, European',
      'city': 'North Park',
      'distance': '1.8 km',
      'image': 'assets/images/pasta-1.jpg',
      'items': [
        {
          'name': 'Classic Spaghetti Bolognese',
          'description':
              'A hearty Italian classic with rich tomato sauce, ground meat, and perfectly cooked spaghetti.',
          'price': 249,
          'image': 'assets/images/spaghetti-bolognese.jpg',
        },
        {
          'name': 'Creamy Alfredo Pasta',
          'description':
              'Smooth and creamy Alfredo sauce tossed with fettuccine, topped with parmesan cheese.',
          'price': 259,
          'image': 'assets/images/creamy-alfredo-pasta.jpg',
        },
        {
          'name': 'Penne Arrabbiata',
          'description':
              'Spicy tomato sauce with garlic and chili flakes coating penne pasta for a fiery kick.',
          'price': 219,
          'image': 'assets/images/penne-arrabbiata.jpg',
        },
        {
          'name': 'Vegetable Primavera',
          'description':
              'A colorful mix of fresh vegetables sautéed with garlic and olive oil, served with penne.',
          'price': 199,
          'image': 'assets/images/vegetable-primavera.jpg',
        },
        {
          'name': 'Four Cheese Pasta',
          'description':
              'A decadent pasta dish loaded with a blend of four cheeses for an indulgent experience.',
          'price': 279,
          'image': 'assets/images/four-cheese-pasta.jpg',
        },
        {
          'name': 'Pesto Pasta',
          'description':
              'Fresh basil pesto, garlic, olive oil, and parmesan mixed with al dente pasta for a refreshing taste.',
          'price': 239,
          'image': 'assets/images/pesto-pasta.jpg',
        },
      ],
    },
    {
      'name': 'Italiano’s',
      'rating': 4.5,
      'deliveryTime': '28 min',
      'description': 'Italian, Pasta, Pizza',
      'city': 'Old Town',
      'distance': '2.4 km',
      'image': 'assets/images/pasta-2.jpg',
      'items': [
        {
          'name': 'Classic Spaghetti Bolognese',
          'description':
              'A hearty Italian classic with rich tomato sauce, ground meat, and perfectly cooked spaghetti.',
          'price': 249,
          'image': 'assets/images/spaghetti-bolognese.jpg',
        },
        {
          'name': 'Creamy Alfredo Pasta',
          'description':
              'Smooth and creamy Alfredo sauce tossed with fettuccine, topped with parmesan cheese.',
          'price': 259,
          'image': 'assets/images/creamy-alfredo-pasta.jpg',
        },
        {
          'name': 'Penne Arrabbiata',
          'description':
              'Spicy tomato sauce with garlic and chili flakes coating penne pasta for a fiery kick.',
          'price': 219,
          'image': 'assets/images/penne-arrabbiata.jpg',
        },
        {
          'name': 'Vegetable Primavera',
          'description':
              'A colorful mix of fresh vegetables sautéed with garlic and olive oil, served with penne.',
          'price': 199,
          'image': 'assets/images/vegetable-primavera.jpg',
        },
        {
          'name': 'Four Cheese Pasta',
          'description':
              'A decadent pasta dish loaded with a blend of four cheeses for an indulgent experience.',
          'price': 279,
          'image': 'assets/images/four-cheese-pasta.jpg',
        },
        {
          'name': 'Pesto Pasta',
          'description':
              'Fresh basil pesto, garlic, olive oil, and parmesan mixed with al dente pasta for a refreshing taste.',
          'price': 239,
          'image': 'assets/images/pesto-pasta.jpg',
        },
      ],
    },
    {
      'name': 'Spaghetti Junction',
      'rating': 4.2,
      'deliveryTime': '20 min',
      'description': 'Italian, Spaghetti, Pasta',
      'city': 'South Side',
      'distance': '1.5 km',
      'image': 'assets/images/pasta-3.jpg',
      'items': [
        {
          'name': 'Classic Spaghetti Bolognese',
          'description':
              'A hearty Italian classic with rich tomato sauce, ground meat, and perfectly cooked spaghetti.',
          'price': 249,
          'image': 'assets/images/spaghetti-bolognese.jpg',
        },
        {
          'name': 'Creamy Alfredo Pasta',
          'description':
              'Smooth and creamy Alfredo sauce tossed with fettuccine, topped with parmesan cheese.',
          'price': 259,
          'image': 'assets/images/creamy-alfredo-pasta.jpg',
        },
        {
          'name': 'Penne Arrabbiata',
          'description':
              'Spicy tomato sauce with garlic and chili flakes coating penne pasta for a fiery kick.',
          'price': 219,
          'image': 'assets/images/penne-arrabbiata.jpg',
        },
        {
          'name': 'Vegetable Primavera',
          'description':
              'A colorful mix of fresh vegetables sautéed with garlic and olive oil, served with penne.',
          'price': 199,
          'image': 'assets/images/vegetable-primavera.jpg',
        },
        {
          'name': 'Four Cheese Pasta',
          'description':
              'A decadent pasta dish loaded with a blend of four cheeses for an indulgent experience.',
          'price': 279,
          'image': 'assets/images/four-cheese-pasta.jpg',
        },
        {
          'name': 'Pesto Pasta',
          'description':
              'Fresh basil pesto, garlic, olive oil, and parmesan mixed with al dente pasta for a refreshing taste.',
          'price': 239,
          'image': 'assets/images/pesto-pasta.jpg',
        },
      ],
    },
    {
      'name': 'Pasta Express',
      'rating': 4.6,
      'deliveryTime': '30 min',
      'description': 'Italian, Pasta, Fast Food',
      'city': 'Central Plaza',
      'distance': '2.3 km',
      'image': 'assets/images/pasta-4.jpg',
      'items': [
        {
          'name': 'Classic Spaghetti Bolognese',
          'description':
              'A hearty Italian classic with rich tomato sauce, ground meat, and perfectly cooked spaghetti.',
          'price': 249,
          'image': 'assets/images/spaghetti-bolognese.jpg',
        },
        {
          'name': 'Creamy Alfredo Pasta',
          'description':
              'Smooth and creamy Alfredo sauce tossed with fettuccine, topped with parmesan cheese.',
          'price': 259,
          'image': 'assets/images/creamy-alfredo-pasta.jpg',
        },
        {
          'name': 'Penne Arrabbiata',
          'description':
              'Spicy tomato sauce with garlic and chili flakes coating penne pasta for a fiery kick.',
          'price': 219,
          'image': 'assets/images/penne-arrabbiata.jpg',
        },
        {
          'name': 'Vegetable Primavera',
          'description':
              'A colorful mix of fresh vegetables sautéed with garlic and olive oil, served with penne.',
          'price': 199,
          'image': 'assets/images/vegetable-primavera.jpg',
        },
        {
          'name': 'Four Cheese Pasta',
          'description':
              'A decadent pasta dish loaded with a blend of four cheeses for an indulgent experience.',
          'price': 279,
          'image': 'assets/images/four-cheese-pasta.jpg',
        },
        {
          'name': 'Pesto Pasta',
          'description':
              'Fresh basil pesto, garlic, olive oil, and parmesan mixed with al dente pasta for a refreshing taste.',
          'price': 239,
          'image': 'assets/images/pesto-pasta.jpg',
        },
      ],
    },
    {
      'name': 'The Pasta Factory',
      'rating': 4.4,
      'deliveryTime': '25 min',
      'description': 'Italian, Pasta, Gourmet',
      'city': 'Greenwood',
      'distance': '2.1 km',
      'image': 'assets/images/pasta-5.jpg',
      'items': [
        {
          'name': 'Classic Spaghetti Bolognese',
          'description':
              'A hearty Italian classic with rich tomato sauce, ground meat, and perfectly cooked spaghetti.',
          'price': 249,
          'image': 'assets/images/spaghetti-bolognese.jpg',
        },
        {
          'name': 'Creamy Alfredo Pasta',
          'description':
              'Smooth and creamy Alfredo sauce tossed with fettuccine, topped with parmesan cheese.',
          'price': 259,
          'image': 'assets/images/creamy-alfredo-pasta.jpg',
        },
        {
          'name': 'Penne Arrabbiata',
          'description':
              'Spicy tomato sauce with garlic and chili flakes coating penne pasta for a fiery kick.',
          'price': 219,
          'image': 'assets/images/penne-arrabbiata.jpg',
        },
        {
          'name': 'Vegetable Primavera',
          'description':
              'A colorful mix of fresh vegetables sautéed with garlic and olive oil, served with penne.',
          'price': 199,
          'image': 'assets/images/vegetable-primavera.jpg',
        },
        {
          'name': 'Four Cheese Pasta',
          'description':
              'A decadent pasta dish loaded with a blend of four cheeses for an indulgent experience.',
          'price': 279,
          'image': 'assets/images/four-cheese-pasta.jpg',
        },
        {
          'name': 'Pesto Pasta',
          'description':
              'Fresh basil pesto, garlic, olive oil, and parmesan mixed with al dente pasta for a refreshing taste.',
          'price': 239,
          'image': 'assets/images/pesto-pasta.jpg',
        },
      ],
    },
  ],
  'Desserts': [
    {
      'name': 'Sweet Treats',
      'rating': 4.9,
      'deliveryTime': '25 min',
      'description': 'Desserts, Cakes, Pastries',
      'city': 'West End',
      'distance': '2.3 km',
      'image': 'assets/images/desserts-1.jpg',
      'items': [
        {
          'name': 'Chocolate Lava Cake',
          'description':
              'A warm, gooey chocolate cake with a molten chocolate center, served with vanilla ice cream.',
          'price': 159,
          'image': 'assets/images/Chocolate-Lava-Cake.jpg',
        },
        {
          'name': 'Tiramisu',
          'description':
              'A classic Italian dessert with layers of mascarpone, coffee-soaked sponge, and cocoa.',
          'price': 199,
          'image': 'assets/images/tiramisu.jpg',
        },
        {
          'name': 'Cheesecake',
          'description':
              'A creamy and rich baked cheesecake with a buttery graham cracker crust.',
          'price': 179,
          'image': 'assets/images/cheesecake.jpg',
        },
        {
          'name': 'Brownie Sundae',
          'description':
              'A fudgy brownie topped with ice cream, hot fudge, whipped cream, and a cherry.',
          'price': 149,
          'image': 'assets/images/brownie-sundae.jpg',
        },
        {
          'name': 'Gulab Jamun',
          'description':
              'Soft and spongy milk-solid dumplings soaked in a fragrant sugar syrup.',
          'price': 99,
          'image': 'assets/images/gulab-jamun.jpg',
        },
        {
          'name': 'Fruit Trifle',
          'description':
              'Layers of sponge cake, custard, whipped cream, and fresh fruits for a refreshing treat.',
          'price': 129,
          'image': 'assets/images/fruit-trifle.jpg',
        },
      ],
    },
    {
      'name': 'Sugar Rush',
      'rating': 4.6,
      'deliveryTime': '20 min',
      'description': 'Desserts, Candy, Ice Cream',
      'city': 'Downtown',
      'distance': '3.1 km',
      'image': 'assets/images/desserts-2.jpg',
      'items': [
        {
          'name': 'Chocolate Lava Cake',
          'description':
              'A warm, gooey chocolate cake with a molten chocolate center, served with vanilla ice cream.',
          'price': 159,
          'image': 'assets/images/Chocolate-Lava-Cake.jpg',
        },
        {
          'name': 'Tiramisu',
          'description':
              'A classic Italian dessert with layers of mascarpone, coffee-soaked sponge, and cocoa.',
          'price': 199,
          'image': 'assets/images/tiramisu.jpg',
        },
        {
          'name': 'Cheesecake',
          'description':
              'A creamy and rich baked cheesecake with a buttery graham cracker crust.',
          'price': 179,
          'image': 'assets/images/cheesecake.jpg',
        },
        {
          'name': 'Brownie Sundae',
          'description':
              'A fudgy brownie topped with ice cream, hot fudge, whipped cream, and a cherry.',
          'price': 149,
          'image': 'assets/images/brownie-sundae.jpg',
        },
        {
          'name': 'Gulab Jamun',
          'description':
              'Soft and spongy milk-solid dumplings soaked in a fragrant sugar syrup.',
          'price': 99,
          'image': 'assets/images/gulab-jamun.jpg',
        },
        {
          'name': 'Fruit Trifle',
          'description':
              'Layers of sponge cake, custard, whipped cream, and fresh fruits for a refreshing treat.',
          'price': 129,
          'image': 'assets/images/fruit-trifle.jpg',
        },
      ],
    },
    {
      'name': 'Choco Delight',
      'rating': 4.7,
      'deliveryTime': '30 min',
      'description': 'Chocolate, Desserts, Sweet',
      'city': 'East Side',
      'distance': '1.8 km',
      'image': 'assets/images/desserts-3.jpg',
      'items': [
        {
          'name': 'Chocolate Lava Cake',
          'description':
              'A warm, gooey chocolate cake with a molten chocolate center, served with vanilla ice cream.',
          'price': 159,
          'image': 'assets/images/Chocolate-Lava-Cake.jpg',
        },
        {
          'name': 'Tiramisu',
          'description':
              'A classic Italian dessert with layers of mascarpone, coffee-soaked sponge, and cocoa.',
          'price': 199,
          'image': 'assets/images/tiramisu.jpg',
        },
        {
          'name': 'Cheesecake',
          'description':
              'A creamy and rich baked cheesecake with a buttery graham cracker crust.',
          'price': 179,
          'image': 'assets/images/cheesecake.jpg',
        },
        {
          'name': 'Brownie Sundae',
          'description':
              'A fudgy brownie topped with ice cream, hot fudge, whipped cream, and a cherry.',
          'price': 149,
          'image': 'assets/images/brownie-sundae.jpg',
        },
        {
          'name': 'Gulab Jamun',
          'description':
              'Soft and spongy milk-solid dumplings soaked in a fragrant sugar syrup.',
          'price': 99,
          'image': 'assets/images/gulab-jamun.jpg',
        },
        {
          'name': 'Fruit Trifle',
          'description':
              'Layers of sponge cake, custard, whipped cream, and fresh fruits for a refreshing treat.',
          'price': 129,
          'image': 'assets/images/fruit-trifle.jpg',
        },
      ],
    },
    {
      'name': 'Cupcake Haven',
      'rating': 4.5,
      'deliveryTime': '18 min',
      'description': 'Cupcakes, Desserts, Pastries',
      'city': 'Uptown',
      'distance': '2.0 km',
      'image': 'assets/images/desserts-4.jpg',
      'items': [
        {
          'name': 'Chocolate Lava Cake',
          'description':
              'A warm, gooey chocolate cake with a molten chocolate center, served with vanilla ice cream.',
          'price': 159,
          'image': 'assets/images/Chocolate-Lava-Cake.jpg',
        },
        {
          'name': 'Tiramisu',
          'description':
              'A classic Italian dessert with layers of mascarpone, coffee-soaked sponge, and cocoa.',
          'price': 199,
          'image': 'assets/images/tiramisu.jpg',
        },
        {
          'name': 'Cheesecake',
          'description':
              'A creamy and rich baked cheesecake with a buttery graham cracker crust.',
          'price': 179,
          'image': 'assets/images/cheesecake.jpg',
        },
        {
          'name': 'Brownie Sundae',
          'description':
              'A fudgy brownie topped with ice cream, hot fudge, whipped cream, and a cherry.',
          'price': 149,
          'image': 'assets/images/brownie-sundae.jpg',
        },
        {
          'name': 'Gulab Jamun',
          'description':
              'Soft and spongy milk-solid dumplings soaked in a fragrant sugar syrup.',
          'price': 99,
          'image': 'assets/images/gulab-jamun.jpg',
        },
        {
          'name': 'Fruit Trifle',
          'description':
              'Layers of sponge cake, custard, whipped cream, and fresh fruits for a refreshing treat.',
          'price': 129,
          'image': 'assets/images/fruit-trifle.jpg',
        },
      ],
    },
    {
      'name': 'Delicious Delights',
      'rating': 4.8,
      'deliveryTime': '35 min',
      'description': 'Cakes, Cupcakes, Desserts',
      'city': 'South Park',
      'distance': '3.0 km',
      'image': 'assets/images/desserts-5.jpg',
      'items': [
        {
          'name': 'Chocolate Lava Cake',
          'description':
              'A warm, gooey chocolate cake with a molten chocolate center, served with vanilla ice cream.',
          'price': 159,
          'image': 'assets/images/Chocolate-Lava-Cake.jpg',
        },
        {
          'name': 'Tiramisu',
          'description':
              'A classic Italian dessert with layers of mascarpone, coffee-soaked sponge, and cocoa.',
          'price': 199,
          'image': 'assets/images/tiramisu.jpg',
        },
        {
          'name': 'Cheesecake',
          'description':
              'A creamy and rich baked cheesecake with a buttery graham cracker crust.',
          'price': 179,
          'image': 'assets/images/cheesecake.jpg',
        },
        {
          'name': 'Brownie Sundae',
          'description':
              'A fudgy brownie topped with ice cream, hot fudge, whipped cream, and a cherry.',
          'price': 149,
          'image': 'assets/images/brownie-sundae.jpg',
        },
        {
          'name': 'Gulab Jamun',
          'description':
              'Soft and spongy milk-solid dumplings soaked in a fragrant sugar syrup.',
          'price': 99,
          'image': 'assets/images/gulab-jamun.jpg',
        },
        {
          'name': 'Fruit Trifle',
          'description':
              'Layers of sponge cake, custard, whipped cream, and fresh fruits for a refreshing treat.',
          'price': 129,
          'image': 'assets/images/fruit-trifle.jpg',
        },
      ],
    },
  ],
  'Drinks': [
    {
      'name': 'Juice Bar',
      'rating': 4.0,
      'deliveryTime': '15 min',
      'description': 'Juices, Smoothies, Health Drinks',
      'city': 'City Center',
      'distance': '0.8 km',
      'image': 'assets/images/drinks-1.jpg',
      'items': [
        {
          'name': 'Lemon Iced Tea',
          'description':
              'A refreshing blend of tea and lemon juice served chilled over ice.',
          'price': 79,
          'image': 'assets/images/lemon-iced-tea.jpg',
        },
        {
          'name': 'Mango Smoothie',
          'description':
              'A creamy and tropical mango smoothie made with ripe mangoes and yogurt.',
          'price': 99,
          'image': 'assets/images/mango-smoothie.jpg',
        },
        {
          'name': 'Strawberry Milkshake',
          'description':
              'A sweet and creamy milkshake blended with fresh strawberries and topped with whipped cream.',
          'price': 119,
          'image': 'assets/images/strawberry-milkshake.jpg',
        },
        {
          'name': 'Cold Coffee',
          'description':
              'A chilled coffee drink with milk and sugar, perfect for caffeine lovers.',
          'price': 89,
          'image': 'assets/images/cold-coffee.jpg',
        },
        {
          'name': 'Virgin Mojito',
          'description':
              'A zesty and fizzy drink with fresh mint, lime, and soda water.',
          'price': 109,
          'image': 'assets/images/virgin-mojito.jpg',
        },
        {
          'name': 'Orange Juice',
          'description':
              'Freshly squeezed orange juice packed with natural sweetness and vitamin C.',
          'price': 79,
          'image': 'assets/images/orange-juice.jpg',
        },
      ],
    },
    {
      'name': 'Smoothie Station',
      'rating': 4.4,
      'deliveryTime': '18 min',
      'description': 'Smoothies, Health Drinks, Juices',
      'city': 'Midtown',
      'distance': '1.5 km',
      'image': 'assets/images/drinks-2.jpg',
      'items': [
        {
          'name': 'Lemon Iced Tea',
          'description':
          'A refreshing blend of tea and lemon juice served chilled over ice.',
          'price': 79,
          'image': 'assets/images/lemon-iced-tea.jpg',
        },
        {
          'name': 'Mango Smoothie',
          'description':
          'A creamy and tropical mango smoothie made with ripe mangoes and yogurt.',
          'price': 99,
          'image': 'assets/images/mango-smoothie.jpg',
        },
        {
          'name': 'Strawberry Milkshake',
          'description':
          'A sweet and creamy milkshake blended with fresh strawberries and topped with whipped cream.',
          'price': 119,
          'image': 'assets/images/strawberry-milkshake.jpg',
        },
        {
          'name': 'Cold Coffee',
          'description':
          'A chilled coffee drink with milk and sugar, perfect for caffeine lovers.',
          'price': 89,
          'image': 'assets/images/cold-coffee.jpg',
        },
        {
          'name': 'Virgin Mojito',
          'description':
          'A zesty and fizzy drink with fresh mint, lime, and soda water.',
          'price': 109,
          'image': 'assets/images/virgin-mojito.jpg',
        },
        {
          'name': 'Orange Juice',
          'description':
          'Freshly squeezed orange juice packed with natural sweetness and vitamin C.',
          'price': 79,
          'image': 'assets/images/orange-juice.jpg',
        },
      ],
    },
    {
      'name': 'The Drinkery',
      'rating': 4.3,
      'deliveryTime': '20 min',
      'description': 'Cocktails, Smoothies, Juices',
      'city': 'Central Park',
      'distance': '2.2 km',
      'image': 'assets/images/drinks-3.jpg',
      'items': [
        {
          'name': 'Lemon Iced Tea',
          'description':
          'A refreshing blend of tea and lemon juice served chilled over ice.',
          'price': 79,
          'image': 'assets/images/lemon-iced-tea.jpg',
        },
        {
          'name': 'Mango Smoothie',
          'description':
          'A creamy and tropical mango smoothie made with ripe mangoes and yogurt.',
          'price': 99,
          'image': 'assets/images/mango-smoothie.jpg',
        },
        {
          'name': 'Strawberry Milkshake',
          'description':
          'A sweet and creamy milkshake blended with fresh strawberries and topped with whipped cream.',
          'price': 119,
          'image': 'assets/images/strawberry-milkshake.jpg',
        },
        {
          'name': 'Cold Coffee',
          'description':
          'A chilled coffee drink with milk and sugar, perfect for caffeine lovers.',
          'price': 89,
          'image': 'assets/images/cold-coffee.jpg',
        },
        {
          'name': 'Virgin Mojito',
          'description':
          'A zesty and fizzy drink with fresh mint, lime, and soda water.',
          'price': 109,
          'image': 'assets/images/virgin-mojito.jpg',
        },
        {
          'name': 'Orange Juice',
          'description':
          'Freshly squeezed orange juice packed with natural sweetness and vitamin C.',
          'price': 79,
          'image': 'assets/images/orange-juice.jpg',
        },
      ],
    },
    {
      'name': 'Café Refresh',
      'rating': 4.6,
      'deliveryTime': '25 min',
      'description': 'Café, Drinks, Smoothies',
      'city': 'Downtown',
      'distance': '2.5 km',
      'image': 'assets/images/drinks-4.jpg',
      'items': [
        {
          'name': 'Lemon Iced Tea',
          'description':
          'A refreshing blend of tea and lemon juice served chilled over ice.',
          'price': 79,
          'image': 'assets/images/lemon-iced-tea.jpg',
        },
        {
          'name': 'Mango Smoothie',
          'description':
          'A creamy and tropical mango smoothie made with ripe mangoes and yogurt.',
          'price': 99,
          'image': 'assets/images/mango-smoothie.jpg',
        },
        {
          'name': 'Strawberry Milkshake',
          'description':
          'A sweet and creamy milkshake blended with fresh strawberries and topped with whipped cream.',
          'price': 119,
          'image': 'assets/images/strawberry-milkshake.jpg',
        },
        {
          'name': 'Cold Coffee',
          'description':
          'A chilled coffee drink with milk and sugar, perfect for caffeine lovers.',
          'price': 89,
          'image': 'assets/images/cold-coffee.jpg',
        },
        {
          'name': 'Virgin Mojito',
          'description':
          'A zesty and fizzy drink with fresh mint, lime, and soda water.',
          'price': 109,
          'image': 'assets/images/virgin-mojito.jpg',
        },
        {
          'name': 'Orange Juice',
          'description':
          'Freshly squeezed orange juice packed with natural sweetness and vitamin C.',
          'price': 79,
          'image': 'assets/images/orange-juice.jpg',
        },
      ],
    },
    {
      'name': 'Chill & Sip',
      'rating': 4.7,
      'deliveryTime': '18 min',
      'description': 'Drinks, Smoothies, Cocktails',
      'city': 'West End',
      'distance': '1.3 km',
      'image': 'assets/images/drinks-5.jpg',
      'items': [
        {
          'name': 'Lemon Iced Tea',
          'description':
          'A refreshing blend of tea and lemon juice served chilled over ice.',
          'price': 79,
          'image': 'assets/images/lemon-iced-tea.jpg',
        },
        {
          'name': 'Mango Smoothie',
          'description':
          'A creamy and tropical mango smoothie made with ripe mangoes and yogurt.',
          'price': 99,
          'image': 'assets/images/mango-smoothie.jpg',
        },
        {
          'name': 'Strawberry Milkshake',
          'description':
          'A sweet and creamy milkshake blended with fresh strawberries and topped with whipped cream.',
          'price': 119,
          'image': 'assets/images/strawberry-milkshake.jpg',
        },
        {
          'name': 'Cold Coffee',
          'description':
          'A chilled coffee drink with milk and sugar, perfect for caffeine lovers.',
          'price': 89,
          'image': 'assets/images/cold-coffee.jpg',
        },
        {
          'name': 'Virgin Mojito',
          'description':
          'A zesty and fizzy drink with fresh mint, lime, and soda water.',
          'price': 109,
          'image': 'assets/images/virgin-mojito.jpg',
        },
        {
          'name': 'Orange Juice',
          'description':
          'Freshly squeezed orange juice packed with natural sweetness and vitamin C.',
          'price': 79,
          'image': 'assets/images/orange-juice.jpg',
        },
      ],
    },
  ]
};
