import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/food.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    //burger
    Food(
      name: "bbq burger",
      description: "grilled chicken with hot sauce and vegies",
      imagepath: "lib/images/Burger/bbq burger.jpg",
      price: 210,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: "Extra cheese", price: 50),
        Addon(name: "Bacon", price: 30),
        Addon(name: "Avacado", price: 21)
      ],
    ),
    Food(
      name: "cheese burger",
      description: "grilled chicken with hot sauce and vegies",
      imagepath: "lib/images/Burger/cheeseburger.png",
      price: 200,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: "Extra cheese", price: 50),
        Addon(name: "letoose", price: 20),

      ],
    ),
    Food(
      name: "jumbo burger",
      description: "double platte  chicken with hot sauce mayonise and vegies",
      imagepath: "lib/images/Burger/jumboburger.png",
      price: 350,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: "Extra cheese", price: 50),
      ],
    ),
    Food(
      name: "veg burger",
      description: "  hot sauce mayonise and vegies",
      imagepath: "lib/images/Burger/vegburger.jpg",
      price: 110,
      category: FoodCategory.burger,
      availableAddons: [

        Addon(name: "vegleafs", price: 40),
        Addon(name: "Avacado", price: 30),
      ],
    ),
    Food(
      name: "zinger burger",
      description: " fries chicken with  hot sauce mayonise and vegies",
      imagepath: "lib/images/Burger/zingerburger.png",
      price: 250,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: "Extra cheese", price: 50),
        Addon(name: "mayonise", price: 20),

      ],
    ),
    //salad
    Food(
      name: "chicken salad",
      description: " fries chicken with  hot sauce mayonise and vegies",
      imagepath: "lib/images/salad/chknsalad.jpg",
      price: 300,
      category: FoodCategory.salads,
      availableAddons: [Addon(name: "mayonise", price: 20)],
    ),

    Food(
      name: "creamy salad",
      description: "  sauce ,mayonise with vegies",
      imagepath: "lib/images/salad/creamy salad.png",
      price: 199,
      category: FoodCategory.salads,
      availableAddons: [Addon(name: "Avacado", price: 20),
        Addon(name: "cream", price: 30),],
    ),

    Food(
      name: "fruits salad",
      description: " sauce mayonise with vegies and fruits",
      imagepath: "lib/images/salad/fruitsalad.png",
      price: 299,
      category: FoodCategory.salads,
      availableAddons: [Addon(name: "fruits", price: 50)],
    ),
    Food(
      name: "indiangreen salad",
      description: " vegies with laef types sauce ,mayonise and pepper powder",
      imagepath: "lib/images/salad/indaingreensalad.jpg",
      price: 99,
      category: FoodCategory.salads,
      availableAddons: [],
    ),
    Food(
      name: "rainbow salad",
      description: "sauce and  types of vegies in different colors ",
      imagepath: "lib/images/salad/rainbowsalad.png",
      price: 200,
      category: FoodCategory.salads,
      availableAddons: [Addon(name: "fruits", price: 50),
        Addon(name: "vegies", price: 50),
        Addon(name: "sauces", price: 20),],
    ),
    //sides
    Food(
      name: "garlicbread",
      description:
      "bread spread with garlic and butter",
      imagepath: "lib/images/sides/garlic-bread.jpg",
      price: 200,
      category: FoodCategory.side,
      availableAddons: [Addon(name: "sugar", price: 10),

        Addon(name: "garlic", price: 15),
        Addon(name: "butter", price: 10)],
    ),
    Food(
      name: "loadedfries",
      description: "potato fries top with chicken olives mayonise and chesee ",
      imagepath: "lib/images/sides/loadedfries.jpg",
      price: 300,
      category: FoodCategory.side,
      availableAddons: [Addon(name: "cheese", price: 50),
        Addon(name: "mayonise", price: 20)],
    ),
    Food(
      name: "mac sides",
      description: "sides with pasta cheese and sauces ",
      imagepath: "lib/images/sides/mac side.jpg",
      price: 100,
      category: FoodCategory.side,
      availableAddons: [
        Addon(name: "extra cheese", price: 50)],
    ),
    Food(
      name: "onion rings",
      description: "crispy onion fries ",
      imagepath: "lib/images/sides/onion rings.jpg",
      price:90,
      category: FoodCategory.side,
      availableAddons: [Addon(name: "cheese", price: 50),
        Addon(name: "mayonise", price: 20)],
    ),


    //deserts
    Food(
      name: "Sweetpotato",
      description: "sweet potatos with chats and vegies ",
      imagepath: "lib/images/sides/sweetpotato.jpg",
      price: 80,
      category: FoodCategory.side,
      availableAddons: [Addon(name: "nuttella", price: 50)],
    ),
    Food(
      name: "cakes",
      description: "spunge cakes filling with cream and flavours ",
      imagepath: "lib/images/Deserts/cakes.jpg",
      price: 600,
      category: FoodCategory.desert,
      availableAddons: [
        Addon(name: "nuts", price: 100),
        Addon(name: "nuttella", price: 50),
        Addon(name: "cream", price: 70)
      ],
    ),
    Food(
      name: "donuts",
      description:
          "a small usually ring-shaped piece of sweet fried dough,Various toppings and flavors are used for different types, such as sugar, chocolate or maple glazing. ",
      imagepath: "lib/images/Deserts/donuts.jpg",
      price: 120,
      category: FoodCategory.desert,
      availableAddons: [
        Addon(name: "nuts", price: 100),
        Addon(name: "nuttella", price: 50),
        Addon(name: "cream", price: 70)
      ],
    ),
    Food(
      name: "Gulabjammu",
      description:
          "deep-fried milk ballsthen immersed in a warm, thick sugar syrup flavored with rose and cardamom. ",
      imagepath: "lib/images/Deserts/gulabjam.png",
      price: 100,
      category: FoodCategory.desert,
      availableAddons: [Addon(name: "icecream", price: 70)],
    ),
    Food(
      name: "faluda",
      description:
          "deep-fried milk ballsthen immersed in a warm, thick sugar syrup flavored with rose and cardamom. ",
      imagepath: "lib/images/Deserts/icecreams.png",
      price: 210,
      category: FoodCategory.desert,
      availableAddons: [
        Addon(name: "nuts", price: 100),
        Addon(name: "nuttella", price: 50),
        Addon(name: "icecream", price: 70),
        Addon(name: "fruits", price: 30),
      ],
    ),

    //drinks,

    Food(
      name: "hotchocolate",
      description:
      " it is a heated beverage consisting of shaved chocolate, melted chocolate or cocoa powder, heated milk or water, and often sugar. ",
      imagepath: "lib/images/Drinks/hotchoclate.jpg",
      price: 120,
      category: FoodCategory.drinks,
      availableAddons: [Addon(name: "sugar", price: 10),
        Addon(name: "chocolate", price: 70)],
    ),

    Food(
      name: "Icedcoffe",
      description:
      "Cold Coffee is a popular chilled beverage made with coffee, sugar and milk/water and also whipped cream with topping. ",
      imagepath: "lib/images/Drinks/icedcoffee.jpg",
      price: 150,
      category: FoodCategory.drinks,
      availableAddons: [Addon(name: "sugar", price: 10),
        Addon(name: "icecream", price: 50)],
    ),

    Food(
      name: "mango juice",
      description:
      " drink made from the extraction or pressing of the natural liquid contained in mango ",
      imagepath: "lib/images/Drinks/mango.png",
      price: 90,
      category: FoodCategory.drinks,
      availableAddons: [Addon(name: "sugar", price: 10),
        Addon(name: "icecream", price: 50),
        Addon(name: "milk", price: 10)],
    ),

    Food(
      name: "Mojito",
      description:
      "Mojito is a daiquiri with mint over crushed ice, topped with soda ",
      imagepath: "lib/images/Drinks/Mojito.jpg",
      price: 170,
      category: FoodCategory.drinks,
      availableAddons: [Addon(name: "sugar", price: 10),
        Addon(name: "flavors sirup", price: 30)],
    ),
    Food(
      name: "smothiee",
      description:
      "commonly has a liquid base, such as fruit juice or milk, yogurt or ice cream",
      imagepath: "lib/images/Drinks/smoothei.jpg",
      price: 200,
      category: FoodCategory.drinks,
      availableAddons: [Addon(name: "sugar", price: 10),
        Addon(name: "fruits", price: 70),
        Addon(name: "nuts", price: 70),
        Addon(name: "berries", price: 70)],
    ),
  ];
  /*
  GETTERS
   */
List<Food> get menu => _menu;

/*
  OPERATIONS
   */

//add to cart

// remove from cart

//get total price of cart

// get total number of items in cart

//clear cart
/*
 HELPERS
   */

//generate a receipt

// format double value into money

//format list of addon in to a string summary

}
