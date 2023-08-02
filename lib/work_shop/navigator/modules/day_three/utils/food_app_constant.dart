class FoodAppConstants {
  static Map<FoodCategories, List<String>> foodCategoriesItems = {
    const FoodCategories(
        id: '0',
        name: 'All',
        image: 'assets/food_app/food_categories/drink.png'): [
      ...drinkTypes,
      ...burgerTypes,
      ...cakeTypes,
      ...snacksTypes,
    ],
    const FoodCategories(
        id: '1',
        name: 'Drinks',
        image: 'assets/food_app/food_categories/drink.png'): drinkTypes,
    const FoodCategories(
        id: '2',
        name: 'Burgers',
        image: 'assets/food_app/food_categories/burger.png'): burgerTypes,
    const FoodCategories(
        id: '3',
        name: 'Cakes',
        image: 'assets/food_app/food_categories/cake-slice.png'): cakeTypes,
    const FoodCategories(
        id: '4',
        name: 'Snacks',
        image: 'assets/food_app/food_categories/snack.png'): snacksTypes,
  };

  //create a string list of drink types
  static List<String> drinkTypes = [
    'Vodka',
    'Wine',
    'Campaine',
    'Desi',
    'Videsi',
  ];

  static List<String> burgerTypes = [
    'Burger1',
    'Burger2',
    'Burger3',
    'Burger4',
    'Burger5',
  ];

  static List<String> snacksTypes = [
    'Snack1',
    'Snack2',
    'Snack3',
    'Snack4',
    'Snack5',
  ];

  static List<String> cakeTypes = [
    'Cake1',
    'Cake2',
    'Cake3',
    'Cake4',
    'Cake5',
  ];
}

class FoodCategories {
  final String id;
  final String? name;
  final String? image;

  const FoodCategories({required this.id, this.name, this.image});
}