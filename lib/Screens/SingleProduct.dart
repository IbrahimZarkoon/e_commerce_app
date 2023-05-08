import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Providers/CartProvider.dart';
import 'package:e_commerce/Widgets/Accordian.dart';
import 'package:e_commerce/Widgets/Drawer.dart';
import 'package:e_commerce/Widgets/Headings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'MyCart.dart';

class SingleProduct extends StatefulWidget {
  const SingleProduct({Key? key, required this.tag, required this.productid})
      : super(key: key);

  final String tag;
  final String productid;

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  int _currentIndex = 0;
  int _productCount = 0;
  int _current = 0;

  final CarouselController _RelatedProductsController = CarouselController();

  final List<Widget> images = [];

  String productColor = "";
  String _selectedSize = "Choose a Size";
  final CarouselController sliderController = CarouselController();

  final paginationController =
      PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    images.add(
      relatedProductsCon(
          context,
          "https://www.luxury-legs.com/images/zerres-carla-snake-trouser-p4358-209223_medium.jpg",
          "ZERRES",
          "Carla Snake Trousers",
          "99.00",
          "https://www.luxury-legs.com/images/zerres-sarah-fine-ribbed-velvet-jeans-p4248-194915_medium.jpg",
          "ZERRES",
          "Sarah Fine Ribbed Velvet Jeans",
          "95.00"),
    );
    images.add(
      relatedProductsCon(
          context,
          "https://www.luxury-legs.com/images/zerres-sarah-fine-ribbed-velvet-jeans-p4248-194915_medium.jpg",
          "ZERRES",
          "Cora Crop Jeans",
          "79.00",
          "https://images.salesfire.co.uk/49ae2095-f508-4fc4-96cc-a58e99bed522/600x600/4247/r-contain/c-FFFFFFFF/1983395332.webp",
          "ZERRES",
          "Gina Wellness Lightweight Trousers",
          "89.00"),
    );

    double _top = 0;
    // images.add(relatedProductsCon(context,
    //     "https://www.luxury-legs.com/images/zerres-carla-snake-trouser-p4358-209223_medium.jpg", "ZERRES", "Carla Snake Trousers", "99.00",
    //     "https://www.luxury-legs.com/images/zerres-sarah-fine-ribbed-velvet-jeans-p4248-194915_medium.jpg", "ZERRES", "Sarah Fine Ribbed Velvet Jeans", "95.00"),);
    // images.add(relatedProductsCon(context,
    //     "https://www.luxury-legs.com/images/zerres-carla-snake-trouser-p4358-209223_medium.jpg", "ZERRES", "Carla Snake Trousers", "99.00",
    //     "https://www.luxury-legs.com/images/zerres-sarah-fine-ribbed-velvet-jeans-p4248-194915_medium.jpg", "ZERRES", "Sarah Fine Ribbed Velvet Jeans", "95.00"),);
    // images.add(relatedProductsCon(context,
    //     "https://www.luxury-legs.com/images/zerres-carla-snake-trouser-p4358-209223_medium.jpg", "ZERRES", "Carla Snake Trousers", "99.00",
    //     "https://www.luxury-legs.com/images/zerres-sarah-fine-ribbed-velvet-jeans-p4248-194915_medium.jpg", "ZERRES", "Sarah Fine Ribbed Velvet Jeans", "95.00"),);

    var cartProv = Provider.of<CartProvider>(context);

