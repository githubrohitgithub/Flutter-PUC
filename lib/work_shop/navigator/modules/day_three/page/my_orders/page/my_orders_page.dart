import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/base/animations/animated_bottom_to_top.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/utils/food_app_constant.dart';
import '../../../base/routes/app_routes.dart';
import '../../../utils/color_convertor.dart';
import '../../../utils/utils.dart';
import '../../food_description/widgets/custom_slider_widget.dart';
import '../widgets/my_order_list.dart';

class MyOrdersPage extends StatefulWidget {
  final Color bgColor;
  final Color buttonColor;

  const MyOrdersPage(
      {super.key, required this.bgColor, required this.buttonColor});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    var listOfCartModel = foodItemCartTemp;

    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBottomToTopWidget(
          duration: const Duration(seconds: 1),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Image.asset('assets/food_app/common/top_notch.png'),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 32, top: 16, bottom: 16),
                            child: Text(
                              'Order Your\nfavorite food',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OriginalSurfer'),
                            ),
                          ),
                          SizedBox(
                            height: 300,
                            child:
                                MyOrderList(listOfCartModel: listOfCartModel),
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 24),
                                          child: SizedBox(
                                            width: 100,
                                            height: 50,
                                            child: TextField(
                                              onChanged: (text) {
                                                // Do something with the entered text
                                                print("Input: $text");
                                              },
                                              enableInteractiveSelection: false,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  focusColor: Colors.grey
                                                      .withOpacity(0.2),
                                                  hintText: 'Apply Coupan',
                                                  hintStyle: const TextStyle(
                                                      fontFamily:
                                                          'OriginalSurfer')),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: AspectRatio(
                                            aspectRatio: 2,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                // Add your button's action here
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: widget.buttonColor,
                                                // Replace with the desired background color
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50), // Adjust the value for roundness
                                                ),
                                              ),
                                              child: const Text('Apply',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontFamily:
                                                          'OriginalSurfer',
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('SubTotal',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontFamily: 'OriginalSurfer',
                                                fontWeight: FontWeight.normal)),
                                        Text('88 USS',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontFamily: 'OriginalSurfer',
                                                fontWeight: FontWeight.normal)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Shipping fee',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontFamily: 'OriginalSurfer',
                                                fontWeight: FontWeight.normal)),
                                        Text('Standard fee',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontFamily: 'OriginalSurfer',
                                                fontWeight: FontWeight.normal)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Estimated total',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'OriginalSurfer',
                                                fontWeight: FontWeight.normal)),
                                        Text('249  USS + tax',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'OriginalSurfer',
                                                fontWeight: FontWeight.normal)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 80,
                                    ),
                                    Container(
                                      height: 80,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.transparent,
                                      child: CustomSliderWidget(
                                        sliderBgColor:
                                            ColorConvertor.getColorFromHex(
                                                '#ebd8c0'),
                                        bgColor: Colors.grey.withOpacity(0.2),
                                        arrowColor: Colors.white,
                                        msgColor: Colors.white,
                                        msg: 'Checkout',
                                        onSlide: () {


                                          foodItemCartTemp.clear();

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: const Text(
                                                  'Order Placed Successfully'),
                                              duration:
                                                  const Duration(seconds: 2),
                                              action: SnackBarAction(
                                                label: 'Undo',
                                                onPressed: () {},
                                              ),
                                            ),
                                          );

                                          Navigator.pushNamed(context, AppRouteConstants.foodDashboardPageRoute,

                                          );



                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
