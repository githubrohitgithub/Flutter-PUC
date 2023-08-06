import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../base/routes/app_routes.dart';
import '../../../models/food_details_model.dart';
import '../../../models/food_sub_type.dart';

class GridViewItem extends StatefulWidget {
  final Color bgColor;
  final List<FoodSubType> listOfBurgerTypes;

  const GridViewItem(
      {super.key, required this.listOfBurgerTypes, required this.bgColor});

  @override
  State<GridViewItem> createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {
  @override
  Widget build(BuildContext context) {
    var foodDetailsModel = FoodDetailsModel(
        name: 'Meat Cheese Burger',
        price: 500,
        image: 'assets/food_app/sub_items_images/beef_burger.png',
        listFoodSubType: [
          const FoodSubType(
              name: 'Meat',
              image: 'assets/food_app/items_images/meat.png',
              calories: '30cal'),
          const FoodSubType(
              name: 'Cheese',
              image: 'assets/food_app/items_images/cheese.png',
              calories: '20cal'),
          const FoodSubType(
              name: 'Tomoto',
              image: 'assets/food_app/items_images/tomato.png',
              calories: '10cal'),
          const FoodSubType(
              name: 'Green leaf',
              image: 'assets/food_app/items_images/greenleaf.png',
              calories: '10cal'),
        ]);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Set the number of columns here
        crossAxisSpacing: 2.0, // Optional, adjust as needed
        mainAxisSpacing: 2.0, // Optional, adjust as needed
        childAspectRatio: 0.7, // Optional, adjust as needed
      ),
      itemCount: widget.listOfBurgerTypes.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRouteConstants.foodDetailsPageRoute,
                arguments: FoodDetailsArguments(
                  foodDetailsModel: foodDetailsModel,
                  bgColor: widget.bgColor,
                )
                // Replace `yourData` with the actual data you want to pass.
                );
          },
          child: Padding(
            padding:  const EdgeInsets.all(16.0),
            child: Hero(
              tag: 'hero-tag',
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.bgColor..withOpacity(0.2),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 600,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            widget.listOfBurgerTypes[index].image ?? '',
                            fit: BoxFit.fitWidth,
                            width: 120,
                            height: 120,
                          ),
                          Text(widget.listOfBurgerTypes[index].name ?? '',
                              style: const TextStyle(
                                  fontFamily: 'OriginalSurfer',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Meat Cheese Burger',
                              style: TextStyle(
                                  fontFamily: 'OriginalSurfer',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              '${'\$'} ${widget.listOfBurgerTypes[index].price ?? ''}',
                              style: const TextStyle(
                                  fontFamily: 'OriginalSurfer',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24)),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      // Set a negative value to overflow from the bottom
                      right: -10,
                      // Set a negative value to overflow from the right
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        width: 50,
                        height: 50,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: widget.bgColor..withOpacity(0.2)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  'assets/food_app/common/cart_bag_icon.svg',
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
