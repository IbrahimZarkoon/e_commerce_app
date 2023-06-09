import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Widgets/Headings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/CartProvider.dart';
import '../Widgets/Drawer.dart';
import 'Dashboard.dart';
import 'MyCart.dart';
import 'SearchPage.dart';
import 'SingleCategory.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<String> depList = [
    "Deals",
    "Easter",
    "Grocery",
    "Home, Furniture & Appliances",
    "Electronics",
    "Beauty",
    "Baby"
  ];

  bool depart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          centerTitle: false,
          title: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SearchPage(
                            tag: "Menu",
                          )));
            },
            child: Container(
              height: 40,
              //width: MediaQuery.of(context).size.width*0.8,
              //margin: const EdgeInsets.all(20),
              padding:
                  const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: "Menu",
                    child: Container(
                        padding: const EdgeInsets.only(
                            left: 5, right: 0, top: 0, bottom: 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xffffffff)),
                        child: const Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 22,
                        )),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(bottom: 0),

                    child: Text(
                      "What are you looking for?",
                      style: const TextStyle(
                          color: Color(0xFF8F8F9E), fontSize: 13),
                    ),

                    // child: TextField(
                    //   onTap: ()
                    //   {
                    //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SearchPage()));
                    //   },
                    //   //controller: _searchCon,
                    //   //focusNode: _focusNode,
                    //   //onChanged: (query) => setState(() {}),
                    //   style: const TextStyle(color: Colors.black, height: 1, fontSize: 15),
                    //   decoration: InputDecoration(
                    //     //prefixIcon: Icon(Icons.search, color: Color(0xFF5D5D67), size: 23),
                    //       hintText: "What are you looking for?",
                    //       hintStyle: const TextStyle(color: Color(0xFF8F8F9E), fontSize: 15),
                    //       border: InputBorder.none),
                    // ),
                  )),
                ],
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF0071dc),
          elevation: 0.5,
          leadingWidth: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 25),
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const MyCart()),
                ),
                child: Stack(children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 27,
                  ),
                  Provider.of<CartProvider>(context).productsList.length > 0
                      ? Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50)),
                          ))
                      : const SizedBox()
                ]),
              ),
            )
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  foregroundDecoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.5)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/3/www.madebyvadim.com.jpg?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YWNjZXNzb3JpZXN8ZW58MHx8MHx8&w=1000&q=80"),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    top: 75,
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Try on",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ))
              ]),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, top: 0, bottom: 0),
                  itemCount: depList.length ?? 0,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {

                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context)

                              {
                                return subCategoryPage(context,"${depList[index]}");
                              });

                          // Navigator.push(
                          //     context,
                          //     CupertinoPageRoute(
                          //         builder: (BuildContext context) =>
                          //             SingleCategory(tag: "drawerItem$index")));
                        },
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 0, right: 0),
                              padding: const EdgeInsets.only(top: 0, bottom: 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                // boxShadow: [
                                //   BoxShadow(
                                //       offset: const Offset(0, 0),
                                //
                                //       blurRadius: 1.5,
                                //       color: Colors.black.withOpacity(0.2))
                                // ],
                              ),
                              child: Column(children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xffffffff),
                                  ),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    contentPadding: const EdgeInsets.all(0),

                                    title: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 15, left: 20, right: 15),
                                      child: Row(
                                        children: [
                                          //Icon(Icons.favorite_border_outlined,size: 18,color: Colors.black.withOpacity(0.7),),
                                          Text(
                                            depList[index],
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.75)),
                                          ),

                                          const Spacer(),

                                          Icon(
                                            Icons.keyboard_arrow_right_outlined,
                                            color:
                                                Colors.black.withOpacity(0.7),
                                          )
                                        ],
                                      ),
                                    ),

                                    // trailing:  Padding(
                                    //   padding: EdgeInsets.only(bottom: 15,left: 15,right: 15),
                                    //   child: Icon(Icons.keyboard_arrow_right_outlined,size: 20,color: Colors.black.withOpacity(0.6),),
                                    // ),

                                    //contentPadding: const EdgeInsets.all(10),

                                    style: ListTileStyle.drawer,
                                  ),
                                ),
                              ]),
                            ),

                            // //Shadow Line Container
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              decoration: const BoxDecoration(
                                color: Color(0xffd0d0d0),
                              ),
                            )
                            // index < depList.length - 1
                            //     ? Container(
                            //   width: MediaQuery.of(context)
                            //       .size
                            //       .width,
                            //   height: 1,
                            //   margin: const EdgeInsets.only(
                            //       left: 15, right: 15),
                            //   decoration: const BoxDecoration(
                            //     color: Color(0xffd0d0d0),
                            //   ),
                            // )
                            //     : GestureDetector(
                            //   onTap: () {
                            //     Navigator.push(
                            //         context,
                            //         CupertinoPageRoute(
                            //             builder: (_) =>
                            //                 DashboardPage(tabindex: 3)));
                            //   },
                            //   child: Container(
                            //     margin: EdgeInsets.only(
                            //         right: 20, top: 10),
                            //     child: Row(
                            //       mainAxisAlignment:
                            //       MainAxisAlignment.end,
                            //       crossAxisAlignment:
                            //       CrossAxisAlignment.center,
                            //       children: [
                            //         Container(
                            //             decoration: BoxDecoration(
                            //                 border: Border(
                            //                     bottom: BorderSide(
                            //                         color: Colors
                            //                             .black
                            //                             .withOpacity(
                            //                             0.7),
                            //                         width: 1.0))),
                            //             child: Text(
                            //               "View all",
                            //               style: TextStyle(
                            //                   fontSize: 14),
                            //             )),
                            //
                            //         //Icon(Icons.double_arrow_rounded,color: Colors.black.withOpacity(0.7),size: 19,),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ));
                  }),
              Headings(context, "Viral now"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 5, bottom: 5),
                  children: [
                    //1st Item
                    Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.2,
                        margin: EdgeInsets.only(right: 10),
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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://static.zara.net/photos///2023/V/0/1/p/1887/411/250/2/w/324/1887411250_2_1_1.jpg?ts=1675764550254"),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          child: Text(
                            textAlign: TextAlign.center,
                            "T-Shirts",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))
                    ]),

                    //2nd Item
                    Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.2,
                        margin: EdgeInsets.only(right: 10),
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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81JG5cRlrYL._UY575_.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          child: Text(
                            textAlign: TextAlign.center,
                            "Shoes",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))
                    ]),

                    //3rd Item
                    Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.2,
                        margin: EdgeInsets.only(right: 10),
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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.shopify.com/s/files/1/0445/4917/7499/products/MRFSBMF_499_GBF.jpg?v=1618909558"),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          child: Text(
                            textAlign: TextAlign.center,
                            "Shorts",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))
                    ]),

                    //4th Item
                    Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.2,
                        margin: EdgeInsets.only(right: 10),
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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://img.abercrombie.com/is/image/anf/KIC_155-2644-2982-278_prod1?policy=product-medium&wid=350&hei=438"),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          child: Text(
                            textAlign: TextAlign.center,
                            "Jeans",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ))
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget subCategoryPage(BuildContext context,String title)
  {
    return Container(
      height: MediaQuery.of(context).size.height*0.85,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,

        child: Column(

          children: [

            Headings(context, title),

            GridView(
              padding: EdgeInsets.only(bottom: 15,left: 15,right: 15,top: 15),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 0,
                crossAxisSpacing: 30,
                childAspectRatio: 0.75,


              ),

              children: [

                subCatContainer(context,"Bedding", "https://c1.wallpaperflare.com/preview/1002/272/31/architecture-building.jpg"),

                subCatContainer(context,"Kitchenware", "https://media.istockphoto.com/id/1318122151/photo/set-of-kitchen-knives-standing-on-the-table.jpg?s=612x612&w=0&k=20&c=C_GLD8HoEMifgILQCsAXN2o9fkMH15R0BIVNAq0BQkM="),

                subCatContainer(context,"Cookware", "https://c4.wallpaperflare.com/wallpaper/4/118/544/pots-pans-chrome-cookware-wallpaper-preview.jpg"),

                subCatContainer(context,"Kid's room", "https://c1.wallpaperflare.com/preview/128/979/632/children-s-for-girls-children-s-interior-children-the-child-s-bedroom.jpg"),

                subCatContainer(context,"Dining & entertainment", "https://c4.wallpaperflare.com/wallpaper/964/695/655/holiday-hd-fine-dining-set-wallpaper-preview.jpg"),

                subCatContainer(context,"Storage & organization", "https://cdn.wallpapersafari.com/51/51/tVO9I3.jpg")
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: shadowLine(context),
            ),

            Container(
              padding: const EdgeInsets.only(top: 20),
              child: CarouselSlider(
                  items: [
                    //1st Item
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        //color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.65)
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(15),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                                    fit: BoxFit.fill)),
                          ),

                          Positioned(
                              top: 15,
                              left: 0,
                              right: 0,
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  "Upto 50% Off On Furniture",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),

                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(14),
                                    bottomLeft: Radius.circular(14)),
                                //color: Colors.white70,
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(14),
                                    bottomLeft: Radius.circular(14)),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      const BorderRadius.only(
                                          bottomRight:
                                          Radius.circular(14),
                                          bottomLeft:
                                          Radius.circular(
                                              14)),
                                      color: Colors.white
                                          .withOpacity(0.3),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "See offers",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons
                                              .arrow_forward_ios_outlined,
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

                          // Positioned(
                          //     bottom: 0,left: 0,right: 0,
                          //     child: Container(
                          //       padding: EdgeInsets.only(top: 20,bottom: 20),
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(14),
                          //         color: Colors.white70
                          //
                          //       ),
                          //       child: Row(
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           Text("See offers",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          //
                          //           const SizedBox(width: 5,),
                          //
                          //           Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 18,)
                          //         ],
                          //       ),
                          //     ))
                        ],
                      ),
                    ),

                    //2nd Item
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        //color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.65)
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(15),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://www.rollingstone.com/wp-content/uploads/2020/02/best-4k-projector.jpg"),
                                    fit: BoxFit.fill)),
                          ),

                          Positioned(
                              top: 15,
                              left: 0,
                              right: 0,
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  "Upto 50% Off On Furniture",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),

                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(14),
                                    bottomLeft: Radius.circular(14)),
                                //color: Colors.white70,
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(14),
                                    bottomLeft: Radius.circular(14)),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      const BorderRadius.only(
                                          bottomRight:
                                          Radius.circular(14),
                                          bottomLeft:
                                          Radius.circular(
                                              14)),
                                      color: Colors.white
                                          .withOpacity(0.3),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "See offers",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons
                                              .arrow_forward_ios_outlined,
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

                          // Positioned(
                          //     bottom: 0,left: 0,right: 0,
                          //     child: Container(
                          //       padding: EdgeInsets.only(top: 20,bottom: 20),
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(14),
                          //         color: Colors.white70
                          //
                          //       ),
                          //       child: Row(
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           Text("See offers",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          //
                          //           const SizedBox(width: 5,),
                          //
                          //           Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 18,)
                          //         ],
                          //       ),
                          //     ))
                        ],
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                      height:
                      MediaQuery.of(context).size.height * 0.3,
                      aspectRatio: 0.9,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true)),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 40),
              child: shadowLine(context),
            ),

            GridView(
              padding: EdgeInsets.only(bottom: 15,left: 15,right: 15,top: 15),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 0,
                crossAxisSpacing: 30,
                childAspectRatio: 0.75,


              ),

              children: [

                subCatContainer(context,"Bedding", "https://c1.wallpaperflare.com/preview/1002/272/31/architecture-building.jpg"),

                subCatContainer(context,"Kitchenware", "https://media.istockphoto.com/id/1318122151/photo/set-of-kitchen-knives-standing-on-the-table.jpg?s=612x612&w=0&k=20&c=C_GLD8HoEMifgILQCsAXN2o9fkMH15R0BIVNAq0BQkM="),

                subCatContainer(context,"Cookware", "https://c4.wallpaperflare.com/wallpaper/4/118/544/pots-pans-chrome-cookware-wallpaper-preview.jpg"),

                subCatContainer(context,"Kid's room", "https://c1.wallpaperflare.com/preview/128/979/632/children-s-for-girls-children-s-interior-children-the-child-s-bedroom.jpg"),

                subCatContainer(context,"Dining & entertainment", "https://c4.wallpaperflare.com/wallpaper/964/695/655/holiday-hd-fine-dining-set-wallpaper-preview.jpg"),

                subCatContainer(context,"Storage & organization", "https://cdn.wallpapersafari.com/51/51/tVO9I3.jpg")
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget subCatContainer(BuildContext context,String title, String image)
  {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SingleCategory(tag: "${title + image}")));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: "${title + image}",
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1.5,
                        offset: Offset(0,0)
                    ),
                  ],
                  image: DecorationImage(image: NetworkImage(image),
                      fit: BoxFit.cover)
              ),
            ),
          ),

          const SizedBox(height: 10,),

          Text(title,style: TextStyle(),maxLines: 2,textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
