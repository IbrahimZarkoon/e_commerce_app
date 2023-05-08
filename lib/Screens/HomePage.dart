import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Screens/AllCategories.dart';
import 'package:e_commerce/Screens/SignIN.dart';
import 'package:e_commerce/Screens/SignUp.dart';
import 'package:e_commerce/Screens/SingleBrand.dart';
import 'package:e_commerce/Screens/SingleCategory.dart';
import 'package:e_commerce/Screens/SingleProduct.dart';
import 'package:e_commerce/Widgets/AppBar.dart';
import 'package:e_commerce/Widgets/Drawer.dart';
import 'package:e_commerce/Widgets/Headings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Widgets/SliderPainter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool dailyDeals = true;
  bool weeklyDeals = false;
  bool monthlyDeals = false;

  bool _isPressed = false;

  //bool User = false;

  void setter(bool param) {
    setState(() {
      param = !param;
    });
  }

  ScrollController _controller = ScrollController();
  double _sliderPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _sliderPosition = _controller.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.165),
          child: myAppBar(
            context,
            () => Scaffold.of(context).openDrawer(),
          )),
      drawer: customDrawer(context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Top Deal/Heading
              //

              //Latest Deals
              //Headings(context, "Latest Deals"),

              //Latest Deals Carousel
              Container(
                height: MediaQuery.of(context).size.height * 0.268,

                child: CarouselSlider(
                    items: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const SingleCategory(
                                          tag: "latestdeals")));
                        },
                        child: Stack(children: [
                          Container(
                            margin: const EdgeInsets.only(right: 0),
                            padding: const EdgeInsets.only(
                                top: 25, bottom: 25, left: 25, right: 15),
                            width: MediaQuery.of(context).size.width,
                            foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.65),
                                    Colors.black.withOpacity(0.65)
                                  ]),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                color: const Color(0xffa41818),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://cdn.vectorstock.com/i/preview-1x/19/50/sale-and-discount-promo-background-vector-27471950.jpg"),
                                    fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 1.5,
                                      offset: const Offset(2, 2))
                                ]),
                          ),
                          Positioned(
                            left: 20,
                            right: 0,
                            top: 20,
                            bottom: 20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Hero(
                                        tag: "latestdeals",
                                        child: Icon(
                                          Icons.av_timer_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        )),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text("Ends 26 May",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.9),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13)),
                                  ],
                                ),

                                //const SizedBox(height: 10,),

                                Text(
                                  "20% OFF SELECTED BIG BRAND TOYS",
                                  maxLines: 3,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26),
                                ),

                                //const SizedBox(height: 10,),

                                Text("Shop now",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.9),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        decoration: TextDecoration.underline)),
                              ],
                            ),
                          )
                        ]),
                      )
                    ],
                    options: CarouselOptions(
                      padEnds: false,
                      viewportFraction: 1,
                      enlargeCenterPage: false,
                    )),
                // child: ListView.builder(
                //     padding: const EdgeInsets.only(
                //         left: 0, right: 0, top: 0, bottom: 0),
                //     physics: const BouncingScrollPhysics(),
                //     scrollDirection: Axis.horizontal,
                //     shrinkWrap: true,
                //     itemCount: 5,
                //     itemBuilder: (BuildContext context, index) {
                //       return GestureDetector(
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (BuildContext context) =>
                //                       SingleCategory(
                //                           tag: "latestdeals$index")));
                //         },
                //         child: Stack(children: [
                //           Container(
                //             margin: const EdgeInsets.only(right: 2),
                //             padding: const EdgeInsets.only(
                //                 top: 25, bottom: 25, left: 25, right: 15),
                //             width: MediaQuery.of(context).size.width,
                //             foregroundDecoration: BoxDecoration(
                //               gradient: LinearGradient(
                //                   begin: Alignment.topCenter,
                //                   end: Alignment.bottomCenter,
                //                   colors: [
                //                     Colors.black.withOpacity(0.65),
                //                     Colors.black.withOpacity(0.65)
                //                   ]),
                //             ),
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(0),
                //                 color: const Color(0xffa41818),
                //                 image: const DecorationImage(
                //                     image: NetworkImage(
                //                         "https://cdn.vectorstock.com/i/preview-1x/19/50/sale-and-discount-promo-background-vector-27471950.jpg"),
                //                     fit: BoxFit.cover),
                //                 boxShadow: [
                //                   BoxShadow(
                //                       color: Colors.black.withOpacity(0.2),
                //                       spreadRadius: 1,
                //                       blurRadius: 1.5,
                //                       offset: const Offset(2, 2))
                //                 ]),
                //           ),
                //           Positioned(
                //             left: 20,
                //             right: 0,
                //             top: 20,
                //             bottom: 20,
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Row(
                //                   children: [
                //                     Hero(
                //                         tag: "latestdeals$index",
                //                         child: const Icon(
                //                           Icons.av_timer_outlined,
                //                           color: Colors.white,
                //                           size: 20,
                //                         )),
                //                     const SizedBox(
                //                       width: 5,
                //                     ),
                //                     Text("Ends 26 May",
                //                         style: TextStyle(
                //                             color:
                //                                 Colors.white.withOpacity(0.9),
                //                             fontWeight: FontWeight.bold,
                //                             fontSize: 13)),
                //                   ],
                //                 ),
                //
                //                 //const SizedBox(height: 10,),
                //
                //                 Text(
                //                   "20% OFF SELECTED BIG BRAND TOYS",
                //                   maxLines: 3,
                //                   style: TextStyle(
                //                       color: Colors.white.withOpacity(0.9),
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 26),
                //                 ),
                //
                //                 //const SizedBox(height: 10,),
                //
                //                 Text("Shop now",
                //                     style: TextStyle(
                //                         color: Colors.white.withOpacity(0.9),
                //                         fontWeight: FontWeight.bold,
                //                         fontSize: 14,
                //                         decoration: TextDecoration.underline)),
                //               ],
                //             ),
                //           )
                //         ]),
                //       );
                //     }),
              ),

              //Top Categories Container
              topCategories2(context),

              Headings(context, "Top Products"),

              //Top Products Slider
              topProducts(context),

              Headings(context, "Shop by brand"),

              Container(
                height: MediaQuery.of(context).size.height * 0.26,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    //1st Brand
                    topBrandsCon("Nike",
                        "https://nishatemporium.com/wp-content/uploads/2019/07/nike.png"),

                    //2nd Brand
                    topBrandsCon("Michael Kors",
                        'https://scarboroughtowncentre.com/wp-content/uploads/2021/11/1e8921e3755a0eb764c0b1404fa1c6a4c8a3073e.png'),

                    //3rd Brand
                    topBrandsCon("Dolce & Gabbana",
                        "https://global-uploads.webflow.com/5e157548d6f7910beea4e2d6/60a3d1be18fcab31b78277f6_dolce-gabbana-luxury-logo.png"),

                    //4th Brand
                    topBrandsCon("Balenciaga",
                        "https://i.pinimg.com/originals/71/3d/3f/713d3fbbcae7235be86ee77a69d073d4.png")
                  ],
                ),
              ),

              //New In Headings
              Container(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 10, left: 15, right: 15),
                child: Row(
                  children: [
                    const Text("New In",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ],
                ),
              ),

              //New In Container
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Stay ahead of the style curve with our latest arrivals",
                      style: TextStyle(fontSize: 16),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Stack(children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (scrollNotification) {
                            if (scrollNotification
                                is ScrollUpdateNotification) {
                              setState(() {
                                _sliderPosition = scrollNotification
                                        .metrics.pixels /
                                    scrollNotification.metrics.maxScrollExtent;
                              });
                            }
                            return true;
                          },
                          child: ListView(
                            controller: _controller,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 5, bottom: 5),
                            children: [
                              //1st Item
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    margin: const EdgeInsets.only(right: 10),
                                    foregroundDecoration: BoxDecoration(
                                        color: Colors.white,
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            stops: [
                                              0.2,
                                              1
                                            ],
                                            colors: [
                                              Colors.transparent,
                                              Colors.black.withOpacity(0.75)
                                            ])),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://static.zara.net/photos///2023/V/0/1/p/1887/411/250/2/w/324/1887411250_2_1_1.jpg?ts=1675764550254"),
                                            fit: BoxFit.cover)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.center,
                                    "T-Shirts",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),

                              //2nd Item
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    margin: const EdgeInsets.only(right: 10),
                                    foregroundDecoration: BoxDecoration(
                                        color: Colors.white,
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            stops: [
                                              0.2,
                                              1
                                            ],
                                            colors: [
                                              Colors.transparent,
                                              Colors.black.withOpacity(0.75)
                                            ])),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81JG5cRlrYL._UY575_.jpg"),
                                            fit: BoxFit.cover)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.center,
                                    "Shoes",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),

                              //3rd Item
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    margin: const EdgeInsets.only(right: 10),
                                    foregroundDecoration: BoxDecoration(
                                        color: Colors.white,
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            stops: [
                                              0.2,
                                              1
                                            ],
                                            colors: [
                                              Colors.transparent,
                                              Colors.black.withOpacity(0.75)
                                            ])),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://cdn.shopify.com/s/files/1/0445/4917/7499/products/MRFSBMF_499_GBF.jpg?v=1618909558"),
                                            fit: BoxFit.cover)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.center,
                                    "Shorts",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),

                              //4th Item
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    margin: const EdgeInsets.only(right: 0),
                                    foregroundDecoration: BoxDecoration(
                                        color: Colors.white,
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            stops: [
                                              0.2,
                                              1
                                            ],
                                            colors: [
                                              Colors.transparent,
                                              Colors.black.withOpacity(0.75)
                                            ])),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://img.abercrombie.com/is/image/anf/KIC_155-2644-2982-278_prod1?policy=product-medium&wid=350&hei=438"),
                                            fit: BoxFit.cover)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    textAlign: TextAlign.center,
                                    "Jeans",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 100,
                        right: 100,
                        child: Container(
                          margin: const EdgeInsets.only(right: 0, left: 0),
                          decoration: BoxDecoration(
                              color: const Color(0xffe5e5e5),
                              borderRadius: BorderRadius.circular(20)),
                          height: 3,
                          child: CustomPaint(
                            painter: SliderPainter(position: _sliderPosition),
                          ),
                        ),
                      )
                    ]),

                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (BuildContext context) =>
                                        const SingleCategory(tag: "NewIn")));
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 20, right: 20),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.85),
                                borderRadius: BorderRadius.circular(3)),
                            alignment: Alignment.center,
                            child: const Text(
                              "Show now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),

                    // const SizedBox(height: 20,),
                    //
                    // shadowLine(context),
                  ],
                ),
              ),

              Headings(context, "Recently viewed"),

              //Recently Viewed Container
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 0),
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: ListView(
                    //controller: _controller,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 5, bottom: 5),
                    children: [
                      //1st Item
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.275,
                            margin: const EdgeInsets.only(right: 10),
                            foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [
                                      0.0,
                                      1
                                    ],
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.75)
                                    ])),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://www.shirtfriends.com/r50/obility/bilder/firma820/poloshirt_bcpui10.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "White Polo Shirt",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.75),
                                fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "£ 36.70",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.75),
                                fontSize: 10),
                          )
                        ],
                      ),

                      //2nd Item
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.275,

                            margin: const EdgeInsets.only(right: 10),
                            foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [
                                      0.0,
                                      1
                                    ],
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.75)
                                    ])),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://images.sg.content-cdn.io/cdn/in-resources/21e9ae3c-de72-4391-9c4a-c7af58447630/Images/ProductImages/Source/levis-womens-501-81-jeans-A46990006_02_Back.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Levi's Jeans",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.75),
                                fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "£ 19.99",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.75),
                                fontSize: 10),
                          )
                        ],
                      ),

                      //3rd Item
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.275,

                            margin: const EdgeInsets.only(right: 10),
                            foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [
                                      0.0,
                                      1
                                    ],
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.75)
                                    ])),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://cdn.shopify.com/s/files/1/0445/4917/7499/products/MSMSHPALNSB_400OB_WBF_ffb050bf-00cf-4cd8-a71f-2da4ea25f652.jpg?v=1653979657&width=1080"),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Jockey Blue Shorts",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.75),
                                fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "£ 24.90",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.75),
                                fontSize: 10),
                          )
                        ],
                      ),

                      //4th Item
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.275,

                            margin: const EdgeInsets.only(right: 0),
                            foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [
                                      0.0,
                                      1
                                    ],
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.75)
                                    ])),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://backdoor-media.s3.eu-central-1.amazonaws.com/wp-content/uploads/2021/12/06151539/air-jordan-1-zoom-air-comfort-donna-ct0979-006-data-del-lancioss.jpeg"),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "Nike Jordans",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.75),
                                fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "£ 120.00",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.75),
                                fontSize: 10),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              //Subscription Container
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                    top: 10, bottom: 30, left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Subscribe to our newsletter",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Be the first to get the latest news about trends, promotions and much more!",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter your email address',
                          labelStyle: const TextStyle(fontSize: 13),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(3)),
                      child: const Text(
                        "SUBSCRIBE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "I would like to unsubscribe",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget topCategories(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView(
        padding: const EdgeInsets.only(left: 20, right: 15),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          //1st and 2nd Categories
          Container(
            margin: const EdgeInsets.only(right: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //1st Category
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SingleCategory(
                                  tag: "1",
                                )));
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Image Container
                        Hero(
                          tag: "1",
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 0))
                                ],
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 3, color: Colors.white),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8&w=1000&q=80"),
                                    fit: BoxFit.cover)),
                          ),
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        //Title Container
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          child: const Text(
                            "Sneakers",
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //2nd Category
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SingleCategory(
                                  tag: "2",
                                )));
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Image Container
                        Hero(
                          tag: "2",
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 0))
                                ],
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 3, color: Colors.white),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://c1.wallpaperflare.com/preview/613/1020/887/clock-wrist-watch-time-golden-background.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        //Title Container
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          child: const Text(
                            "Wristwatches",
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //3rd and 4th Categories
          Container(
            margin: const EdgeInsets.only(right: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //3rd Category
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SingleCategory(
                                  tag: "3",
                                )));
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Image Container
                        Hero(
                          tag: "3",
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 0))
                                ],
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 3, color: Colors.white),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://imageio.forbes.com/specials-images/imageserve/60e48ef5423e512de205d104/Apple-iPhone-12-Pro--Pacific-Blue-/960x0.jpg?format=jpg&width=960"),
                                    fit: BoxFit.cover)),
                          ),
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        //Title Container
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          child: const Text(
                            "Smartphones",
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //4th Category
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SingleCategory(
                                  tag: "4",
                                )));
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Image Container
                        Hero(
                          tag: "4",
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 0))
                                ],
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 3, color: Colors.white),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://img.freepik.com/free-photo/high-angle-view-cosmetic-beauty-products-white-backdrop_23-2147878835.jpg"),
                                    fit: BoxFit.fill)),
                          ),
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        //Title Container
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          child: const Text(
                            "Beauty Products",
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //5th and 6th Categories
          Container(
            margin: const EdgeInsets.only(right: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //5th Category
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SingleCategory(
                                  tag: "5",
                                )));
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Image Container
                        Hero(
                          tag: "5",
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 0))
                                ],
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 3, color: Colors.white),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://p4.wallpaperbetter.com/wallpaper/966/450/338/book-4k-background-desktop-wallpaper-preview.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        //Title Container
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          child: const Text(
                            "Books",
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //6th Category
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SingleCategory(
                                  tag: "6",
                                )));
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Image Container
                        Hero(
                          tag: "6",
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 0))
                                ],
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 3, color: Colors.white),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://cdn.pixabay.com/photo/2019/03/13/11/07/supermarket-4052658__340.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        //Title Container
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          child: const Text(
                            "Grocery",
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //7th and 8th Categories
          Container(
            //margin: const EdgeInsets.only(right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //7th Category
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SingleCategory(
                                  tag: "7",
                                )));
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Image Container
                        Hero(
                          tag: "7",
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 0))
                                ],
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 3, color: Colors.white),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://c4.wallpaperflare.com/wallpaper/625/308/19/interior-vases-vase-stylish-wallpaper-thumb.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        //Title Container
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          child: const Text(
                            "Furniture",
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //2nd Category
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SingleCategory(
                                  tag: "8",
                                )));
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Image Container
                        Hero(
                          tag: "8",
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(0, 0))
                                ],
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 3, color: Colors.white),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://wallpapers.com/images/featured/1pf6px6ryqfjtnyr.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        //Title Container
                        Container(
                          alignment: Alignment.center,
                          width: 70,
                          child: const Text(
                            "Food",
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget newArrivalCon(String Image, String Title, String Price) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.5, color: Color(0xfff1f1f1)))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image Container
          // Container(
          //   padding: EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
          //   color: Color(0xffff9000),
          //   child: Text("NEW",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          // ),

          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(Image))),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xffff9000),
                        borderRadius: BorderRadius.circular(3)),
                    child: const Text(
                      "NEW",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),

          Flexible(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Title,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.75),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Text(
                    "£ ",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Price,
                    style: const TextStyle(fontSize: 18, color: Colors.green),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 7, bottom: 7, left: 25, right: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFF0071dc)),
                child: const Text(
                  "View Details",
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget topCategories2(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      padding: const EdgeInsets.all(15),
      color: const Color(0xffeef2f5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //1st Column
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //1st Category
                Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const SingleCategory(tag: "TC1")));
                      },
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            margin:
                                const EdgeInsets.only(right: 10, bottom: 10),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Smartphones",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Order from your favourite brand and what ever your like",
                                  style: TextStyle(fontSize: 12),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: 12,
                              left: 10,
                              right: 12,
                              child: Hero(
                                tag: "TC1",
                                child: Container(
                                  width: 75,
                                  height: 150,
                                  decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://imageio.forbes.com/specials-images/imageserve/60e48ef5423e512de205d104/Apple-iPhone-12-Pro--Pacific-Blue-/960x0.jpg?format=jpg&width=960"),
                                          colorFilter: ColorFilter.mode(
                                              Colors.white, BlendMode.dstIn),
                                          fit: BoxFit.cover)),
                                ),
                              ))
                        ],
                      ),
                    )),

                //2nd Category
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SingleCategory(tag: "TC2")));
                  },
                  child: Stack(children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10, bottom: 10),
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, right: 90, bottom: 10),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "Smartphone",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Enjoy up to 20% off and what ever your like",
                            style: TextStyle(fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 12,
                        right: 12,
                        child: Hero(
                          tag: "TC2",
                          child: Container(
                            width: 90,
                            height: 75,
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://imageio.forbes.com/specials-images/imageserve/60e48ef5423e512de205d104/Apple-iPhone-12-Pro--Pacific-Blue-/960x0.jpg?format=jpg&width=960"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ))
                  ]),
                ),

                //3rd Category
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SingleCategory(tag: "TC3")));
                  },
                  child: Stack(children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10, bottom: 10),
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, right: 90, bottom: 10),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "Food ",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Deals up to 40% off and what ever your like",
                            style: TextStyle(fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 13,
                        child: Hero(
                          tag: "TC3",
                          child: Container(
                            width: 90,
                            height: 75,
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/Italy_pasta-removebg-preview.png"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ))
                  ]),
                ),
              ],
            ),
          ),

          //2nd Column
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //4th Category
                Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const SingleCategory(tag: "TC4")));
                      },
                      child: Stack(children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          margin: const EdgeInsets.only(right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 0))
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                "Beauty",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Discover the latest trends and techniques in skincare, makeup, haircare, and more to help you look and feel your best.",
                                style: TextStyle(fontSize: 12),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            bottom: 10,
                            right: 13,
                            child: Hero(
                              tag: "TC4",
                              child: Container(
                                width: 100,
                                height: 75,
                                decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/Italy_pasta-removebg-preview.png"),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ))
                      ]),
                    )),

                //5th Category
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SingleCategory(tag: "TC5")));
                  },
                  child: Stack(children: [
                    Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      margin: const EdgeInsets.only(right: 10, bottom: 10),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "Furniture",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Everyday\nessentials",
                            style: TextStyle(fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 13,
                        child: Hero(
                          tag: "TC5",
                          child: Container(
                            width: 100,
                            height: 75,
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/Italy_pasta-removebg-preview.png"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ))
                  ]),
                ),

                //6th Category
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SingleCategory(tag: "TC6")));
                  },
                  child: Stack(children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, bottom: 10, right: 90),
                      margin: const EdgeInsets.only(right: 10, bottom: 10),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "Books",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Read out and save 25%\n",
                            style: TextStyle(fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 12,
                        right: 12,
                        child: Hero(
                          tag: "TC6",
                          child: Container(
                            width: 90,
                            height: 75,
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://imageio.forbes.com/specials-images/imageserve/60e48ef5423e512de205d104/Apple-iPhone-12-Pro--Pacific-Blue-/960x0.jpg?format=jpg&width=960"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ))
                  ]),
                ),

                //View All Categories
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const AllCategories()));
                  },
                  child: Stack(children: [
                    Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      margin: const EdgeInsets.only(right: 10, bottom: 10),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "View all",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Exotic\nCategories",
                            style: TextStyle(fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 12,
                        right: 12,
                        child: Container(
                          width: 90,
                          height: 75,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..scale(-1.0, 1.0, 1.0),
                              child: Icon(
                                Icons.more_outlined,
                                size: 40,
                                color: Colors.black.withOpacity(0.75),
                              )),
                        ))
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget topProducts(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 0),
      height: MediaQuery.of(context).size.height * 0.2,
      //color: Colors.red,
      child: ListView(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 0, top: 0),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          //1st Item
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) =>  const SingleProduct(
              //               tag: "TP1", productid: '123',
              //             )));

              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.85,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              offset: const Offset(0, -10),
                              blurRadius: 15,
                              spreadRadius: 1,
                            )
                          ],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.white),
                      child: const SingleProduct(
                        tag: 'TP1',
                        productid: '123',
                      ),
                    );
                  });
            },
            child: Container(
              //height: MediaQuery.of(context).size.height*0.2,
              margin: const EdgeInsets.only(right: 15),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xfff3f5f7)),
                  ),

                  //Title Positioned
                  Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Earbuds",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),

                  //Image Positioned
                  Positioned(
                      top: 0,
                      left: 10,
                      right: 10,
                      bottom: 50,
                      child: Hero(
                        tag: "TP1",
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/pngwing.com.png"),
                                  fit: BoxFit.cover)),
                        ),
                      )),

                  //Price Positioned
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 2, bottom: 2, left: 20, right: 20),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Color(0xfffd9926),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25))),
                        child: const Text(
                          "£ 149.99",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )),

                  // //Add Positioned
                  // Positioned(
                  //   left: 10,bottom: 40,
                  //   child: Container(
                  //     padding: const EdgeInsets.only(left: 10,right: 18,top: 8,bottom: 8),
                  //     decoration: BoxDecoration(
                  //         color: const Color(0xFF0071dc),
                  //         borderRadius: BorderRadius.circular(20)
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: const [
                  //         Padding(
                  //           padding: EdgeInsets.only(bottom: 1),
                  //           child: Icon(Icons.add,color: Colors.white,size: 14,weight: 0.1,),
                  //         ),
                  //         SizedBox(width: 5,),
                  //         Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),)
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),

          //2nd Item
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) =>  const SingleProduct(
              //               tag: "TP1", productid: '123',
              //             )));

              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.85,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              offset: const Offset(0, -10),
                              blurRadius: 15,
                              spreadRadius: 1,
                            )
                          ],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.white),
                      child: const SingleProduct(
                        tag: 'TP2',
                        productid: '1234',
                      ),
                    );
                  });
            },
            child: Container(
              //height: MediaQuery.of(context).size.height*0.2,
              margin: const EdgeInsets.only(right: 15),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xfff3f5f7)),
                  ),
                  Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Office Chair",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                  Positioned(
                      top: 0,
                      left: 10,
                      right: 10,
                      bottom: 50,
                      child: Hero(
                        tag: "TP2",
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/fusion-living-soho-black-plastic-dining-chair-with-black-metal-legs-p1535-16401_medium-removebg-preview.png"),
                                  fit: BoxFit.scaleDown)),
                        ),
                      )),

                  //Price Positioned
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 2, bottom: 2, left: 20, right: 20),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Color(0xfffd9926),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25))),
                        child: const Text(
                          "£ 149.99",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )),

                  // //Add Positioned
                  // Positioned(
                  //   left: 10,bottom: 40,
                  //   child: Container(
                  //     padding: const EdgeInsets.only(left: 10,right: 18,top: 8,bottom: 8),
                  //     decoration: BoxDecoration(
                  //         color: const Color(0xFF0071dc),
                  //         borderRadius: BorderRadius.circular(20)
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: const [
                  //         Padding(
                  //           padding: EdgeInsets.only(bottom: 1),
                  //           child: Icon(Icons.add,color: Colors.white,size: 14,weight: 0.1,),
                  //         ),
                  //         SizedBox(width: 5,),
                  //         Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),)
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),

          //3rd Item
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) =>  const SingleProduct(
              //               tag: "TP1", productid: '123',
              //             )));

              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.85,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              offset: const Offset(0, -10),
                              blurRadius: 15,
                              spreadRadius: 1,
                            )
                          ],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.white),
                      child: const SingleProduct(
                        tag: 'TP3',
                        productid: '12345',
                      ),
                    );
                  });
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              margin: const EdgeInsets.only(right: 15),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xfff3f5f7)),
                  ),
                  Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Electronics",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                  Positioned(
                      top: 0,
                      left: 10,
                      right: 10,
                      bottom: 50,
                      child: Hero(
                        tag: "TP3",
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/61-613567_kitchen-electrical-home-appliances-hd-png-download-removebg-preview.png"),
                                  fit: BoxFit.cover)),
                        ),
                      )),

                  //Price Positioned
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 2, bottom: 2, left: 20, right: 20),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Color(0xfffd9926),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25))),
                        child: const Text(
                          "£ 149.99",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )),

                  // //Add Positioned
                  // Positioned(
                  //   left: 0,top: 40,
                  //   child: Container(
                  //     padding: const EdgeInsets.only(left: 10,right: 18,top: 8,bottom: 8),
                  //     decoration: BoxDecoration(
                  //         color: const Color(0xFF0071dc),
                  //         borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomRight: Radius.circular(25))
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: const [
                  //         Padding(
                  //           padding: EdgeInsets.only(bottom: 1),
                  //           child: Icon(Icons.add,color: Colors.white,size: 14,weight: 0.1,),
                  //         ),
                  //         SizedBox(width: 5,),
                  //         Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),)
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget popularItemsCon(String tag) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 5, left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 0.5,
                spreadRadius: 1,
                offset: const Offset(0, 0))
          ]),
      child: Row(
        children: [
          //Image Container
          Hero(
            tag: tag,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: const Offset(0, 0))
                  ],
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://imageio.forbes.com/specials-images/imageserve/60e48ef5423e512de205d104/Apple-iPhone-12-Pro--Pacific-Blue-/960x0.jpg?format=jpg&width=960"))),
            ),
          ),

          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Apple iPhone 12 Pro Max, 256GB, Pacific Blue - Unlocked (Renewed Premium)",
                  style: TextStyle(fontSize: 15),
                ),
                Row(
                  children: const [
                    Text(
                      "£ ",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "480",
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget topBrandsCon(String brandName, String brandImage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    SingleBrand(tag: brandName, name: brandName)));
      },
      child: Container(
        padding:
            const EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: const Color(0xfff3f5f7),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: brandName,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(brandImage),
                        fit: BoxFit.scaleDown)),
              ),
            ),
            Text(
              brandName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7)),
            )
          ],
        ),
      ),
    );
  }

  Widget SearchBar() {
    return Container(
      height: 40,
      //width: MediaQuery.of(context).size.width*0.8,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xfff3f5f7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding:
                  const EdgeInsets.only(left: 5, right: 0, top: 0, bottom: 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xfff3f5f7)),
              child: const Icon(
                Icons.search,
                color: Colors.black,
                size: 22,
              )),
          const SizedBox(width: 10),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(bottom: 0),
            child: TextField(
              //controller: _searchCon,
              //focusNode: _focusNode,
              onChanged: (query) => setState(() {}),
              style:
                  const TextStyle(color: Colors.black, height: 1, fontSize: 15),
              decoration: const InputDecoration(
                  //prefixIcon: Icon(Icons.search, color: Color(0xFF5D5D67), size: 23),
                  hintText: "What are you looking for?",
                  hintStyle: TextStyle(color: Color(0xFF696969), fontSize: 15),
                  border: InputBorder.none),
            ),
          )),
        ],
      ),
    );
  }
}

Widget homepageDeals(BuildContext context, String imageurl, String dealTitle) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        //color: Colors.red,
        borderRadius: BorderRadius.circular(2)),
    child: Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.65)],
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              image: DecorationImage(
                  image: NetworkImage(imageurl), fit: BoxFit.fill)),
        ),
        Positioned(
            top: 15,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                dealTitle,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(2),
                  bottomLeft: Radius.circular(2)),
              //color: Colors.white70,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(2),
                  bottomLeft: Radius.circular(2)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(2),
                        bottomLeft: Radius.circular(2)),
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "See offers",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

launchURL(String URL) async {
  final url = URL;
  final uri = Uri.parse(url);

  await launchUrl(uri, mode: LaunchMode.externalApplication);
}
