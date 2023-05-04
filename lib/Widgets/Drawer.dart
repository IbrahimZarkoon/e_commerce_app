import 'package:e_commerce/Screens/AllCategories.dart';
import 'package:e_commerce/Screens/Dashboard.dart';
import 'package:e_commerce/Screens/MyAccount.dart';
import 'package:e_commerce/Screens/MyOrders.dart';
import 'package:e_commerce/Screens/MyProfile.dart';
import 'package:e_commerce/Screens/SignIN.dart';
import 'package:e_commerce/Screens/SingleCategory.dart';
import 'package:e_commerce/Screens/SingleProduct.dart';
import 'package:e_commerce/Screens/WishlistPage.dart';
import 'package:e_commerce/Widgets/DrawerAccordian.dart';
import 'package:e_commerce/Widgets/Headings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Screens/HomePage.dart';
import '../Screens/OrderHistory.dart';

class customDrawer extends StatefulWidget {
  const customDrawer(BuildContext context, {Key? key}) : super(key: key);

  @override
  State<customDrawer> createState() => _customDrawerState();
}

class _customDrawerState extends State<customDrawer> {
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
    return SafeArea(
      child: Drawer(
        child: depart
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          depart = false;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10, top: 20, bottom: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text("Departments",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17)),
                          ],
                        ),
                      ),
                    ),

                    //Shadow Line Container
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      decoration: const BoxDecoration(
                        color: Color(0xffd0d0d0),
                      ),
                    ),

                    Flexible(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(left: 0, right: 0),
                          itemCount: depList.length ?? 0,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (BuildContext context) =>
                                              SingleCategory(
                                                  tag: "drawerItem$index")));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 0,
                                          right: 0),
                                      padding: const EdgeInsets.only(
                                          top: 0, bottom: 0),
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
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: const Color(0xffffffff),
                                          ),
                                          child: ListTile(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            contentPadding:
                                                const EdgeInsets.all(0),

                                            title: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 15,
                                                  left: 20,
                                                  right: 15),
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
                                                    Icons
                                                        .keyboard_arrow_right_outlined,
                                                    color: Colors.black
                                                        .withOpacity(0.7),
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

                                    //Shadow Line Container
                                    index < depList.length - 1
                                        ? Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 1,
                                            margin: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            decoration: const BoxDecoration(
                                              color: Color(0xffd0d0d0),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (_) =>
                                                          DashboardPage(tabindex: 2)));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 20, top: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.7),
                                                                  width: 1.0))),
                                                      child: Text(
                                                        "View all",
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      )),

                                                  //Icon(Icons.double_arrow_rounded,color: Colors.black.withOpacity(0.7),size: 19,),
                                                ],
                                              ),
                                            ),
                                          ),
                                  ],
                                ));
                          }),
                    ),
                  ],
                ),
              )
            : Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  // image: DecorationImage(
                  //     image: AssetImage(
                  //         "assets/icon/FBV background image purple.png"),
                  //     fit: BoxFit.cover)
                ),
                //width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*.925,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 75,
                          width: 100,
                          //margin: EdgeInsets.only(top: 33,bottom: 15),
                          //padding: EdgeInsets.only(top: 80,bottom: 40),
                          //height: MediaQuery.of(context).size.height*0.08,
                          decoration: const BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/logo.png"),
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.scaleDown)),
                        ),
                        Flexible(
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const SignIn())),
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(7),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: const Color(0xFF0071dc),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Hero(
                                tag: "login",
                                child: Text(
                                  "Sign in or create account",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            //Amazon Prime Container
                            GestureDetector(
                              onTap: () {
                                //Navigator.push(context, CupertinoPageRoute(builder: (_) => const MyProfile()));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 0, right: 0),
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 0),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffffffff),
                                    ),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: const EdgeInsets.all(0),

                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 15, left: 15, right: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.workspace_premium,
                                              size: 18,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Amazon+",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.75)),
                                            ),
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
                            ),

                            //Shadow Line Container
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              decoration: const BoxDecoration(
                                color: Color(0xffd0d0d0),
                              ),
                            ),

                            //Order History Container
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, CupertinoPageRoute(builder: (_) => OrderHistoryPage()));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 0, right: 0),
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 0),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffffffff),
                                    ),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: const EdgeInsets.all(0),

                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 15, left: 15, right: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.receipt_long_outlined,
                                              size: 18,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Order History",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.75)),
                                            ),
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
                            ),

                            //MyOrders Container
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, CupertinoPageRoute(builder: (_) => MyOrdersPage()));

                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 0, right: 0),
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 0),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffffffff),
                                    ),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: const EdgeInsets.all(0),

                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 15, left: 15, right: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.inventory_outlined,
                                              size: 18,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "My Orders",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.75)),
                                            ),
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
                            ),

                            //Account Container
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (_) => const MyAccount()));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 0, right: 0),
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 0),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffffffff),
                                    ),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: const EdgeInsets.all(0),

                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 15, left: 15, right: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.account_box_outlined,
                                              size: 18,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Account",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.75)),
                                            ),
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
                            ),

                            //Shadow Line Container
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              decoration: const BoxDecoration(
                                color: Color(0xffd0d0d0),
                              ),
                            ),

                            // DrawerAccordian(title: "Shop by Department",
                            //     content: GridView.builder(
                            //     shrinkWrap: true,
                            //     physics: const BouncingScrollPhysics(),
                            //     padding: const EdgeInsets.only(left: 5, right: 5),
                            //     itemCount: depList.length ?? 0,
                            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            //       childAspectRatio: 7.5,
                            //       crossAxisCount: 1,
                            //       crossAxisSpacing: 0,
                            //       mainAxisSpacing: 10
                            //     ),
                            //
                            //     itemBuilder: (BuildContext context, index) {
                            //       //   bool decision = false;
                            //       // if (allStores?[index]?.name?.toLowerCase().startsWith(alphabet) == true) {
                            //       //   print(allStores?[index]?.name);
                            //       //   decision = true;
                            //       // }
                            //       //if(index >= num.parse("${storeDataList?.length ?? 0}")) return null;
                            //       return GestureDetector(
                            //         behavior: HitTestBehavior.opaque,
                            //         onTap: ()
                            //         {
                            //           Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) =>  SingleCategory(tag: "drawerItem$index")));
                            //         },
                            //         child: Padding(
                            //           padding: const EdgeInsets.all(0.0),
                            //           child: Row(
                            //             crossAxisAlignment: CrossAxisAlignment.center,
                            //             children:  [
                            //               // Icon(
                            //               //     Icons.arrow_forward_ios_outlined,
                            //               //     size: 15,color: Color(0xff676767)
                            //               // ),
                            //               // SizedBox(
                            //               //   width: 2,
                            //               // ),
                            //               Expanded(
                            //                   child: Text(
                            //                     "${depList[index]}",
                            //                     style: TextStyle(fontSize: 13,fontFamily: "Fira-SemiBold",color: Colors.black.withOpacity(0.6)),
                            //                     softWrap: true,
                            //                     overflow: TextOverflow.ellipsis,
                            //                   )),
                            //
                            //               const Icon(
                            //                   Icons.arrow_forward_ios_outlined,
                            //                   size: 12,color: Color(0xff676767)
                            //               ),
                            //
                            //             ],
                            //           ),
                            //         ),
                            //       );
                            //     })
                            // ),

                            //Shop By Department
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  depart = true;
                                });
                                //launchURL("https://www.whatsapp.com/");
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 0, right: 0),
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 0),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffffffff),
                                    ),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: const EdgeInsets.all(0),

                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 15, left: 15, right: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.category_outlined,
                                              size: 18,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Shop By Department",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.75)),
                                            ),
                                            const Spacer(),
                                            Icon(
                                              Icons
                                                  .keyboard_arrow_right_outlined,
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
                            ),

                            //Shadow Line Container
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              decoration: const BoxDecoration(
                                color: Color(0xffd0d0d0),
                              ),
                            ),

                            //Lists Container
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => WishlistPage()));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 0, right: 0),
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 0),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffffffff),
                                    ),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: const EdgeInsets.all(0),

                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 15, left: 15, right: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.favorite_border_outlined,
                                              size: 18,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Wishlists",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.75)),
                                            ),
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
                            ),

                            //Registries Container
                            GestureDetector(
                              onTap: () {
                                launchURL("https://www.whatsapp.com/");
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 0, right: 0),
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 0),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffffffff),
                                    ),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: const EdgeInsets.all(0),

                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 15, left: 15, right: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.card_giftcard_outlined,
                                              size: 18,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Registries",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.75)),
                                            ),
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
                            ),

                            //Shadow Line Container
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              decoration: const BoxDecoration(
                                color: Color(0xffd0d0d0),
                              ),
                            ),

                            DrawerAccordian(
                                title: "Settings",
                                content: GridView(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 7.5,
                                          crossAxisCount: 1,
                                          crossAxisSpacing: 0,
                                          mainAxisSpacing: 10),
                                  children: [
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        //Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) =>  SingleCategory(tag: "drawerItem$index")));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            // Icon(
                                            //     Icons.arrow_forward_ios_outlined,
                                            //     size: 15,color: Color(0xff676767)
                                            // ),
                                            // SizedBox(
                                            //   width: 2,
                                            // ),
                                            const Expanded(
                                                child: Text(
                                              "Rate Our App",
                                              style: TextStyle(
                                                  fontFamily: "Fira-SemiBold",
                                                  color: Color(0xff676767)),
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),

                                    //Legal and About Container
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        //Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) =>  SingleCategory(tag: "drawerItem$index")));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            // Icon(
                                            //     Icons.arrow_forward_ios_outlined,
                                            //     size: 15,color: Color(0xff676767)
                                            // ),
                                            // SizedBox(
                                            //   width: 2,
                                            // ),
                                            const Expanded(
                                                child: Text(
                                              "Legal & About",
                                              style: TextStyle(
                                                  fontFamily: "Fira-SemiBold",
                                                  color: Color(0xff676767)),
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),

                            //Shadow Line Container
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              decoration: const BoxDecoration(
                                color: Color(0xffd0d0d0),
                              ),
                            ),

                            //Help Container
                            GestureDetector(
                              onTap: () {
                                //launchURL("https://www.whatsapp.com/");
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 0, right: 0),
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 0),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffffffff),
                                    ),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: const EdgeInsets.all(0),

                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 15, left: 15, right: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.help_outline,
                                              size: 18,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Help",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.75)),
                                            ),
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
                            ),

                            //Customer Service Container
                            GestureDetector(
                              onTap: () {
                                launchURL("https://www.whatsapp.com/");
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 0, right: 0),
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 0),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffffffff),
                                    ),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: const EdgeInsets.all(0),

                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 15, left: 15, right: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.contact_page_outlined,
                                              size: 18,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Customer Service",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.75)),
                                            ),
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
                            ),

                            //Shadow Line Container
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              decoration: const BoxDecoration(
                                color: Color(0xffd0d0d0),
                              ),
                            ),

                            //Give Feedback Container
                            GestureDetector(
                              onTap: () {
                                //Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => const SignIn()));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 0, right: 0),
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 0),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffffffff),
                                    ),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: const EdgeInsets.all(0),

                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 15, left: 15, right: 15),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.chat_outlined,
                                              size: 18,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Give Feedback",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.75)),
                                            ),
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
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Expanded(
                    //   flex: 10,
                    //   child: Column(
                    //     children: [
                    //       GestureDetector(
                    //           onTap: ()
                    //           {
                    //             Navigator.pushReplacement(context,customfromLeftRoute(DashboardPage(tabindex: 2)));
                    //           },
                    //           child: menuContainer("All Stores",const Icon(Icons.store_mall_directory_outlined,size: 23,color: Colors.white,))),
                    //
                    //       GestureDetector(
                    //           onTap: (){
                    //             Navigator.pushReplacement(context,customfromLeftRoute(DashboardPage(tabindex: 3)));
                    //           },
                    //           child: menuContainer("All Categories",const Icon(Icons.category_outlined,size: 23,color: Colors.white,))),
                    //
                    //       GestureDetector(
                    //           onTap: (){
                    //             launchAboutus();
                    //           },
                    //           child: menuContainer("About Us",const Icon(Icons.info_outline,size: 23,color: Colors.white,))),
                    //
                    //       GestureDetector(
                    //           onTap: ()
                    //           {
                    //             launchBlog();
                    //           },
                    //           child: menuContainer("Blog",const Icon(Icons.contact_page,size: 23,color: Colors.white,))),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
      ),
    );
  }
}

