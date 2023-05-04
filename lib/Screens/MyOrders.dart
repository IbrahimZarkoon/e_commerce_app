import 'package:e_commerce/Screens/OrderDetails.dart';
import 'package:e_commerce/Screens/SingleProduct.dart';
import 'package:e_commerce/Widgets/SearchBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Dashboard.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {

  bool orders = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF0071dc),
        automaticallyImplyLeading: false,
        leading: BackButton(onPressed: () => Navigator.pop(context),color: Colors.white,),
        leadingWidth: 30,
        centerTitle: true,
        title: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text("My Orders",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
      ),
      
      body: orders?
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,

          child: Column(

            children: [

              //1st Order
              GestureDetector(
                onTap: ()
                {
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => OrderDetails()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(15),
                  color: Colors.white,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text("Order #: 156663432342344432"),

                      const SizedBox(height: 5,),

                      Text("Placed on 02 Feb 2023",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),

                      const SizedBox(height: 5,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Paid on 06 Feb 2023",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),

                          Text("Paid",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12,fontStyle: FontStyle.italic),),

                        ],
                      ),

                      const SizedBox(height: 10,),

                      //Item Details
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          //Image Container
                          Container(
                            width: 75,
                            height: 75,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0,0)
                                )
                              ],
                              image: DecorationImage(image: NetworkImage("https://static-01.daraz.pk/p/f7e59c0d7dc398f9b7f9a4828dcdaf24.jpg"),fit: BoxFit.cover)
                            ),
                          ),

                          Expanded(
                            child: Container(
                              height: 75,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Squid Game Keychain - keychain with strap - keyring - Rubber keychain - figure keychain", maxLines: 2,overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 13),),

                                  Text("£ 9.99",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("x 3",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.6)),),

                                      Container(
                                        padding: EdgeInsets.only(top: 2,bottom: 2,left: 20,right: 20),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Color(0xFFfc9038),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.1),
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(0,0)
                                            )
                                          ]
                                        ),
                                        alignment: Alignment.center,

                                        child: Text("Delivered",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.white,fontSize: 12),),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [

                          Text("3 Items, Total: ",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12,fontWeight: FontWeight.bold),),

                          Text(" £ 29.97",style: TextStyle(color: Color(0xFFfc9038),fontWeight: FontWeight.bold),)

                        ],
                      ),

                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [

                          GestureDetector(
                            onTap: ()
                            {
                              Navigator.push(context, CupertinoPageRoute(builder: (_) => SingleProduct(tag: "MyOrder0", productid: "1110")));
                            },
                            child: Hero(
                              tag: "MyOrder0",
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Color(0xFFfc9038),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xffffa559),
                                          Color(0xFFfc9038)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight
                                    )
                                ),
                                padding: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),

                                child: Text("Buy again",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                ),
              ),

              //2nd Order
              GestureDetector(
                onTap: ()
                {
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => OrderDetails()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(15),
                  color: Colors.white,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text("Order #: 156663432342344432"),

                      const SizedBox(height: 5,),

                      Text("Placed on 02 Feb 2023",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),

                      const SizedBox(height: 5,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Paid on 06 Feb 2023",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),

                          Text("COD",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12,fontStyle: FontStyle.italic),),

                        ],
                      ),

                      const SizedBox(height: 10,),

                      //Item Details
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          //Image Container
                          Container(
                            width: 75,
                            height: 75,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0,0)
                                  )
                                ],
                                image: DecorationImage(image: NetworkImage("https://static-01.daraz.pk/p/f7e59c0d7dc398f9b7f9a4828dcdaf24.jpg"),fit: BoxFit.cover)
                            ),
                          ),

                          Expanded(
                            child: Container(
                              height: 75,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Squid Game Keychain - keychain with strap - keyring - Rubber keychain - figure keychain", maxLines: 2,overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 13),),

                                  Text("£ 9.99",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("x 1",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.6)),),

                                      Container(
                                        padding: EdgeInsets.only(top: 2,bottom: 2,left: 20,right: 20),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white,
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       color: Colors.black.withOpacity(0.1),
                                          //       spreadRadius: 1,
                                          //       blurRadius: 1,
                                          //       offset: Offset(0,0)
                                          //   )
                                          // ]
                                        ),
                                        alignment: Alignment.center,

                                        child: Text("Cancelled",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Color(0xFFfc9038),fontSize: 12),),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 10,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          //Image Container
                          Container(
                            width: 75,
                            height: 75,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0,0)
                                  )
                                ],
                                image: DecorationImage(image: NetworkImage("https://static-01.daraz.pk/p/f7e59c0d7dc398f9b7f9a4828dcdaf24.jpg"),fit: BoxFit.cover)
                            ),
                          ),

                          Expanded(
                            child: Container(
                              height: 75,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Squid Game Keychain - keychain with strap - keyring - Rubber keychain - figure keychain", maxLines: 2,overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 13),),

                                  Text("£ 9.99",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("x 1",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.6)),),

                                      Container(
                                        padding: EdgeInsets.only(top: 2,bottom: 2,left: 20,right: 20),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white,
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       color: Colors.black.withOpacity(0.1),
                                          //       spreadRadius: 1,
                                          //       blurRadius: 1,
                                          //       offset: Offset(0,0)
                                          //   )
                                          // ]
                                        ),
                                        alignment: Alignment.center,

                                        child: Text("Cancelled",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Color(0xFFfc9038),fontSize: 12),),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 10,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          //Image Container
                          Container(
                            width: 75,
                            height: 75,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0,0)
                                  )
                                ],
                                image: DecorationImage(image: NetworkImage("https://static-01.daraz.pk/p/f7e59c0d7dc398f9b7f9a4828dcdaf24.jpg"),fit: BoxFit.cover)
                            ),
                          ),

                          Expanded(
                            child: Container(
                              height: 75,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Squid Game Keychain - keychain with strap - keyring - Rubber keychain - figure keychain", maxLines: 2,overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 13),),

                                  Text("£ 9.99",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("x 1",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.6)),),

                                      Container(
                                        padding: EdgeInsets.only(top: 2,bottom: 2,left: 20,right: 20),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.white,
                                            // boxShadow: [
                                            //   BoxShadow(
                                            //       color: Colors.black.withOpacity(0.1),
                                            //       spreadRadius: 1,
                                            //       blurRadius: 1,
                                            //       offset: Offset(0,0)
                                            //   )
                                            // ]
                                        ),
                                        alignment: Alignment.center,

                                        child: Text("Cancelled",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Color(0xFFfc9038),fontSize: 12),),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [

                          Text("3 Items, Total: ",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12,fontWeight: FontWeight.bold),),

                          Text(" £ 29.97",style: TextStyle(color: Color(0xFFfc9038),fontWeight: FontWeight.bold),)

                        ],
                      ),

                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [

                          GestureDetector(
                            onTap: ()
                            {
                              Navigator.push(context, CupertinoPageRoute(builder: (_) => SingleProduct(tag: "MyOrder1", productid: "1111")));
                            },
                            child: Hero(
                              tag: "MyOrder1",
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Color(0xFFfc9038),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xffffa559),
                                          Color(0xFFfc9038)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight
                                    )
                                ),
                                padding: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),

                                child: Text("Buy again",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                ),
              ),

              //3rd Order
              GestureDetector(
                onTap: ()
                {
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => OrderDetails()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(15),
                  color: Colors.white,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text("Order #: 156663432342344432"),

                      const SizedBox(height: 5,),

                      Text("Placed on 02 Feb 2023",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),

                      const SizedBox(height: 5,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Paid on 06 Feb 2023",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),

                          Text("Paid",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12,fontStyle: FontStyle.italic),),

                        ],
                      ),

                      const SizedBox(height: 10,),

                      //Item Details
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          //Image Container
                          Container(
                            width: 75,
                            height: 75,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0,0)
                                  )
                                ],
                                image: DecorationImage(image: NetworkImage("https://static-01.daraz.pk/p/f7e59c0d7dc398f9b7f9a4828dcdaf24.jpg"),fit: BoxFit.cover)
                            ),
                          ),

                          Expanded(
                            child: Container(
                              height: 75,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Squid Game Keychain - keychain with strap - keyring - Rubber keychain - figure keychain", maxLines: 2,overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 13),),

                                  Text("£ 9.99",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("x 3",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.6)),),

                                      Container(
                                        padding: EdgeInsets.only(top: 2,bottom: 2,left: 20,right: 20),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Color(0xFFfc9038),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black.withOpacity(0.1),
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  offset: Offset(0,0)
                                              )
                                            ]
                                        ),
                                        alignment: Alignment.center,

                                        child: Text("Delivered",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.white,fontSize: 12),),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [

                          Text("3 Items, Total: ",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12,fontWeight: FontWeight.bold),),

                          Text(" £ 29.97",style: TextStyle(color: Color(0xFFfc9038),fontWeight: FontWeight.bold),)

                        ],
                      ),

                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [

                          GestureDetector(
                            onTap: ()
                            {
                              Navigator.push(context, CupertinoPageRoute(builder: (_) => SingleProduct(tag: "MyOrder2", productid: "1112")));
                            },
                            child: Hero(
                              tag: "MyOrder2",
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Color(0xFFfc9038),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xffffa559),
                                          Color(0xFFfc9038)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight
                                    )
                                ),
                                padding: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),

                                child: Text("Buy again",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                ),
              ),

              //4th Order
              GestureDetector(
                onTap: ()
                {
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => OrderDetails()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(15),
                  color: Colors.white,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Text("Order #: 156663432342344432"),

                      const SizedBox(height: 5,),

                      Text("Placed on 02 Feb 2023",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),

                      const SizedBox(height: 5,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Paid on 06 Feb 2023",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),

                          Text("COD",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12,fontStyle: FontStyle.italic),),

                        ],
                      ),

                      const SizedBox(height: 10,),

                      //Item Details
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          //Image Container
                          Container(
                            width: 75,
                            height: 75,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0,0)
                                  )
                                ],
                                image: DecorationImage(image: NetworkImage("https://static-01.daraz.pk/p/f7e59c0d7dc398f9b7f9a4828dcdaf24.jpg"),fit: BoxFit.cover)
                            ),
                          ),

                          Expanded(
                            child: Container(
                              height: 75,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Squid Game Keychain - keychain with strap - keyring - Rubber keychain - figure keychain", maxLines: 2,overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 13),),

                                  Text("£ 9.99",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("x 1",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.6)),),

                                      Container(
                                        padding: EdgeInsets.only(top: 2,bottom: 2,left: 20,right: 20),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white,
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       color: Colors.black.withOpacity(0.1),
                                          //       spreadRadius: 1,
                                          //       blurRadius: 1,
                                          //       offset: Offset(0,0)
                                          //   )
                                          // ]
                                        ),
                                        alignment: Alignment.center,

                                        child: Text("Cancelled",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Color(0xFFfc9038),fontSize: 12),),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 10,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          //Image Container
                          Container(
                            width: 75,
                            height: 75,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0,0)
                                  )
                                ],
                                image: DecorationImage(image: NetworkImage("https://static-01.daraz.pk/p/f7e59c0d7dc398f9b7f9a4828dcdaf24.jpg"),fit: BoxFit.cover)
                            ),
                          ),

                          Expanded(
                            child: Container(
                              height: 75,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Squid Game Keychain - keychain with strap - keyring - Rubber keychain - figure keychain", maxLines: 2,overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 13),),

                                  Text("£ 9.99",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("x 1",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.6)),),

                                      Container(
                                        padding: EdgeInsets.only(top: 2,bottom: 2,left: 20,right: 20),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white,
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       color: Colors.black.withOpacity(0.1),
                                          //       spreadRadius: 1,
                                          //       blurRadius: 1,
                                          //       offset: Offset(0,0)
                                          //   )
                                          // ]
                                        ),
                                        alignment: Alignment.center,

                                        child: Text("Cancelled",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Color(0xFFfc9038),fontSize: 12),),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 10,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          //Image Container
                          Container(
                            width: 75,
                            height: 75,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0,0)
                                  )
                                ],
                                image: DecorationImage(image: NetworkImage("https://static-01.daraz.pk/p/f7e59c0d7dc398f9b7f9a4828dcdaf24.jpg"),fit: BoxFit.cover)
                            ),
                          ),

                          Expanded(
                            child: Container(
                              height: 75,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Squid Game Keychain - keychain with strap - keyring - Rubber keychain - figure keychain", maxLines: 2,overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 13),),

                                  Text("£ 9.99",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("x 1",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.6)),),

                                      Container(
                                        padding: EdgeInsets.only(top: 2,bottom: 2,left: 20,right: 20),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white,
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //       color: Colors.black.withOpacity(0.1),
                                          //       spreadRadius: 1,
                                          //       blurRadius: 1,
                                          //       offset: Offset(0,0)
                                          //   )
                                          // ]
                                        ),
                                        alignment: Alignment.center,

                                        child: Text("Cancelled",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Color(0xFFfc9038),fontSize: 12),),
                                      )
                                    ],
                                  )

                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [

                          Text("3 Items, Total: ",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12,fontWeight: FontWeight.bold),),

                          Text(" £ 29.97",style: TextStyle(color: Color(0xFFfc9038),fontWeight: FontWeight.bold),)

                        ],
                      ),

                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [

                          GestureDetector(
                            onTap: ()
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SingleProduct(tag: "MyOrder4", productid: "1114")));
                            },
                            child: Hero(
                              tag: "MyOrder4",
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Color(0xFFfc9038),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xffffa559),
                                          Color(0xFFfc9038)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight
                                    )
                                ),
                                padding: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),

                                child: Text("Buy again",style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
          :
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Column(
          children: [

            //Search Bar
            Container(
              height: 40,
              //width: MediaQuery.of(context).size.width*0.8,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5,top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
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

                  Container(
                      padding: const EdgeInsets.only(left: 5,right: 0,top: 0,bottom: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffffffff)
                      ),
                      child: const Icon(Icons.search,color: Colors.black, size: 22,)),

                  const SizedBox(width: 10),

                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: TextField(
                          //controller: _searchCon,
                          //focusNode: _focusNode,
                          //onChanged: (query) => setState(() {}),
                          style: const TextStyle(color: Colors.black, height: 1, fontSize: 15),
                          decoration: InputDecoration(
                            //prefixIcon: Icon(Icons.search, color: Color(0xFF5D5D67), size: 23),
                              hintText: "Search all orders",
                              hintStyle: const TextStyle(color: Color(0xFF8F8F9E), fontSize: 15),
                              border: InputBorder.none),
                        ),
                      )),

                ],
              ),
            ),

            Stack(children: [
              
              Container(
                margin: EdgeInsets.only(bottom: 43),
                height: MediaQuery.of(context).size.height*0.15,color: Colors.grey.withOpacity(0.5),),
              
              Positioned(
                  left: 0,right: 0,bottom: 0,
                  child: Container(width: 150,height: 150,decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage("https://img.icons8.com/external-others-pike-picture/1000/null/external-carton-box-box-others-pike-picture.png"))),))
            ]),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Text("Looks like you haven't placed an order in the last 3 months.",textAlign: TextAlign.center,),
            ),

            const SizedBox(height: 10,),

            //Continue Shopping Container
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) =>
                          DashboardPage(tabindex: 0))),
              child: Container(
                margin: EdgeInsets.only(left: 20,right: 20),
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
                  "Continue shopping",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

