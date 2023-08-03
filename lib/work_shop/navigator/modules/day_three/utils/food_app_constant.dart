import 'package:flutter/material.dart';

import '../models/cart_model.dart';
import '../models/food_categories.dart';
import '../models/food_sub_type.dart';

class FoodAppConstants {
  static String fontStyleOriginalSurfer = 'OriginalSurfer';

  static Map<FoodCategories, List<FoodSubType>> foodCategoriesItems = {
    const FoodCategories(id: '0', name: 'All', color: Colors.white, image: ''):
        [
      ...listOfDrinkTypes,
      ...listOfBurgerTypes,
      ...listOfCakeTypes,
      ...listOfSnackTypes,
    ],
    const FoodCategories(
            id: '1',
            name: 'Drinks',
            color: Colors.deepPurpleAccent,
            image: 'assets/food_app/food_categories/ic_drink.png'):
        listOfDrinkTypes,
    const FoodCategories(
            id: '2',
            name: 'Burgers',
            color: Colors.amberAccent,
            image: 'assets/food_app/food_categories/ic_burger.png'):
        listOfBurgerTypes,
    const FoodCategories(
        id: '3',
        name: 'Cakes',
        color: Colors.deepPurpleAccent,
        image: 'assets/food_app/food_categories/ic_cake.png'): listOfCakeTypes,
    const FoodCategories(
            id: '4',
            name: 'Snacks',
            color: Colors.redAccent,
            image: 'assets/food_app/food_categories/ic_snack.png'):
        listOfSnackTypes,
  };

  static List<FoodSubType> listOfBurgerTypes = [
    const FoodSubType(
        name: 'Beef Burger',
        image: 'assets/food_app/sub_items_images/beef_burger.png'),
    const FoodSubType(
        name: 'Cheese Burger',
        image: 'assets/food_app/sub_items_images/cheesbust.png'),
    const FoodSubType(
        name: 'Peparini Burger',
        image: 'assets/food_app/sub_items_images/peparini.png'),
    const FoodSubType(
        name: 'Spicy Beast Burger',
        image: 'assets/food_app/sub_items_images/beef_burger.png'),
  ];

  //create List<FoodSubType> of drink type
  static List<FoodSubType> listOfDrinkTypes = [
    const FoodSubType(
        name: 'Vodka', image: 'assets/food_app/sub_items_images/vodka.png'),
    const FoodSubType(
        name: 'Wine', image: 'assets/food_app/sub_items_images/vodka.png'),
    const FoodSubType(
        name: 'Rum', image: 'assets/food_app/sub_items_images/rum.png'),
    const FoodSubType(
        name: 'Soft', image: 'assets/food_app/sub_items_images/rum.png'),
  ];

  static List<FoodSubType> listOfSnackTypes = [
    const FoodSubType(
        name: 'Kurkure', image: 'assets/food_app/sub_items_images/namkeen.png'),
    const FoodSubType(
        name: 'Namkeen', image: 'assets/food_app/sub_items_images/namkeen.png'),
    const FoodSubType(
        name: 'Sweet', image: 'assets/food_app/sub_items_images/sweet.png'),
    const FoodSubType(
        name: 'Peanut', image: 'assets/food_app/sub_items_images/peanut.png'),
  ];

  static List<FoodSubType> listOfCakeTypes = [
    const FoodSubType(
        name: 'Orange',
        image: 'assets/food_app/sub_items_images/beef_burger.png'),
    const FoodSubType(
        name: 'Chocolate',
        image: 'assets/food_app/sub_items_images/cheesbust.png'),
    const FoodSubType(
        name: 'Pinapple',
        image: 'assets/food_app/sub_items_images/peparini.png'),
    const FoodSubType(
        name: 'Manago',
        image: 'assets/food_app/sub_items_images/spicy_beast.png'),
  ];

  static List<String> cakeTypes = [
    'Cake1',
    'Cake2',
    'Cake3',
    'Cake4',
    'Cake5',
  ];

  static List<CartModel> listOfCartModel = [
    CartModel(
        name: 'Burger',
        price: 10,
        quantity: 1,
        image: 'assets/food_app/food_categories/ic_burger.png'),
    CartModel(
        name: 'Cake',
        price: 20,
        quantity: 1,
        image: 'assets/food_app/food_categories/ic_cake.png'),
    CartModel(
        name: 'Drink',
        price: 30,
        quantity: 1,
        image: 'assets/food_app/food_categories/ic_drink.png'),
  ];
}
