import 'package:e_commerce/Widgets/Drawer.dart';
import 'package:flutter/material.dart';

import 'SingleProduct.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
            child: Text("Order Details",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,

          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              //shipping and billing Container
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Ship & bill to",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 14),),

                    const SizedBox(height: 10,),

                    Text("Muhammad Nafeel",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 14),),

                    const SizedBox(height: 10,),

                    Text("3337666656",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 14),),

                    const SizedBox(height: 10,),

                    Text("Sindh, Karachi - P.E.C.H.S, Block 2, House # 85-K, Pechs block 2, near noorani kabab house and chase, karachi, Meezan bank wale gali main janay ke bd left ke dusre bari gali",
                    style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 14),)
                  ],
                ),

              ),

              //Item Details Container
              Container(
                padding: EdgeInsets.all(15),
                color: Colors.white,
                child: Column(

                  children: [

                    //Item Details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

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

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Squid Game Keychain - keychain with strap - keyring - Rubber keychain - figure keychain", maxLines: 2,overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 13),),

                                const SizedBox(height: 5,),

                                Text("No Warranty",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 13),),

                                const SizedBox(height: 5,),

                                Text("£ 9.99",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),

                                const SizedBox(height: 5,),


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

                                      child: Text("Delivered",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Color(0xFFfc9038),fontSize: 12),),
                                    )
                                  ],
                                )

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              //Track or Write a Review Container
              Container(
                margin: EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [

                    Flexible(
                      child: Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 10,bottom: 10),

                        margin: EdgeInsets.only(top: 1,right: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Icon(Icons.track_changes_outlined,size: 18,color: Colors.black.withOpacity(0.65),),

                            const SizedBox(width: 5,),

                            Text("Track Package",style: TextStyle(color: Colors.black.withOpacity(0.75),fontSize: 13),),
                          ],
                        ),
                      ),
                    ),

                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                        color: Colors.white,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 1,right: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Icon(Icons.rate_review_outlined,size: 18,color: Colors.black.withOpacity(0.65),),

                            const SizedBox(width: 5,),

                            Text("WRITE A REVIEW",style: TextStyle(color: Colors.black.withOpacity(0.75),fontSize: 13),),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              //Order Details Container
              Container(
                margin: EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text("Order #125656216236153",style: TextStyle(color: Color(
                        0x84359306),fontSize: 16,fontWeight: FontWeight.bold),),

                    const SizedBox(height: 5,),

                    Text("Placed on 02 Feb 2023",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),

                    const SizedBox(height: 5,),

                    Text("Paid on 06 Feb 2023",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),

                    const SizedBox(height: 5,),

                    Text("Delivered on 06 Feb 2023",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),
                  ],
                ),
              ),

              //Subtotal Container
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    //Subtotal Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Text("Subtotal",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),

                        Text("£ 9.99",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)

                      ],
                    ),

                    const SizedBox(height: 5,),

                    //Delivery Fee Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Text("Delivery Fee",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),

                        Text("£ 3.99",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)

                      ],
                    ),

                    const SizedBox(height: 5,),

                    //Cash Payment Fee Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Text("Cash Payment Fee",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),

                        Text("£ 0.99",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)

                      ],
                    ),

                    const SizedBox(height: 10,),

                    shadowLine(context),

                    const SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [

                        Text("1 Items, Total: ",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12,fontWeight: FontWeight.bold),),

                        Text(" £ 14.97",style: TextStyle(color: Color(0xFFfc9038),fontWeight: FontWeight.bold),)

                      ],
                    ),

                    const SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [

                        GestureDetector(
                          onTap: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SingleProduct(tag: "OrderDetails", productid: "OrderDetails11")));
                          },
                          child: Hero(
                            tag: "OrderDetails",
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


            ],
          ),
        ),
      ),
    );
  }
}
