import 'package:e_commerce/Screens/Checkout.dart';
import 'package:e_commerce/Screens/Dashboard.dart';
import 'package:e_commerce/Widgets/CartProduct.dart';
import 'package:e_commerce/Widgets/Drawer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/CartProvider.dart';
import '../Widgets/Headings.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {


  @override
  Widget build(BuildContext context) {

    var cartProv = Provider.of<CartProvider>(context);

    double _value = 350;
    bool _isChecked = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0071dc),
        title: GestureDetector(
            onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => DashboardPage(tabindex: 0))),
            child: Row(
              children: const [

               Padding(
            padding: EdgeInsets.only(bottom: 5.0,left: 0,right: 10),

                 child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 19,),
               ),

                Text(
                  "My Cart",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
              ],
            )),
        leadingWidth: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            //Headings(context, "My Cart"),

            //Basket not reserved Container
            Container(
              padding: EdgeInsets.only(bottom: 20,top: 20),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.1),width: 3))
              ),
              alignment: Alignment.center,

              child: Text("Your basket is not reserved."),
            ),

            //Shipping Slider
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.1),width: 3))
              ),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text("You're £39.99 away to get FREE standard shipping",style: TextStyle(color: Color(0xFFfc9038)),),

                  const SizedBox(height: 0,),

                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: LinearPercentIndicator(

                      barRadius: Radius.circular(20),
                      //width: 300.0,
                      lineHeight: 14.0,
                      percent: 360/400,

                      trailing: Icon(Icons.check_circle_outline,size: 20,color: Colors.black.withOpacity(0.6),),
                      //linearStrokeCap: LinearStrokeCap.butt,
                      backgroundColor: Color(0xfff1f1f1),
                      progressColor: Colors.green,
                    ),
                  ),


                ],
              ),
            ),



            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * .1,top: 10),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return index<2?CartProductCon(
                    pTitle: "Gina Wellness Lightweight Trousers",
                    pStoreTitle: "ZERRES",
                    pImage:
                    "https://www.luxury-legs.com/images/zerres-gina-wellness-lightweight-trousers-p4247-207206_medium.jpg",
                    pOrderNumber: "654987",
                    pCost: "99.00",
                    productCount: 1,
                    k: index.toString(),
                    pID: "123",
                  ) :
                  //Order Summar Container
                  Column(
                    children: [
                      CartProductCon(
                        pTitle: "Gina Wellness Lightweight Trousers",
                        pStoreTitle: "ZERRES",
                        pImage:
                        "https://www.luxury-legs.com/images/zerres-gina-wellness-lightweight-trousers-p4247-207206_medium.jpg",
                        pOrderNumber: "654987",
                        pCost: "99.00",
                        productCount: 1,
                        k: index.toString(),
                        pID: "123",
                      ),

                      Container(
                        margin: const EdgeInsets.only(bottom: 3,left: 10,right: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Headings(context, "ORDER SUMMARY"),

                            shadowLine(context),

                            Container(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Items Total",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  Text("3",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 0, bottom: 10, left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Shipping",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  Text("£9.99",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                ],
                              ),
                            ),

                            shadowLine(context),


                            Container(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Discount",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  Text("£0.00",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 0, bottom: 10, left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  Text("£369.99",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );},
              ),
            ),

          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        padding:
        const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 1,
                offset: const Offset(0, -1))
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text("Shipping: ",
                  //         overflow: TextOverflow.ellipsis,
                  //         style: TextStyle(
                  //             color: Colors.black.withOpacity(0.6),
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 14)),
                  //
                  //     Text("GBP £9.99",
                  //         overflow: TextOverflow.ellipsis,
                  //         style: TextStyle(
                  //             color: Colors.black.withOpacity(0.6),
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 14)),
                  //   ],
                  // ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Total (3 Items):",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),

                      Text("£ 369.99",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20,),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) => const Checkout())),
              child: Hero(
                tag: "Cart",

                child: Container(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 15, left: 30, right: 30),
                  decoration: BoxDecoration(
                      color: const Color(0xff31ca00),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    "CHECKOUT",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

// Widget cartProductCon(BuildContext context, String pTitle, String pStoreTitle, String pOrderNumber,String pCost , int productCount)
// {
//
//   return Dismissible(
//     background: Container(
//       color: Colors.red,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: const [
//           Padding(
//             padding: EdgeInsets.only(top: 10,bottom: 10,left: 20 ),
//             child: Icon(Icons.delete, color: Colors.white),
//           ),
//         ],
//       ),
//     ),
//
//     direction: DismissDirection.endToStart,
//
//     secondaryBackground: Container(
//       color: Colors.red,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: const [
//           Padding(
//             padding: EdgeInsets.only(top: 10,bottom: 10,right: 20 ),
//             child: Icon(Icons.delete, color: Colors.white),
//           ),
//         ],
//       ),
//     ),
//
//     key: Key("0"),
//
//     //Main Container
//     child: Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height*.18,
//       margin: EdgeInsets.only(top: 10,bottom: 10),
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//           color: Colors.white
//       ),
//       child: Row(
//         children: [
//
//           //Image Container
//           Container(
//             width: 125,
//             margin: EdgeInsets.only(right: 10),
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 1,
//                       offset: Offset(0,0)
//                   )
//                 ],
//                 image: DecorationImage(image: NetworkImage("https://www.luxury-legs.com/images/zerres-gina-wellness-lightweight-trousers-p4247-207206_medium.jpg"))
//             ),
//           ),
//
//           Flexible(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(pTitle,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),maxLines: 2,overflow: TextOverflow.ellipsis,),
//
//                 const SizedBox(height: 5,),
//
//                 Text(pStoreTitle,style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 13),maxLines: 1,overflow: TextOverflow.ellipsis,),
//                 const SizedBox(height: 5,),
//
//                 Text("Order #$pOrderNumber",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 13),maxLines: 1,overflow: TextOverflow.ellipsis,),
//
//                 const Spacer(),
//
//                 //Price and + - Row
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//
//                     Text("£ ${pCost*productCount}0",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
//
//                     //+ - Counter Container
//                     Container(
//                       height: 40,
//                       //margin: EdgeInsets.only(right: 15),
//                       //width: MediaQuery.of(context).size.width*0.31,
//                       decoration: BoxDecoration(
//                           //color: Color(0xffffffff),
//                           borderRadius: BorderRadius.circular(5),
//
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               if (productCount > 0) {
//                                 setState(() {
//                                   productCount--;
//                                 });
//                               }
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       color: Colors.black.withOpacity(0.1),
//                                       offset: Offset(0,0),
//                                       blurRadius: 1,
//                                       spreadRadius: 1
//                                   )
//                                 ],
//                                 color: Colors.black,
//                               ),
//                               padding: EdgeInsets.all(8),
//                               child: Icon(Icons.remove, color: Colors.white),
//                             ),
//                           ),
//
//                           const SizedBox(width: 5,),
//
//                           //Product Count Container
//                           Container(
//                               alignment: Alignment.center,
//                               //height: 50,
//                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),                                color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Colors.black.withOpacity(0.1),
//                                         offset: Offset(0,0),
//                                         blurRadius: 1,
//                                         spreadRadius: 1
//                                     )
//                                   ]),
//                               padding: EdgeInsets.only(left: 15,right: 15),
//                               child: Text('$productCount')),
//
//                           const SizedBox(width: 5,),
//
//                           InkWell(
//                             onTap: () {
//                               productCount++;
//
//                               print("++");
//                               setState(() {
//                                 productCount++;
//                               });
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Colors.black.withOpacity(0.1),
//                                         offset: Offset(0,0),
//                                         blurRadius: 1,
//                                         spreadRadius: 1
//                                     )
//                                   ],
//                                 borderRadius: BorderRadius.circular(5),
//                                 color: Colors.black,
//                               ),
//                               padding: EdgeInsets.all(8),
//                               child: Icon(Icons.add, color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 )
//
//               ],
//             ),
//           )
//
//
//         ],
//       ),
//     ),
//   );
// }
}
