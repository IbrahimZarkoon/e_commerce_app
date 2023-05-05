import 'package:e_commerce/Screens/AddressBook.dart';
import 'package:e_commerce/Screens/Dashboard.dart';
import 'package:e_commerce/Screens/MyAccount.dart';
import 'package:e_commerce/Screens/MyOrders.dart';
import 'package:e_commerce/Screens/PaymentMethods.dart';
import 'package:e_commerce/Screens/PersonalDetails.dart';
import 'package:e_commerce/Screens/SearchPage.dart';
import 'package:e_commerce/Screens/SingleProduct.dart';
import 'package:e_commerce/Screens/WishlistPage.dart';
import 'package:e_commerce/Widgets/Drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SharedPreferences/Whishlist_Storage.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  bool wishlist = true;
//   final prefs = await SharedPreferences.getInstance();
//   final wishlistStorage = WishlistStorage(prefs);
//
// // Add an item to the wishlist
//   final item = WishlistItem(name: 'Product A', price: 10.0, imageUrl: 'https://example.com/product-a.jpg');
//   await wishlistStorage.addItem(item);
//
// // Remove an item from the wishlist
//   await wishlistStorage.removeItem(item);
//
// // Get all items in the wishlist
//   final items = wishlistStorage.getItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF0071dc),
        automaticallyImplyLeading: false,
        leading: Image.asset("assets/images/logo-removebg-preview.png"),
        leadingWidth: 125,
        actions:  [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.notification_add_outlined,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SearchPage()));
            },
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Hero(
                tag: "searchbar",
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              //Headings Container
              Container(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 15, right: 15),
                child: Row(
                  children: [
                    const Text("Hello, ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black87, fontSize: 19)),
                    const Text("Ibrahim Khan Zarkoon",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19)),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 25,
                      ),
                    )
                  ],
                ),
              ),

              //Top Grid Container
              Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.16,
                decoration: const BoxDecoration(
                    ),
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 4.5),
                  scrollDirection: Axis.vertical,
                  children: [
                    //1st Item
                    GestureDetector(
                      onTap: ()
                      {

                        Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => MyOrdersPage()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 0))
                            ]),
                        child: const Text("My Orders"),
                      ),
                    ),

                    //2nd Item
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 1,
                                spreadRadius: 1,
                                offset: const Offset(0, 0))
                          ]),
                      child: const Text("Buy Again"),
                    ),

                    //3rd Item
                    GestureDetector(
                      onTap: ()
                      {

                        Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => MyAccount()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 0))
                            ]),
                        child: const Text("My Account"),
                      ),
                    ),

                    //4th Item
                    GestureDetector(
                      onTap: ()
                      {

                        Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => WishlistPage()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 0))
                            ]),
                        child: const Text("My Wishlists"),
                      ),
                    ),
                  ],
                ),
              ),

              //My Orders Container
              Container(
                decoration: BoxDecoration(
                    // border: Border(
                    //     bottom: BorderSide(
                    //         color: Colors.black.withOpacity(0.15), width: 3)
                    // )
                ),
                padding: const EdgeInsets.only(
                    top: 0, bottom: 20, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text("My Orders",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Hi, you have no recent orders.",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black87, fontSize: 15)),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (BuildContext context) =>
                                  DashboardPage(tabindex: 0))),
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        //height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 0))
                            ]),
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 20, right: 20),
                        child: const Text(
                          "Return to the Homepage",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              shadowLine(context),

              //My Wishlists Container
              Container(
                // decoration: BoxDecoration(
                //     border: Border(
                //         bottom: BorderSide(
                //             color: Colors.black.withOpacity(0.15), width: 3))),
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text("My Wishlists",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),

                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (BuildContext context) =>
                                  const WishlistPage())),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.7),width: 1.0))
                              ),
                              child: const Text("View all",style: TextStyle(fontSize: 12),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    wishlist?
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.15,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 5),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: ()
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => SingleProduct(tag: "wish$index", productid: "productid")));
                            },
                            child: Stack(
                                children: [

                                  //Image Container
                                  Hero(
                                    tag: "wish$index",
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      width: 125,
                                      height: 125,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black.withOpacity(0.2),
                                                offset: const Offset(0,0),
                                                spreadRadius: 0,
                                                blurRadius: 1.5
                                            )
                                          ],
                                          borderRadius: BorderRadius.circular(15),
                                          image: const DecorationImage(image: NetworkImage("https://selectronics.com.pk/wp-content/uploads/2022/11/Mix-Products-47-300x300.jpg"),
                                              fit: BoxFit.contain)
                                      ),
                                    ),
                                  ),

                                  //Title Positioned
                                  Positioned(
                                      left: 5,right: 25,bottom: 10,
                                      child: Container(
                                        child: const Text("42' EcoStar QLED",style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),
                                      )),

                                  //Price Positioned
                                  Positioned(
                                      top: 0,right: 20,
                                      child: Container(
                                        decoration:  BoxDecoration(
                                          color: Colors.red.withOpacity(0.95),
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(0),topLeft: Radius.circular(0),bottomLeft:  Radius.circular(8)),

                                        ),
                                        padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                        child: Text("£ 109.99",style: TextStyle(fontSize: 12,color: Colors.white),),
                                      )
                                  )
                                ]
                            ),
                          );
                          },
                        // children: [
                        //
                        //   //Wishlist Container
                        //   Stack(
                        //     children: [
                        //
                        //       //Image Container
                        //       Container(
                        //       margin: const EdgeInsets.only(right: 20),
                        //       width: 125,
                        //       height: 125,
                        //       decoration: BoxDecoration(
                        //           color: Colors.white,
                        //           boxShadow: [
                        //             BoxShadow(
                        //                 color: Colors.black.withOpacity(0.2),
                        //                 offset: const Offset(0,0),
                        //                 spreadRadius: 0,
                        //                 blurRadius: 1.5
                        //             )
                        //           ],
                        //           borderRadius: BorderRadius.circular(15),
                        //           image: const DecorationImage(image: NetworkImage("https://selectronics.com.pk/wp-content/uploads/2022/11/Mix-Products-47-300x300.jpg"),
                        //               fit: BoxFit.contain)
                        //       ),
                        //     ),
                        //
                        //       //Title Positioned
                        //       Positioned(
                        //         left: 5,right: 25,bottom: 10,
                        //           child: Container(
                        //             child: const Text("42' EcoStar QLED",style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),
                        //           )),
                        //
                        //       //Price Positioned
                        //       Positioned(
                        //         top: 0,right: 20,
                        //           child: Container(
                        //             decoration:  BoxDecoration(
                        //               color: Colors.red.withOpacity(0.95),
                        //               borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(0),topLeft: Radius.circular(0),bottomLeft:  Radius.circular(8)),
                        //
                        //             ),
                        //             padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                        //             child: Text("£ 109.99",style: TextStyle(fontSize: 12,color: Colors.white),),
                        //           )
                        //       )
                        //     ]
                        //   ),
                        //
                        //   //Wishlist Container
                        //   Stack(
                        //       children: [
                        //
                        //         //Image Container
                        //         Container(
                        //           margin: const EdgeInsets.only(right: 20),
                        //           width: 125,
                        //           height: 125,
                        //           decoration: BoxDecoration(
                        //               color: Colors.white,
                        //               boxShadow: [
                        //                 BoxShadow(
                        //                     color: Colors.black.withOpacity(0.2),
                        //                     offset: const Offset(0,0),
                        //                     spreadRadius: 0,
                        //                     blurRadius: 1.5
                        //                 )
                        //               ],
                        //               borderRadius: BorderRadius.circular(15),
                        //               image: const DecorationImage(image: NetworkImage("https://selectronics.com.pk/wp-content/uploads/2022/11/Mix-Products-47-300x300.jpg"),
                        //                   fit: BoxFit.contain)
                        //           ),
                        //         ),
                        //
                        //         //Title Positioned
                        //         Positioned(
                        //             left: 5,right: 25,bottom: 10,
                        //             child: Container(
                        //               child: const Text("42' EcoStar QLED",style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),
                        //             )),
                        //
                        //         //Price Positioned
                        //         Positioned(
                        //             top: 0,right: 20,
                        //             child: Container(
                        //               decoration:  BoxDecoration(
                        //                 color: Colors.red.withOpacity(0.95),
                        //                 borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(0),topLeft: Radius.circular(0),bottomLeft:  Radius.circular(8)),
                        //
                        //               ),
                        //               padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                        //               child: Text("£ 109.99",style: TextStyle(fontSize: 12,color: Colors.white),),
                        //             )
                        //         )
                        //       ]
                        //   ),
                        //
                        //   //Wishlist Container
                        //   Stack(
                        //       children: [
                        //
                        //         //Image Container
                        //         Container(
                        //           margin: const EdgeInsets.only(right: 20),
                        //           width: 125,
                        //           height: 125,
                        //           decoration: BoxDecoration(
                        //               color: Colors.white,
                        //               boxShadow: [
                        //                 BoxShadow(
                        //                     color: Colors.black.withOpacity(0.2),
                        //                     offset: const Offset(0,0),
                        //                     spreadRadius: 0,
                        //                     blurRadius: 1.5
                        //                 )
                        //               ],
                        //               borderRadius: BorderRadius.circular(15),
                        //               image: const DecorationImage(image: NetworkImage("https://selectronics.com.pk/wp-content/uploads/2022/11/Mix-Products-47-300x300.jpg"),
                        //                   fit: BoxFit.contain)
                        //           ),
                        //         ),
                        //
                        //         //Title Positioned
                        //         Positioned(
                        //             left: 5,right: 25,bottom: 10,
                        //             child: Container(
                        //               child: const Text("42' EcoStar QLED",style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),
                        //             )),
                        //
                        //         //Price Positioned
                        //         Positioned(
                        //             top: 0,right: 20,
                        //             child: Container(
                        //               decoration:  BoxDecoration(
                        //                 color: Colors.red.withOpacity(0.95),
                        //                 borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(0),topLeft: Radius.circular(0),bottomLeft:  Radius.circular(8)),
                        //
                        //               ),
                        //               padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                        //               child: Text("£ 109.99",style: TextStyle(fontSize: 12,color: Colors.white),),
                        //             )
                        //         )
                        //       ]
                        //   ),
                        //
                        //   //Wishlist Container
                        //   Stack(
                        //       children: [
                        //
                        //         //Image Container
                        //         Container(
                        //           margin: const EdgeInsets.only(right: 20),
                        //           width: 125,
                        //           height: 125,
                        //           decoration: BoxDecoration(
                        //               color: Colors.white,
                        //               boxShadow: [
                        //                 BoxShadow(
                        //                     color: Colors.black.withOpacity(0.2),
                        //                     offset: const Offset(0,0),
                        //                     spreadRadius: 0,
                        //                     blurRadius: 1.5
                        //                 )
                        //               ],
                        //               borderRadius: BorderRadius.circular(15),
                        //               image: const DecorationImage(image: NetworkImage("https://selectronics.com.pk/wp-content/uploads/2022/11/Mix-Products-47-300x300.jpg"),
                        //                   fit: BoxFit.contain)
                        //           ),
                        //         ),
                        //
                        //         //Title Positioned
                        //         Positioned(
                        //             left: 5,right: 25,bottom: 10,
                        //             child: Container(
                        //               child: const Text("42' EcoStar QLED",style: TextStyle(fontSize: 12),textAlign: TextAlign.center,),
                        //             )),
                        //
                        //         //Price Positioned
                        //         Positioned(
                        //             top: 0,right: 20,
                        //             child: Container(
                        //               decoration:  BoxDecoration(
                        //                 color: Colors.red.withOpacity(0.95),
                        //                 borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(0),topLeft: Radius.circular(0),bottomLeft:  Radius.circular(8)),
                        //
                        //               ),
                        //               padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                        //               child: Text("£ 109.99",style: TextStyle(fontSize: 12,color: Colors.white),),
                        //             )
                        //         )
                        //       ]
                        //   ),
                        //
                        //
                        // ],
                      ),
                    )
                    :
                    //create a list column
                    Column(
                      children: [
                        const Text("You haven't created any lists.",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black87, fontSize: 15)),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          //height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 0))
                              ]),
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 20, right: 20),
                          child: const Text(
                            "Create a List",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              shadowLine(context),

              //My Account Container
              Container(
                // decoration: BoxDecoration(
                //     border: Border(
                //         bottom: BorderSide(
                //             color: Colors.black.withOpacity(0.15), width: 3))),
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text("My Account",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),

                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (BuildContext context) =>
                                  const MyAccount())),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.7),width: 1.0))
                              ),
                              child: const Text("View all",style: TextStyle(fontSize: 12),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.075,
                      child: ListView(
                        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 5),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [

                          //Personal Details
                          GestureDetector(
                            onTap: ()
                            {
                              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => PersonalDetails()));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        offset: const Offset(0,0)
                                    )
                                  ]
                              ),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                              child: const Text("Personal Details"),
                            ),
                          ),

                          //Address Book
                          GestureDetector(
                            onTap: ()
                            {
                              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => AddressBook()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: const Offset(0,0)
                                  )
                                ]
                              ),
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(right: 10),

                              padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),

                              child: const Text("Address Book"),
                            ),
                          ),

                          //Payment Methods
                          GestureDetector(
                            onTap: ()
                            {
                              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => PaymentMethods()));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        offset: const Offset(0,0)
                                    )
                                  ]
                              ),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),

                              child: const Text("Payment Methods"),
                            ),
                          ),

                          //Contact us
                          Container(
                            margin: const EdgeInsets.only(right: 10),

                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(0,0)
                                  )
                                ]
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),

                            child: const Text("Contact Us"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              shadowLine(context),


              //Gift Card Container
              Container(
                // decoration: BoxDecoration(
                //     border: Border(
                //         bottom: BorderSide(
                //             color: Colors.black.withOpacity(0.15), width: 3))),
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text("Gift Card Balance: £ 0.00",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.075,
                      child: ListView(
                        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 5),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [

                          //Redeem Gift Card Container
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(0,0)
                                  )
                                ]
                            ),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),

                            child: const Text("Redeem Gift Card"),
                          ),

                          //Reload Balance
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.15),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: const Offset(0,0)
                                  )
                                ]
                            ),
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 10),

                            padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),


                            child: const Text("Reload Balance"),
                          ),

                        ],
                      ),
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
}