    return Stack(children: [
      Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: Scaffold(
          backgroundColor: Colors.white,

          // appBar: PreferredSize(
          //   preferredSize: const Size.fromHeight(kToolbarHeight),
          //   child: AppBar(
          //     centerTitle: true,
          //     title: Container(
          //       height: kToolbarHeight,
          //       width: MediaQuery.of(context).size.width *0.4,
          //       decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/logo-removebg-preview.png"),fit: BoxFit.cover)),),
          //     automaticallyImplyLeading: false,
          //     backgroundColor: Color(0xFF0071dc),
          //     elevation: 0.5,
          //     leading: BackButton(
          //       color: Colors.white,
          //       onPressed: () {
          //         Navigator.pop(context);
          //       },
          //     ),
          //     actions: [
          //       Padding(
          //         padding: const EdgeInsets.only(top: 15,right: 15),
          //         child: GestureDetector(
          //           onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const MyCart()),),
          //
          //           child: Stack(children: [
          //
          //             const Icon(Icons.shopping_cart_outlined,color: Colors.white,),
          //
          //             Provider.of<CartProvider>(context).productsList.length > 0?  Positioned(
          //                 top: 0,right: 0,
          //                 child: Container(width: 10,height: 10,decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(50)),)) : const SizedBox()
          //           ]),
          //         ),
          //       )
          //     ],
          //   ),
          // ),

          body: Container(
            margin: EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          onPressed: () {
                            sliderController.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          },
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black.withOpacity(0.1),
                                        width: 0.2))),
                            child: CarouselSlider(
                              carouselController: sliderController,
                              items: const [
                                Image(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/zerres-vera-summer-trousers-p4356-209212_medium.jpg")),
                                Image(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/zerres-vera-summer-trousers-p4356-209213_medium.jpg")),
                                Image(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/zerres-vera-summer-trousers-p4356-209211_medium.jpg")),
                                Image(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/zerres-vera-summer-trousers-p4356-209212_medium.jpg")),
                                Image(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/zerres-vera-summer-trousers-p4356-209213_medium.jpg")),
                              ],
                              options: CarouselOptions(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  initialPage: _currentIndex,
                                  enlargeCenterPage: true,
                                  viewportFraction: 0.9,
                                  enableInfiniteScroll: true,
                                  autoPlay: false,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                  }),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                          onPressed: () {
                            sliderController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Images Preview Container
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //1st Image
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: _currentIndex == 0
                                  ? Border.all(
                                      color: Colors.black.withOpacity(0.6))
                                  : const Border(),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 0))
                              ]),
                          child: Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/zerres-vera-summer-trousers-p4356-209212_medium.jpg"))
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black.withOpacity(0.15),
                                //     blurRadius: 1,
                                //     spreadRadius: 1,
                                //     offset: Offset(0,0)
                                //   )
                                // ]
                                ),
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        //2nd Image
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: _currentIndex == 1
                                  ? Border.all(
                                      color: Colors.black.withOpacity(0.6))
                                  : const Border(),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 0))
                              ]),
                          child: Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/zerres-vera-summer-trousers-p4356-209213_medium.jpg"))
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black.withOpacity(0.15),
                                //     blurRadius: 1,
                                //     spreadRadius: 1,
                                //     offset: Offset(0,0)
                                //   )
                                // ]
                                ),
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        //3rd Image
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: _currentIndex == 2
                                  ? Border.all(
                                      color: Colors.black.withOpacity(0.6))
                                  : const Border(),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 0))
                              ]),
                          child: Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/zerres-vera-summer-trousers-p4356-209211_medium.jpg"))
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black.withOpacity(0.15),
                                //     blurRadius: 1,
                                //     spreadRadius: 1,
                                //     offset: Offset(0,0)
                                //   )
                                // ]
                                ),
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        //4th Image
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: _currentIndex == 3
                                  ? Border.all(
                                      color: Colors.black.withOpacity(0.6))
                                  : const Border(),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 0))
                              ]),
                          child: Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/zerres-vera-summer-trousers-p4356-209212_medium.jpg"))
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black.withOpacity(0.15),
                                //     blurRadius: 1,
                                //     spreadRadius: 1,
                                //     offset: Offset(0,0)
                                //   )
                                // ]
                                ),
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: _currentIndex > 3
                                  ? Border.all(
                                      color: Colors.black.withOpacity(0.6))
                                  : const Border(),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 0))
                              ]),
                          child: Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Icon(Icons.more_horiz_outlined),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // //Pagination
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SmoothPageIndicator(
                  //         effect: ExpandingDotsEffect(
                  //           radius: 10, dotHeight: 10,dotWidth: 10,
                  //           activeDotColor: Color(0xFFfc9038),
                  //           dotColor: Color(0xffd2d2d2)
                  //         ),
                  //         controller: paginationController, count: 5),
                  //   ],
                  // ),
                  //
                  const SizedBox(
                    height: 10,
                  ),

                  //Title & Ratings Container
                  Container(
                    decoration: const BoxDecoration(
                        // border: Border(
                        //     bottom: BorderSide(
                        //         color: Colors.black.withOpacity(0.2), width: 1)),
                        ),
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 10, left: 0, right: 0),
                    child: Column(
                      children: [
                        //Title Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Hero(
                                tag: widget.tag,
                                child: const Material(
                                  child: Text("ZERRES",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      textScaleFactor: 1.1,
                                      style: TextStyle(
                                          color: Colors.black87,
                                          //fontFamily: 'Fira-SemiBold',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17)),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        //Category Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text("Vera Summer Trousers",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  textScaleFactor: 1.1,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      // fontFamily: 'Fira-Regular',
                                      fontSize: 14)),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        //Cost & Ratings Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "£ ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "109.99",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            AbsorbPointer(
                              absorbing: true,
                              child: RatingBar(
                                initialRating: double.parse("4.4"),
                                allowHalfRating: true,
                                itemSize: 16,
                                ratingWidget: RatingWidget(
                                    full: const Icon(
                                      Icons.star,
                                      color: Color(0xffffc107),
                                    ),
                                    half: const Icon(
                                      Icons.star_half,
                                      color: Color(0xffffc107),
                                    ),
                                    empty: const Icon(
                                      Icons.star_border,
                                      color: Color(0xffffc107),
                                    )),
                                onRatingUpdate: (ratings) => print(ratings),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 3),
                              child: Text(
                                " ${double.parse("4.4")}/5.0",
                                style: const TextStyle(
                                    color: Color(0xff8c8c8c), fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //Details Container
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 0, right: 0, bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Item in Stock ",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff15c308)),
                            ),
                            Text(
                              "| Usually dispatched within 24 hours",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Warranty: ",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                            const Text(
                              "10 - Month(s) Warranty",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff085eb9)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Choose a Colour: $productColor",
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  //Color Row
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //1st Color Container
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              productColor = "Brown";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: productColor == "Brown"
                                    ? Border.all(color: Colors.black)
                                    : const Border(),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 0))
                                ]),
                            child: Container(
                              width: 30,
                              height: 30,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.brown,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black.withOpacity(0.15),
                                //     blurRadius: 1,
                                //     spreadRadius: 1,
                                //     offset: Offset(0,0)
                                //   )
                                // ]
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        //2nd Color Container
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              productColor = "Black";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: productColor == "Black"
                                    ? Border.all(color: Colors.black)
                                    : const Border(),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 0))
                                ]),
                            child: Container(
                              width: 30,
                              height: 30,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black.withOpacity(0.15),
                                //     blurRadius: 1,
                                //     spreadRadius: 1,
                                //     offset: Offset(0,0)
                                //   )
                                // ]
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        //3rd Color Container
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              productColor = "White";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(1),
                                border: productColor == "White"
                                    ? Border.all(color: Colors.black)
                                    : const Border(),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 0))
                                ]),
                            child: Container(
                              width: 30,
                              height: 30,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.1))
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.black.withOpacity(0.15),
                                  //     blurRadius: 1,
                                  //     spreadRadius: 1,
                                  //     offset: Offset(0,0)
                                  //   )
                                  // ]
                                  ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),

                        //4th Color Container
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              productColor = "Red";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: productColor == "Red"
                                    ? Border.all(color: Colors.black)
                                    : const Border(),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 0))
                                ]),
                            child: Container(
                              width: 30,
                              height: 30,
                              padding: const EdgeInsets.all(10),
                              decoration:
                                  BoxDecoration(color: Colors.red, boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 0))
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Choose Size Container
                  GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup<void>(
                        context: context,
                        builder: (BuildContext context) => CupertinoActionSheet(
                          title: Text(
                            'Select Size',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.9),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          //message: const Text('Message'),
                          actions: <CupertinoActionSheetAction>[
                            CupertinoActionSheetAction(
                              /// This parameter indicates the action would be a default
                              /// defualt behavior, turns the action's text to bold text.
                              isDefaultAction: false,
                              onPressed: () {
                                setState(() {
                                  _selectedSize = "Small";
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Small'),
                            ),
                            CupertinoActionSheetAction(
                              /// This parameter indicates the action would be a default
                              /// defualt behavior, turns the action's text to bold text.
                              isDefaultAction: false,
                              onPressed: () {
                                setState(() {
                                  _selectedSize = "Medium";
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Medium'),
                            ),
                            CupertinoActionSheetAction(
                              /// This parameter indicates the action would be a default
                              /// defualt behavior, turns the action's text to bold text.
                              isDefaultAction: false,
                              onPressed: () {
                                setState(() {
                                  _selectedSize = "Large";
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Large'),
                            ),
                            CupertinoActionSheetAction(
                              /// This parameter indicates the action would be a default
                              /// defualt behavior, turns the action's text to bold text.
                              isDefaultAction: false,
                              onPressed: () {
                                setState(() {
                                  _selectedSize = "X Large";
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('X Large'),
                            ),
                            CupertinoActionSheetAction(
                                isDefaultAction: true,
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.red),
                                ))
                          ],
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 15, right: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 1,
                                offset: const Offset(0, 0))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("$_selectedSize"),
                          const Icon(Icons.arrow_downward_rounded)
                        ],
                      ),
                    ),
                  ),

                  //+ - & Wishlist Row
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Add to Wishlist Container
                        Container(
                          height: 40,
                          padding: const EdgeInsets.only(
                              left: 10, right: 15, bottom: 5, top: 5),
                          margin: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 0))
                              ]),
                          child: Row(
                            children: [
                              const Icon(Icons.favorite_outline_rounded),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "ADD TO WISHLIST",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.75)),
                              ),
                            ],
                          ),
                        ),

                        //+ - Counter Container
                        Container(
                          height: 40,
                          margin: const EdgeInsets.only(right: 15),
                          //width: MediaQuery.of(context).size.width*0.31,
                          decoration: BoxDecoration(
                              color: const Color(0xfff7f7f7),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: const Offset(0, 0),
                                    blurRadius: 1,
                                    spreadRadius: 1)
                              ]),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (_productCount > 0) {
                                    setState(() {
                                      _productCount--;
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    //color: Colors.green,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: const Icon(Icons.remove,
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  //height: 50,
                                  color: Colors.white,
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Text('$_productCount')),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _productCount++;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    //color: Colors.red,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: const Icon(Icons.add,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // //Add to Cart Container
                  // GestureDetector(
                  //   onTap: ()
                  //   {
                  //     cartProv.addProduct(Product(id: widget.productid, title: "ZERRES", quantity: 1, price: 99.00));
                  //
                  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item added to Cart")));
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.only(top: 15,bottom: 15),
                  //     margin: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                  //     alignment: Alignment.center,
                  //     decoration: BoxDecoration(
                  //         boxShadow: [
                  //           BoxShadow(
                  //               color: Colors.black.withOpacity(0.1),
                  //               blurRadius: 1,
                  //               spreadRadius: 1,
                  //               offset: const Offset(0,0)
                  //           )
                  //         ],
                  //       borderRadius: BorderRadius.circular(5),
                  //       color: Colors.black
                  //     ),
                  //     child: const Text("ADD TO CART",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  //   ),
                  // ),

                  //Accordions Container
                  Container(
                    //padding: const EdgeInsets.only(bottom: 15),
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    decoration: const BoxDecoration(
                      // border: Border(
                      //     bottom: BorderSide(
                      //         color: Colors.black.withOpacity(0.2), width: 2)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Accordion(
                            title: "PRODUCT DETAILS",
                            content: Text(
                              "Inspired by aerodynamic concepts, the ZOTAC GAMING GeForce RTX 4090 AMP Extreme AIRO utilizes an AIR-Optimized design to bring out the best in the world’s most advanced gaming GPU powered by the NVIDIA Ada Lovelace architecture and DLSS 3. For gamers and enthusiasts who desire the ultimate performance, the AMP Extreme AIRO graphics card offers everything – from unrivalled power to outstanding thermal and noise performance.",
                              style: TextStyle(fontSize: 12),
                            )),
                        Accordion(
                            title: "DELIVERY & RETURNS",
                            content: Container(
                              padding: const EdgeInsets.only(
                                  top: 0, bottom: 20, left: 15, right: 15),
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        "Product Code: ",
                                        style: TextStyle(
                                            color: Color(0xff7e7e7e),
                                            fontSize: 12),
                                      ),
                                      Text("810012083225")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        "Brand: ",
                                        style: TextStyle(
                                            color: Color(0xff7e7e7e),
                                            fontSize: 12),
                                      ),
                                      Text(
                                        "Gaming X Trio",
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        "Price Updated On: ",
                                        style: TextStyle(
                                            color: Color(0xff7e7e7e),
                                            fontSize: 12),
                                      ),
                                      Text(
                                        "15 Mar, 2023",
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Inspired by aerodynamic concepts, the ZOTAC GAMING GeForce RTX 4090 AMP Extreme AIRO utilizes an AIR-Optimized design to bring out the best in the world’s most advanced gaming GPU powered by the NVIDIA Ada Lovelace architecture and DLSS 3. For gamers and enthusiasts who desire the ultimate performance, the AMP Extreme AIRO graphics card offers everything – from unrivalled power to outstanding thermal and noise performance.",
                                    //textScaleFactor: 1.2,
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            )),
                        Accordion(
                            title: "PAYMENT & SECURITY",
                            content: Text(
                              "No Updates Yet",
                              style: TextStyle(fontSize: 12),
                            )),
                        Accordion(
                            title: "PRODUCT REVIEWS",
                            content: ratingsCon(context)),
                      ],
                    ),
                  ),

                  Headings(context, "Frequently Bought Together"),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.325,
                    child: ListView(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        productsContainer2(
                            "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MQD83?wid=400&hei=400&fmt=jpeg&qlt=90&.v=1660803972361",
                            "Airpods Pro",
                            "Apple",
                            "249"),

                        productsContainer2(
                            "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MJ4X3?wid=400&hei=400&fmt=jpeg&qlt=95&.v=1621876626000",
                            "Beats Studio Buds",
                            "Beats",
                            "149.99")
                        //productsContainer(image, title, category, price)
                      ],
                    ),
                  ),

                  Headings(context, "Related Products"),

                  //Related Products Images Container
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.325,
                    child: ListView(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        productsContainer2(
                            "https://www.luxury-legs.com/images/zerres-carla-snake-trouser-p4358-209223_medium.jpg",
                            "Carla Snake Trousers",
                            "ZERRES",
                            "99.00"),

                        productsContainer2(
                            "https://www.luxury-legs.com/images/zerres-sarah-fine-ribbed-velvet-jeans-p4248-194915_medium.jpg",
                            "Sarah Fine Ribbed Velvet Jeans",
                            "ZERRES",
                            "95.00")
                        //productsContainer(image, title, category, price)
                      ],
                    ),
                  ),

                  Headings(context, "Most Relevant"),

                  //Comments Slider Container
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.275,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                            top: 3, bottom: 3, left: 15, right: 15),
                        itemCount: 5,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return reviewCon(
                              context,
                              "Got to have 'em",
                              "States where I pretty good price and a great size I use two a day and it's something we have to buy",
                              "Mark$index");
                        }),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return allReviews(context);
                              });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.6))),
                          child: Text(
                            "See all reviews",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

          bottomNavigationBar: Container(
            padding: EdgeInsets.only(left: 0, right: 0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.075,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black.withOpacity(0.1))),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "£",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "109.99",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // cartProv.addProduct(Product(id: widget.productid, title: "ZERRES", quantity: 1, price: 99.00));
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Item added to Cart")));
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF0071dc)),
                    child: Text(
                      "Add to cart",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Positioned(
        top: 5,
        left: 20,
        right: 20,
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            setState(() {
              _top += details.delta.dy;
            });
          },
          onVerticalDragCancel: () => Navigator.pop(context),
          child: Transform.translate(
            offset: Offset(0, _top),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }

  Widget ratingsCon(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Customer Ratings",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.65)),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AbsorbPointer(
                    absorbing: true,
                    child: RatingBar(
                      initialRating: double.parse("4.4"),
                      allowHalfRating: true,
                      itemSize: 15,
                      ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star,
                            color: Color(0xffffc107),
                          ),
                          half: const Icon(
                            Icons.star_half,
                            color: Color(0xffffc107),
                          ),
                          empty: const Icon(
                            Icons.star_border,
                            color: Color(0xffffc107),
                          )),
                      onRatingUpdate: (ratings) => print(ratings),
                    ),
                  ),
                  Text(
                    " ${double.parse("4.4")}/5.0",
                    style:
                        const TextStyle(color: Color(0xff8c8c8c), fontSize: 14),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 25, right: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFfc9038),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 1,
                          offset: const Offset(0, 0))
                    ]),
                child: const Text(
                  "Write a review",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 12),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget relatedProductsCon(
    BuildContext context,
    String I1,
    String T1,
    String C1,
    String P1,
    String I2,
    String T2,
    String C2,
    String P2,
  ) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: productsContainer(I1, T1, C1, P1),
          ),
          Flexible(
            child: productsContainer(I2, T2, C2, P2),
          ),
        ],
      ),
    );
  }

  Widget productsContainer(
      String image, String title, String category, String price) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 200, child: Image.network(image)),
              //Title Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        //textScaleFactor: 1.1,
                        style: const TextStyle(
                            color: Colors.black87,
                            //fontFamily: 'Fira-SemiBold',
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ),
                ],
              ),

              const SizedBox(
                height: 5,
              ),

              //Category Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(category,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textScaleFactor: 1.1,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            //fontFamily: 'Fira-Regular',
                            fontSize: 12)),
                  ),
                ],
              ),

              const SizedBox(
                height: 5,
              ),

              //Cost Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "£ ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),

        //Wishlist Positioned
        Positioned(
            right: 5,
            top: 0,
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Item added to Wishlist")));
              },
              child: Container(
                decoration: BoxDecoration(),
                child: Icon(
                  Icons.favorite_outline,
                  color: Colors.black,
                  size: 20,
                  weight: 0.1,
                ),
              ),
            )),

        Positioned(
            left: 0,
            bottom: 100,
            child: GestureDetector(
              onTap: () {
                // cartProv.addProduct(Product(id: widget.productid, title: "ZERRES", quantity: 1, price: 99.00));

                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Item added to Cart")));
              },
              child: Container(
                padding:
                    EdgeInsets.only(left: 10, right: 18, top: 8, bottom: 8),
                decoration: BoxDecoration(
                    color: Color(0xFFfc9038),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 14,
                        weight: 0.1,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Add",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }

  Widget productsContainer2(
      String image, String title, String category, String price) {
    bool fav = false;

    return Container(
      margin: EdgeInsets.only(right: 15, top: 2, bottom: 2),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 0))
          ]),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 175,
                child: Image.network(image)),

            //Wishlist Positioned
            Positioned(
                right: 5,
                top: 5,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      fav = !fav;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Item added to Wishlist")));
                  },
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Icon(
                      fav ? Icons.favorite_outlined : Icons.favorite_outline,
                      color: Color(0xffe32c2c),
                      size: 20,
                      weight: 0.1,
                    ),
                  ),
                )),

            //Add to Cart Positioned
            Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    // cartProv.addProduct(Product(id: widget.productid, title: "ZERRES", quantity: 1, price: 99.00));

                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Item added to Cart")));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 18, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                        color: Color(0xFFfc9038),
                        borderRadius: BorderRadius.circular(0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 1),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 14,
                            weight: 0.1,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Add To Cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                )),
          ]),

          const SizedBox(
            height: 10,
          ),

          //Title Row
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      //textScaleFactor: 1.1,
                      style: const TextStyle(
                          color: Colors.black87,
                          //fontFamily: 'Fira-SemiBold',
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 5,
          ),

          //Category Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(category,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textScaleFactor: 1.1,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        //fontFamily: 'Fira-Regular',
                        fontSize: 12)),
              ),
            ],
          ),

          const SizedBox(
            height: 5,
          ),

          //Cost Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "£ ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                price,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget reviewCon(
    BuildContext context, String title, String comment, String name) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    width: MediaQuery.of(context).size.width * 0.9,
    height: MediaQuery.of(context).size.height * 0.25,
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(1, 1))
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Ratings and Date Row
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: AbsorbPointer(
                absorbing: true,
                child: RatingBar(
                  initialRating: double.parse("4.4"),
                  allowHalfRating: true,
                  itemSize: 16,
                  ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star,
                        color: Color(0xffffc107),
                      ),
                      half: const Icon(
                        Icons.star_half,
                        color: Color(0xffffc107),
                      ),
                      empty: const Icon(
                        Icons.star_border,
                        color: Color(0xffffc107),
                      )),
                  onRatingUpdate: (ratings) => print(ratings),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "Verified Purchaser",
              style: TextStyle(
                  color: Color(0xff51a81e),
                  fontWeight: FontWeight.bold,
                  fontSize: 11),
            ),
            const Spacer(),
            Text(
              "03/21/2023",
              style:
                  TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 12),
            )
          ],
        ),

        const SizedBox(
          height: 10,
        ),

        //Title Text
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        //Comment Text
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(
            comment,
            style: TextStyle(color: Colors.black.withOpacity(0.4)),
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        //Name Text
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(
            name,
            style: TextStyle(color: Colors.black.withOpacity(0.4)),
          ),
        ),

        const Spacer(),

        //Like / Dislike Row
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //like Container
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.thumb_up_outlined,
                    color: Colors.black.withOpacity(0.75),
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Text(
                      "9",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              width: 15,
            ),

            //Dislike Container
            Container(
              child: Row(
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                    child: Icon(
                      Icons.thumb_down_outlined,
                      color: Colors.black.withOpacity(0.75),
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Text(
                      "0",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget allReviews(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.85,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Headings(context, "Customer Reviews"),

        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AbsorbPointer(
                absorbing: true,
                child: RatingBar(
                  initialRating: double.parse("4.4"),
                  allowHalfRating: true,
                  itemSize: 20,
                  ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star,
                        color: Color(0xffffc107),
                      ),
                      half: const Icon(
                        Icons.star_half,
                        color: Color(0xffffc107),
                      ),
                      empty: const Icon(
                        Icons.star_border,
                        color: Color(0xffffc107),
                      )),
                  onRatingUpdate: (ratings) => print(ratings),
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  "(4.6)",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6), fontSize: 12),
                ),
              )
            ],
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        //5 Stars
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "5 stars",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black.withOpacity(0.6)),
              ),
              Expanded(
                child: LinearPercentIndicator(
                  barRadius: Radius.circular(5),
                  //width: 300.0,
                  lineHeight: 8.0,
                  percent: 360 / 400,

                  trailing: SizedBox(
                      width: 20,
                      child: Text(
                        "20",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 12),
                      )),
                  //linearStrokeCap: LinearStrokeCap.butt,
                  backgroundColor: Color(0xffd5d5d5),
                  progressColor: Color(0xFF5D5D5D),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 5,
        ),

        //4 Stars
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "4 stars",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black.withOpacity(0.6)),
              ),
              Expanded(
                child: LinearPercentIndicator(
                  barRadius: Radius.circular(5),
                  //width: 300.0,
                  lineHeight: 8.0,
                  percent: 300 / 400,

                  trailing: SizedBox(
                      width: 20,
                      child: Text(
                        "28",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 12),
                      )),
                  //linearStrokeCap: LinearStrokeCap.butt,
                  backgroundColor: Color(0xffd5d5d5),
                  progressColor: Color(0xFF5D5D5D),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),

        //3 Stars
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "3 stars",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black.withOpacity(0.6)),
              ),
              Expanded(
                child: LinearPercentIndicator(
                  barRadius: Radius.circular(5),
                  //width: 300.0,
                  lineHeight: 8.0,
                  percent: 0 / 400,

                  trailing: SizedBox(
                      width: 20,
                      child: Text(
                        "0",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 12),
                      )),
                  //linearStrokeCap: LinearStrokeCap.butt,
                  backgroundColor: Color(0xffd5d5d5),
                  progressColor: Color(0xFF5D5D5D),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),

        //2 Stars
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "2 stars",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black.withOpacity(0.6)),
              ),
              Expanded(
                child: LinearPercentIndicator(
                  barRadius: Radius.circular(5),
                  //width: 300.0,
                  lineHeight: 8.0,
                  percent: 0 / 400,

                  trailing: SizedBox(
                      width: 20,
                      child: Text(
                        "0",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 12),
                      )),
                  //linearStrokeCap: LinearStrokeCap.butt,
                  backgroundColor: Color(0xffd5d5d5),
                  progressColor: Color(0xFF5D5D5D),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),

        //1 Star
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "1 stars",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black.withOpacity(0.6)),
              ),
              Expanded(
                child: LinearPercentIndicator(
                  barRadius: Radius.circular(5),
                  //width: 300.0,
                  lineHeight: 8.0,
                  percent: 0 / 400,

                  trailing: SizedBox(
                      width: 20,
                      child: Text(
                        "0",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 12),
                      )),
                  //linearStrokeCap: LinearStrokeCap.butt,
                  backgroundColor: Color(0xffd5d5d5),
                  progressColor: Color(0xFF5D5D5D),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        shadowLine(context),

        Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                //padding: EdgeInsets.only(top: 3,bottom: 3,left: 15,right: 15),
                itemCount: 5,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    //margin: EdgeInsets.only(right: 10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,

                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(1, 1))
                        ]),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Ratings and Date Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2.0),
                              child: AbsorbPointer(
                                absorbing: true,
                                child: RatingBar(
                                  initialRating: double.parse("4.4"),
                                  allowHalfRating: true,
                                  itemSize: 16,
                                  ratingWidget: RatingWidget(
                                      full: const Icon(
                                        Icons.star,
                                        color: Color(0xffffc107),
                                      ),
                                      half: const Icon(
                                        Icons.star_half,
                                        color: Color(0xffffc107),
                                      ),
                                      empty: const Icon(
                                        Icons.star_border,
                                        color: Color(0xffffc107),
                                      )),
                                  onRatingUpdate: (ratings) => print(ratings),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Verified Purchaser",
                              style: TextStyle(
                                  color: Color(0xff51a81e),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            ),
                            const Spacer(),
                            Text(
                              "03/21/2023",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.4),
                                  fontSize: 12),
                            )
                          ],
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        //Title Text
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            "Got to have 'em",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        //Comment Text
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            "States where I pretty good price and a great size I use two a day and it's something we have to buy",
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.4)),
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        //Name Text
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            "Mark$index",
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.4)),
                          ),
                        ),

                        const Spacer(),

                        //Like / Dislike Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //like Container
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.thumb_up_outlined,
                                    color: Colors.black.withOpacity(0.75),
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7.0),
                                    child: Text(
                                      "9",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(
                              width: 15,
                            ),

                            //Dislike Container
                            Container(
                              child: Row(
                                children: [
                                  Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()
                                      ..scale(-1.0, 1.0, 1.0),
                                    child: Icon(
                                      Icons.thumb_down_outlined,
                                      color: Colors.black.withOpacity(0.75),
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7.0),
                                    child: Text(
                                      "0",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }))
      ],
    ),
  );
}