// Widget customDrawer(BuildContext context,Function setter)
// {
//   List<String> depList = ["Deals","Easter","Grocery","Home,Furniture & Appliances","Electronics","Beauty","Baby"];
//
//   bool depart = false;
//
//   return SafeArea(
//     child: Drawer(
//       child: depart? Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: GridView.builder(
//             shrinkWrap: true,
//             physics: const BouncingScrollPhysics(),
//             padding: const EdgeInsets.only(left: 5, right: 5),
//             itemCount: depList.length ?? 0,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 childAspectRatio: 7.5,
//                 crossAxisCount: 1,
//                 crossAxisSpacing: 0,
//                 mainAxisSpacing: 10
//             ),
//
//             itemBuilder: (BuildContext context, index) {
// //   bool decision = false;
// // if (allStores?[index]?.name?.toLowerCase().startsWith(alphabet) == true) {
// //   print(allStores?[index]?.name);
// //   decision = true;
// // }
// //if(index >= num.parse("${storeDataList?.length ?? 0}")) return null;
//               return GestureDetector(
//                 behavior: HitTestBehavior.opaque,
//                 onTap: ()
//                 {
//                   Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) =>  SingleCategory(tag: "drawerItem$index")));
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(0.0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children:  [
// // Icon(
// //     Icons.arrow_forward_ios_outlined,
// //     size: 15,color: Color(0xff676767)
// // ),
// // SizedBox(
// //   width: 2,
// // ),
//                       Expanded(
//                           child: Text(
//                             "${depList[index]}",
//                             style: TextStyle(fontSize: 13,fontFamily: "Fira-SemiBold",color: Colors.black.withOpacity(0.6)),
//                             softWrap: true,
//                             overflow: TextOverflow.ellipsis,
//                           )),
//
//                       const Icon(
//                           Icons.arrow_forward_ios_outlined,
//                           size: 12,color: Color(0xff676767)
//                       ),
//
//                     ],
//                   ),
//                 ),
//               );
//             }),
//       ) : Container(
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//             color: Color(0xffffffff),
//             // image: DecorationImage(
//             //     image: AssetImage(
//             //         "assets/icon/FBV background image purple.png"),
//             //     fit: BoxFit.cover)
//         ),
//         //width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*.925,
//
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//
//             Row(
//               children: [
//                 Container(
//                   height: 75,
//                   width: 100,
//                   //margin: EdgeInsets.only(top: 33,bottom: 15),
//                   //padding: EdgeInsets.only(top: 80,bottom: 40),
//                   //height: MediaQuery.of(context).size.height*0.08,
//                   decoration: const BoxDecoration(
//                       color: Colors.transparent,
//                       image: DecorationImage(
//                           image: AssetImage("assets/images/logo.png"),
//                           filterQuality: FilterQuality.high,
//                           fit: BoxFit.scaleDown)),
//                 ),
//
//                 Flexible(
//                   child: GestureDetector(
//                     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const SignIn())),
//                     child: Container(
//                       alignment: Alignment.center,
//                       padding: const EdgeInsets.all(7),
//                       margin: const EdgeInsets.only(right: 10),
//                       decoration: BoxDecoration(
//                         color: const Color(0xffff9000),
//                         borderRadius: BorderRadius.circular(20)
//                       ),
//                       child: const Hero(
//                         tag: "login",
//                         child: Text("Sign in or create account",style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold
//                         ),),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 scrollDirection: Axis.vertical,
//                 child: Column(
//                   children: [
//
//                     //Amazon Prime Container
//                     GestureDetector(
//                       onTap: ()
//                       {
//                         //Navigator.push(context, CupertinoPageRoute(builder: (_) => const MyProfile()));
//                       },
//
//                       child: Container(
//                         margin: const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
//                         padding: const EdgeInsets.only(top: 0, bottom: 0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5),
//                           // boxShadow: [
//                           //   BoxShadow(
//                           //       offset: const Offset(0, 0),
//                           //
//                           //       blurRadius: 1.5,
//                           //       color: Colors.black.withOpacity(0.2))
//                           // ],
//                         ),
//                         child: Column(
//                             children: [
//                               Container(
//                                 height: MediaQuery.of(context).size.height*0.05,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: const Color(0xffffffff),
//
//                                 ),
//                                 child: ListTile(
//
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(5)),
//                                   contentPadding: const EdgeInsets.all(0),
//
//                                   title: Padding(
//                                     padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                     child: Row(
//                                       children: [
//
//                                         Icon(Icons.workspace_premium,size: 18,color: Colors.black.withOpacity(0.7),),
//
//                                         const SizedBox(width: 5,),
//
//                                         Text("Amazon+",style: TextStyle(color: Colors.black.withOpacity(0.75)),),
//                                       ],
//                                     ),
//                                   ),
//
//                                   // trailing:  Padding(
//                                   //   padding: EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                   //   child: Icon(Icons.keyboard_arrow_right_outlined,size: 20,color: Colors.black.withOpacity(0.6),),
//                                   // ),
//
//                                   //contentPadding: const EdgeInsets.all(10),
//
//                                   style: ListTileStyle.drawer,
//
//                                 ),
//                               ),
//                             ]),
//                       ),
//                     ),
//
//                     //Shadow Line Container
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 1,
//                       margin: const EdgeInsets.only(left: 15,right: 15),
//                       decoration: const BoxDecoration(
//                         color: Color(0xffd0d0d0),
//                       ),
//                     ),
//
//                     //Purchase History Container
//                     GestureDetector(
//                       onTap: ()
//                       {
//                         //launchURL("https://www.whatsapp.com/");
//                       },
//
//                       child: Container(
//                         margin: const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
//                         padding: const EdgeInsets.only(top: 0, bottom: 0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5),
//                           // boxShadow: [
//                           //   BoxShadow(
//                           //       offset: const Offset(0, 0),
//                           //
//                           //       blurRadius: 1.5,
//                           //       color: Colors.black.withOpacity(0.2))
//                           // ],
//                         ),
//                         child: Column(
//                             children: [
//                               Container(
//                                 height: MediaQuery.of(context).size.height*0.05,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: const Color(0xffffffff),
//
//                                 ),
//                                 child: ListTile(
//
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(5)),
//                                   contentPadding: const EdgeInsets.all(0),
//
//                                   title: Padding(
//                                     padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                     child: Row(
//                                       children: [
//
//                                         Icon(Icons.receipt_long_outlined,size: 18,color: Colors.black.withOpacity(0.7),),
//
//                                         const SizedBox(width: 5,),
//
//                                         Text("Purchase History",style: TextStyle(color: Colors.black.withOpacity(0.75)),),
//                                       ],
//                                     ),
//                                   ),
//
//                                   // trailing:  Padding(
//                                   //   padding: EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                   //   child: Icon(Icons.keyboard_arrow_right_outlined,size: 20,color: Colors.black.withOpacity(0.6),),
//                                   // ),
//
//                                   //contentPadding: const EdgeInsets.all(10),
//
//                                   style: ListTileStyle.drawer,
//
//                                 ),
//                               ),
//                             ]),
//                       ),
//                     ),
//
//                     //My Items Container
//                     GestureDetector(
//                       onTap: ()
//                       {
//                         //launchURL("https://www.whatsapp.com/");
//                       },
//
//                       child: Container(
//                         margin: const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
//                         padding: const EdgeInsets.only(top: 0, bottom: 0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5),
//                           // boxShadow: [
//                           //   BoxShadow(
//                           //       offset: const Offset(0, 0),
//                           //
//                           //       blurRadius: 1.5,
//                           //       color: Colors.black.withOpacity(0.2))
//                           // ],
//                         ),
//                         child: Column(
//                             children: [
//                               Container(
//                                 height: MediaQuery.of(context).size.height*0.05,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: const Color(0xffffffff),
//
//                                 ),
//                                 child: ListTile(
//
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(5)),
//                                   contentPadding: const EdgeInsets.all(0),
//
//                                   title: Padding(
//                                     padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                     child: Row(
//                                       children: [
//
//                                         Icon(Icons.inventory_outlined,size: 18,color: Colors.black.withOpacity(0.7),),
//
//                                         const SizedBox(width: 5,),
//
//                                         Text("My Items",style: TextStyle(color: Colors.black.withOpacity(0.75)),),
//                                       ],
//                                     ),
//                                   ),
//
//                                   // trailing:  Padding(
//                                   //   padding: EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                   //   child: Icon(Icons.keyboard_arrow_right_outlined,size: 20,color: Colors.black.withOpacity(0.6),),
//                                   // ),
//
//                                   //contentPadding: const EdgeInsets.all(10),
//
//                                   style: ListTileStyle.drawer,
//
//                                 ),
//                               ),
//                             ]),
//                       ),
//                     ),
//
//                     //Account Container
//                     GestureDetector(
//                       onTap: ()
//                       {
//                         Navigator.push(context, CupertinoPageRoute(builder: (_) => const MyProfile()));
//                       },
//
//                       child: Container(
//                         margin: const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
//                         padding: const EdgeInsets.only(top: 0, bottom: 0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5),
//                           // boxShadow: [
//                           //   BoxShadow(
//                           //       offset: const Offset(0, 0),
//                           //
//                           //       blurRadius: 1.5,
//                           //       color: Colors.black.withOpacity(0.2))
//                           // ],
//                         ),
//                         child: Column(
//                             children: [
//                               Container(
//                                 height: MediaQuery.of(context).size.height*0.05,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: const Color(0xffffffff),
//
//                                 ),
//                                 child: ListTile(
//
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(5)),
//                                   contentPadding: const EdgeInsets.all(0),
//
//                                   title: Padding(
//                                     padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                     child: Row(
//                                       children: [
//
//                                         Icon(Icons.account_box_outlined,size: 18,color: Colors.black.withOpacity(0.7),),
//
//                                         const SizedBox(width: 5,),
//
//                                         Text("Account",style: TextStyle(color: Colors.black.withOpacity(0.75)),),
//                                       ],
//                                     ),
//                                   ),
//
//                                   // trailing:  Padding(
//                                   //   padding: EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                   //   child: Icon(Icons.keyboard_arrow_right_outlined,size: 20,color: Colors.black.withOpacity(0.6),),
//                                   // ),
//
//                                   //contentPadding: const EdgeInsets.all(10),
//
//                                   style: ListTileStyle.drawer,
//
//                                 ),
//                               ),
//                             ]),
//                       ),
//                     ),
//
//                     //Shadow Line Container
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 1,
//                       margin: const EdgeInsets.only(left: 15,right: 15),
//                       decoration: const BoxDecoration(
//                         color: Color(0xffd0d0d0),
//                       ),
//                     ),
//
//                     // DrawerAccordian(title: "Shop by Department",
//                     //     content: GridView.builder(
//                     //     shrinkWrap: true,
//                     //     physics: const BouncingScrollPhysics(),
//                     //     padding: const EdgeInsets.only(left: 5, right: 5),
//                     //     itemCount: depList.length ?? 0,
//                     //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     //       childAspectRatio: 7.5,
//                     //       crossAxisCount: 1,
//                     //       crossAxisSpacing: 0,
//                     //       mainAxisSpacing: 10
//                     //     ),
//                     //
//                     //     itemBuilder: (BuildContext context, index) {
//                     //       //   bool decision = false;
//                     //       // if (allStores?[index]?.name?.toLowerCase().startsWith(alphabet) == true) {
//                     //       //   print(allStores?[index]?.name);
//                     //       //   decision = true;
//                     //       // }
//                     //       //if(index >= num.parse("${storeDataList?.length ?? 0}")) return null;
//                     //       return GestureDetector(
//                     //         behavior: HitTestBehavior.opaque,
//                     //         onTap: ()
//                     //         {
//                     //           Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) =>  SingleCategory(tag: "drawerItem$index")));
//                     //         },
//                     //         child: Padding(
//                     //           padding: const EdgeInsets.all(0.0),
//                     //           child: Row(
//                     //             crossAxisAlignment: CrossAxisAlignment.center,
//                     //             children:  [
//                     //               // Icon(
//                     //               //     Icons.arrow_forward_ios_outlined,
//                     //               //     size: 15,color: Color(0xff676767)
//                     //               // ),
//                     //               // SizedBox(
//                     //               //   width: 2,
//                     //               // ),
//                     //               Expanded(
//                     //                   child: Text(
//                     //                     "${depList[index]}",
//                     //                     style: TextStyle(fontSize: 13,fontFamily: "Fira-SemiBold",color: Colors.black.withOpacity(0.6)),
//                     //                     softWrap: true,
//                     //                     overflow: TextOverflow.ellipsis,
//                     //                   )),
//                     //
//                     //               const Icon(
//                     //                   Icons.arrow_forward_ios_outlined,
//                     //                   size: 12,color: Color(0xff676767)
//                     //               ),
//                     //
//                     //             ],
//                     //           ),
//                     //         ),
//                     //       );
//                     //     })
//                     // ),
//
//                     //Shop By Department
//                     GestureDetector(
//                       onTap: ()
//                       {
//                         setter(depart);
//                         //launchURL("https://www.whatsapp.com/");
//                       },
//
//                       child: Container(
//                         margin: const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
//                         padding: const EdgeInsets.only(top: 0, bottom: 0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5),
//                           // boxShadow: [
//                           //   BoxShadow(
//                           //       offset: const Offset(0, 0),
//                           //
//                           //       blurRadius: 1.5,
//                           //       color: Colors.black.withOpacity(0.2))
//                           // ],
//                         ),
//                         child: Column(
//                             children: [
//                               Container(
//                                 height: MediaQuery.of(context).size.height*0.05,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: const Color(0xffffffff),
//
//                                 ),
//                                 child: ListTile(
//
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(5)),
//                                   contentPadding: const EdgeInsets.all(0),
//
//                                   title: Padding(
//                                     padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                     child: Row(
//                                       children: [
//
//                                         Icon(Icons.favorite_border_outlined,size: 18,color: Colors.black.withOpacity(0.7),),
//
//                                         const SizedBox(width: 5,),
//
//                                         Text("Shop By Department",style: TextStyle(color: Colors.black.withOpacity(0.75)),),
//                                       ],
//                                     ),
//                                   ),
//
//                                   // trailing:  Padding(
//                                   //   padding: EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                   //   child: Icon(Icons.keyboard_arrow_right_outlined,size: 20,color: Colors.black.withOpacity(0.6),),
//                                   // ),
//
//                                   //contentPadding: const EdgeInsets.all(10),
//
//                                   style: ListTileStyle.drawer,
//
//                                 ),
//                               ),
//                             ]),
//                       ),
//                     ),
//
//
//                     //Shadow Line Container
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 1,
//                       margin: const EdgeInsets.only(left: 15,right: 15),
//                       decoration: const BoxDecoration(
//                         color: Color(0xffd0d0d0),
//                       ),
//                     ),
//
//                     //Lists Container
//                     GestureDetector(
//                       onTap: ()
//                       {
//                         //launchURL("https://www.whatsapp.com/");
//                       },
//
//                       child: Container(
//                         margin: const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
//                         padding: const EdgeInsets.only(top: 0, bottom: 0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5),
//                           // boxShadow: [
//                           //   BoxShadow(
//                           //       offset: const Offset(0, 0),
//                           //
//                           //       blurRadius: 1.5,
//                           //       color: Colors.black.withOpacity(0.2))
//                           // ],
//                         ),
//                         child: Column(
//                             children: [
//                               Container(
//                                 height: MediaQuery.of(context).size.height*0.05,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: const Color(0xffffffff),
//
//                                 ),
//                                 child: ListTile(
//
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(5)),
//                                   contentPadding: const EdgeInsets.all(0),
//
//                                   title: Padding(
//                                     padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                     child: Row(
//                                       children: [
//
//                                         Icon(Icons.favorite_border_outlined,size: 18,color: Colors.black.withOpacity(0.7),),
//
//                                         const SizedBox(width: 5,),
//
//                                         Text("Lists",style: TextStyle(color: Colors.black.withOpacity(0.75)),),
//                                       ],
//                                     ),
//                                   ),
//
//                                   // trailing:  Padding(
//                                   //   padding: EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                   //   child: Icon(Icons.keyboard_arrow_right_outlined,size: 20,color: Colors.black.withOpacity(0.6),),
//                                   // ),
//
//                                   //contentPadding: const EdgeInsets.all(10),
//
//                                   style: ListTileStyle.drawer,
//
//                                 ),
//                               ),
//                             ]),
//                       ),
//                     ),
//
//                     //Registries Container
//                     GestureDetector(
//                       onTap: ()
//                       {
//                         launchURL("https://www.whatsapp.com/");
//                       },
//
//                       child: Container(
//                         margin: const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
//                         padding: const EdgeInsets.only(top: 0, bottom: 0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5),
//                           // boxShadow: [
//                           //   BoxShadow(
//                           //       offset: const Offset(0, 0),
//                           //
//                           //       blurRadius: 1.5,
//                           //       color: Colors.black.withOpacity(0.2))
//                           // ],
//                         ),
//                         child: Column(
//                             children: [
//                               Container(
//                                 height: MediaQuery.of(context).size.height*0.05,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: const Color(0xffffffff),
//
//                                 ),
//                                 child: ListTile(
//
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(5)),
//                                   contentPadding: const EdgeInsets.all(0),
//
//                                   title: Padding(
//                                     padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                     child: Row(
//                                       children: [
//
//                                         Icon(Icons.card_giftcard_outlined,size: 18,color: Colors.black.withOpacity(0.7),),
//
//                                         const SizedBox(width: 5,),
//
//                                         Text("Registries",style: TextStyle(color: Colors.black.withOpacity(0.75)),),
//                                       ],
//                                     ),
//                                   ),
//
//                                   // trailing:  Padding(
//                                   //   padding: EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                   //   child: Icon(Icons.keyboard_arrow_right_outlined,size: 20,color: Colors.black.withOpacity(0.6),),
//                                   // ),
//
//                                   //contentPadding: const EdgeInsets.all(10),
//
//                                   style: ListTileStyle.drawer,
//
//                                 ),
//                               ),
//                             ]),
//                       ),
//                     ),
//
//                     //Shadow Line Container
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 1,
//                       margin: const EdgeInsets.only(left: 15,right: 15),
//                       decoration: const BoxDecoration(
//                         color: Color(0xffd0d0d0),
//                       ),
//                     ),
//
//                     DrawerAccordian(title: "Settings",
//
//                         content: GridView(
//                           shrinkWrap: true,
//                           physics: const BouncingScrollPhysics(),
//                           padding: const EdgeInsets.only(left: 5, right: 5),
//                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                               childAspectRatio: 7.5,
//                               crossAxisCount: 1,
//                               crossAxisSpacing: 0,
//                               mainAxisSpacing: 10
//                           ),
//                           children: [
//                             GestureDetector(
//                               behavior: HitTestBehavior.opaque,
//                               onTap: ()
//                               {
//                                 //Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) =>  SingleCategory(tag: "drawerItem$index")));
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(0.0),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children:  [
//                                     // Icon(
//                                     //     Icons.arrow_forward_ios_outlined,
//                                     //     size: 15,color: Color(0xff676767)
//                                     // ),
//                                     // SizedBox(
//                                     //   width: 2,
//                                     // ),
//                                     const Expanded(
//                                         child: Text(
//                                           "Rate Our App",
//                                           style: TextStyle(fontFamily: "Fira-SemiBold",color: Color(0xff676767)),
//                                           softWrap: true,
//                                           overflow: TextOverflow.ellipsis,
//                                         )),
//
//
//
//                                   ],
//                                 ),
//                               ),
//                             ),
//
//                             //Legal and About Container
//                             GestureDetector(
//                               behavior: HitTestBehavior.opaque,
//                               onTap: ()
//                               {
//                                 //Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) =>  SingleCategory(tag: "drawerItem$index")));
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(0.0),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children:  [
//                                     // Icon(
//                                     //     Icons.arrow_forward_ios_outlined,
//                                     //     size: 15,color: Color(0xff676767)
//                                     // ),
//                                     // SizedBox(
//                                     //   width: 2,
//                                     // ),
//                                     const Expanded(
//                                         child: Text(
//                                           "Legal & About",
//                                           style: TextStyle(fontFamily: "Fira-SemiBold",color: Color(0xff676767)),
//                                           softWrap: true,
//                                           overflow: TextOverflow.ellipsis,
//                                         )),
//
//
//
//                                   ],
//                                 ),
//                               ),
//                             )
//
//                           ],
//                         )
//                     ),
//
//                     //Shadow Line Container
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 1,
//                       margin: const EdgeInsets.only(left: 15,right: 15),
//                       decoration: const BoxDecoration(
//                         color: Color(0xffd0d0d0),
//                       ),
//                     ),
//
//                     //Help Container
//                     GestureDetector(
//                       onTap: ()
//                       {
//                         //launchURL("https://www.whatsapp.com/");
//                       },
//
//                       child: Container(
//                         margin: const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
//                         padding: const EdgeInsets.only(top: 0, bottom: 0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5),
//                           // boxShadow: [
//                           //   BoxShadow(
//                           //       offset: const Offset(0, 0),
//                           //
//                           //       blurRadius: 1.5,
//                           //       color: Colors.black.withOpacity(0.2))
//                           // ],
//                         ),
//                         child: Column(
//                             children: [
//                               Container(
//                                 height: MediaQuery.of(context).size.height*0.05,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: const Color(0xffffffff),
//
//                                 ),
//                                 child: ListTile(
//
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(5)),
//                                   contentPadding: const EdgeInsets.all(0),
//
//                                   title: Padding(
//                                     padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                     child: Row(
//                                       children: [
//
//                                         Icon(Icons.help_outline,size: 18,color: Colors.black.withOpacity(0.7),),
//
//                                         const SizedBox(width: 5,),
//
//                                         Text("Help",style: TextStyle(color: Colors.black.withOpacity(0.75)),),
//                                       ],
//                                     ),
//                                   ),
//
//                                   // trailing:  Padding(
//                                   //   padding: EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                   //   child: Icon(Icons.keyboard_arrow_right_outlined,size: 20,color: Colors.black.withOpacity(0.6),),
//                                   // ),
//
//                                   //contentPadding: const EdgeInsets.all(10),
//
//                                   style: ListTileStyle.drawer,
//
//                                 ),
//                               ),
//                             ]),
//                       ),
//                     ),
//
//                     //Customer Service Container
//                     GestureDetector(
//                       onTap: ()
//                       {
//                         launchURL("https://www.whatsapp.com/");
//                       },
//
//                       child: Container(
//                         margin: const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
//                         padding: const EdgeInsets.only(top: 0, bottom: 0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5),
//                           // boxShadow: [
//                           //   BoxShadow(
//                           //       offset: const Offset(0, 0),
//                           //
//                           //       blurRadius: 1.5,
//                           //       color: Colors.black.withOpacity(0.2))
//                           // ],
//                         ),
//                         child: Column(
//                             children: [
//                               Container(
//                                 height: MediaQuery.of(context).size.height*0.05,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: const Color(0xffffffff),
//
//                                 ),
//                                 child: ListTile(
//
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(5)),
//                                   contentPadding: const EdgeInsets.all(0),
//
//                                   title: Padding(
//                                     padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                     child: Row(
//                                       children: [
//
//                                         Icon(Icons.contact_page_outlined,size: 18,color: Colors.black.withOpacity(0.7),),
//
//                                         const SizedBox(width: 5,),
//
//                                         Text("Customer Service",style: TextStyle(color: Colors.black.withOpacity(0.75)),),
//                                       ],
//                                     ),
//                                   ),
//
//                                   // trailing:  Padding(
//                                   //   padding: EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                   //   child: Icon(Icons.keyboard_arrow_right_outlined,size: 20,color: Colors.black.withOpacity(0.6),),
//                                   // ),
//
//                                   //contentPadding: const EdgeInsets.all(10),
//
//                                   style: ListTileStyle.drawer,
//
//                                 ),
//                               ),
//                             ]),
//                       ),
//                     ),
//
//                     //Shadow Line Container
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 1,
//                       margin: const EdgeInsets.only(left: 15,right: 15),
//                       decoration: const BoxDecoration(
//                         color: Color(0xffd0d0d0),
//                       ),
//                     ),
//
//                     //Give Feedback Container
//                     GestureDetector(
//                       onTap: ()
//                       {
//                         //Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => const SignIn()));
//                       },
//
//                       child: Container(
//                         margin: const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
//                         padding: const EdgeInsets.only(top: 0, bottom: 0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5),
//                           // boxShadow: [
//                           //   BoxShadow(
//                           //       offset: const Offset(0, 0),
//                           //
//                           //       blurRadius: 1.5,
//                           //       color: Colors.black.withOpacity(0.2))
//                           // ],
//                         ),
//                         child: Column(
//                             children: [
//                               Container(
//                                 height: MediaQuery.of(context).size.height*0.05,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: const Color(0xffffffff),
//
//                                 ),
//                                 child: ListTile(
//
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(5)),
//                                   contentPadding: const EdgeInsets.all(0),
//
//                                   title: Padding(
//                                     padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                     child: Row(
//                                       children: [
//
//                                         Icon(Icons.chat_outlined,size: 18,color: Colors.black.withOpacity(0.7),),
//                                         const SizedBox(width: 5,),
//                                         Text("Give Feedback",style: TextStyle(color: Colors.black.withOpacity(0.75)),),
//                                       ],
//                                     ),
//                                   ),
//
//                                   // trailing:  Padding(
//                                   //   padding: EdgeInsets.only(bottom: 15,left: 15,right: 15),
//                                   //   child: Icon(Icons.keyboard_arrow_right_outlined,size: 20,color: Colors.black.withOpacity(0.6),),
//                                   // ),
//
//                                   //contentPadding: const EdgeInsets.all(10),
//
//                                   style: ListTileStyle.drawer,
//
//                                 ),
//                               ),
//                             ]),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//
//
//
//             // Expanded(
//             //   flex: 10,
//             //   child: Column(
//             //     children: [
//             //       GestureDetector(
//             //           onTap: ()
//             //           {
//             //             Navigator.pushReplacement(context,customfromLeftRoute(DashboardPage(tabindex: 2)));
//             //           },
//             //           child: menuContainer("All Stores",const Icon(Icons.store_mall_directory_outlined,size: 23,color: Colors.white,))),
//             //
//             //       GestureDetector(
//             //           onTap: (){
//             //             Navigator.pushReplacement(context,customfromLeftRoute(DashboardPage(tabindex: 3)));
//             //           },
//             //           child: menuContainer("All Categories",const Icon(Icons.category_outlined,size: 23,color: Colors.white,))),
//             //
//             //       GestureDetector(
//             //           onTap: (){
//             //             launchAboutus();
//             //           },
//             //           child: menuContainer("About Us",const Icon(Icons.info_outline,size: 23,color: Colors.white,))),
//             //
//             //       GestureDetector(
//             //           onTap: ()
//             //           {
//             //             launchBlog();
//             //           },
//             //           child: menuContainer("Blog",const Icon(Icons.contact_page,size: 23,color: Colors.white,))),
//             //     ],
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

Widget shadowLine(BuildContext context)
{
  //Shadow Line Container
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 1,
      margin:
      const EdgeInsets.only(left: 0, right: 0),
      decoration: const BoxDecoration(
        color: Color(0xffd0d0d0),
      ),
    );
}
