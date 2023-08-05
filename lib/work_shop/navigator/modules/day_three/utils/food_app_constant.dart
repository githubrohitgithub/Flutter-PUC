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
        category: 'burger',
        name: 'Beef Burger',
        price: '100',
        image: 'assets/food_app/sub_items_images/beef_burger.png'),
    const FoodSubType(
        category: 'burger',
        name: 'Cheese Burger',
        price: '130',
        image: 'assets/food_app/sub_items_images/cheesbust.png'),
    const FoodSubType(
        category: 'burger',
        name: 'Peparini Burger',
        price: '160',
        image: 'assets/food_app/sub_items_images/peparini.png'),
    const FoodSubType(
        category: 'burger',
        name: 'Spicy Beast Burger',
        price: '103',
        image: 'assets/food_app/sub_items_images/beef_burger.png'),
    const FoodSubType(
        category: 'burger',
        name: 'Spicy Beast Burger',
        price: '1009',
        image: 'assets/food_app/sub_items_images/beef_burger.png'),
    const FoodSubType(
        category: 'burger',
        name: 'Spicy Beast Burger',
        price: '1000',
        image: 'assets/food_app/sub_items_images/beef_burger.png'),
    const FoodSubType(
        category: 'burger',
        name: 'Spicy Beast Burger',
        price: '1009',
        image: 'assets/food_app/sub_items_images/beef_burger.png'),
    const FoodSubType(
        category: 'burger',
        name: 'Spicy Beast Burger',
        price: '1000',
        image: 'assets/food_app/sub_items_images/beef_burger.png'),
  ];

  //create List<FoodSubType> of drink type
  static List<FoodSubType> listOfDrinkTypes = [
    const FoodSubType(
        category: 'drink',
        name: 'Vodka',
        image: 'assets/food_app/sub_items_images/vodka.png'),
    const FoodSubType(
        category: 'drink',
        name: 'Wine',
        image: 'assets/food_app/sub_items_images/vodka.png'),
    const FoodSubType(
        category: 'drink',
        name: 'Rum',
        image: 'assets/food_app/sub_items_images/rum.png'),
    const FoodSubType(
        category: 'drink',
        name: 'Soft',
        image: 'assets/food_app/sub_items_images/rum.png'),
  ];

  static List<FoodSubType> listOfSnackTypes = [
    const FoodSubType(
        category: 'snacks',
        name: 'Kurkure',
        image: 'assets/food_app/sub_items_images/namkeen.png'),
    const FoodSubType(
        category: 'snacks',
        name: 'Namkeen',
        image: 'assets/food_app/sub_items_images/namkeen.png'),
    const FoodSubType(
        category: 'snacks',
        name: 'Sweet',
        image: 'assets/food_app/sub_items_images/sweet.png'),
    const FoodSubType(
        category: 'snacks',
        name: 'Peanut',
        image: 'assets/food_app/sub_items_images/peanut.png'),
  ];

  static List<FoodSubType> listOfCakeTypes = [
    const FoodSubType(
        category: 'cake',
        name: 'Orange',
        image: 'assets/food_app/sub_items_images/beef_burger.png'),
    const FoodSubType(
        category: 'cake',
        name: 'Chocolate',
        image: 'assets/food_app/sub_items_images/cheesbust.png'),
    const FoodSubType(
        category: 'cake',
        name: 'Pinapple',
        image: 'assets/food_app/sub_items_images/peparini.png'),
    const FoodSubType(
        category: 'cake',
        name: 'Manago',
        image: 'assets/food_app/sub_items_images/spicy_beast.png'),
  ];


  static List<CartModel> listOfCartModel = [
    CartModel(
        name: 'Beef Burger',
        price: '10',
        quantity: '2',
        size: '123',
        subName: 'Meat Cheese burger',
        image: 'assets/food_app/sub_items_images/beef_burger.png'),

    CartModel(
        name: 'Cheese Burger',
        price: '10',
        quantity: '1',
        size: '123',
        subName: 'mid Cheese burger',
        image: 'assets/food_app/sub_items_images/cheesbust.png'),
    CartModel(
        name: 'Cake',
        price: '20',
        quantity: '1',
        size: '123',
        subName: 'Cake Cheese burger',
        image: 'assets/food_app/food_categories/ic_cake.png'),
    CartModel(
        name: 'Drink',
        price: '30',
        quantity: '1',
        size: '123',
        subName: 'Drink Cheese burger',
        image: 'assets/food_app/food_categories/ic_drink.png'),
  ];
}
