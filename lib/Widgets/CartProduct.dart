import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/CartProvider.dart';

class CartProductCon extends StatefulWidget {
  final String pTitle;
  final String pStoreTitle;
  final String pImage;
  final String pOrderNumber;
  final String pCost;
  final int productCount;
  final String k;
  final String pID;

  const CartProductCon({
    Key? key,
    required this.pTitle,
    required this.pStoreTitle,
    required this.pImage,
    required this.pOrderNumber,
    required this.pCost,
    required this.productCount,
    required this.k, required this.pID,
  }) : super(key: key);

  @override
  _CartProductConState createState() => _CartProductConState();
}

class _CartProductConState extends State<CartProductCon> {
  late int productCount;

  @override
  void initState() {
    super.initState();
    productCount = widget.productCount;
  }

  @override
  Widget build(BuildContext context) {

   // var cartProv = Provider.of<CartProvider>(context);


    return Dismissible(
      onDismissed: (direction)
      {

      },
      // background: Container(
      //   margin: const EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 15),
      //   padding: const EdgeInsets.all(10),
      //
      //   decoration: BoxDecoration(
      //       color: Colors.red,
      //       borderRadius: BorderRadius.circular(10)
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: const [
      //       Padding(
      //         padding: EdgeInsets.only(top: 10,bottom: 10,left: 20 ),
      //         child: Icon(Icons.delete, color: Colors.white),
      //       ),
      //     ],
      //   ),
      // ),
      //
      // direction: DismissDirection.endToStart,
      //
      // secondaryBackground: Container(
      //   margin: const EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 15),
      //   padding: const EdgeInsets.all(10),
      //
      //   decoration: BoxDecoration(
      //       color: Colors.red,
      //       borderRadius: BorderRadius.circular(10)
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: const [
      //       Padding(
      //         padding: EdgeInsets.only(top: 10,bottom: 10,right: 20 ),
      //         child: Icon(Icons.delete, color: Colors.white),
      //       ),
      //     ],
      //   ),
      // ),

      key: Key(widget.pID),
      child: Stack(

        children: [

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*.18,
            margin: const EdgeInsets.only(top: 0,bottom: 10,left: 0,right: 0),
            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(0),
                border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.1),width: 5)),
                color: Colors.white
            ),
            child: Row(
              children: [
                //Image Container
                Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: const Offset(0,0)
                        )
                      ],
                      image: DecorationImage(image: NetworkImage(widget.pImage))
                  ),
                ),

                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(widget.pTitle,style: const TextStyle(fontSize: 15),maxLines: 2,overflow: TextOverflow.ellipsis,),
                      ),

                      const SizedBox(height: 5,),

                      Flexible(
                        child: Row(
                          children: [
                            Text(
                              "£ ",
                              style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black.withOpacity(0.8)),
                            ),

                            Text(
                              "120.00",
                              style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.green),
                            ),
                          ],
                        ),
                      ),



                      //Price and + - Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          //Size Container
                          Column(
                            children: [

                              Text("Size",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 13),),

                              const SizedBox(height: 5,),

                              Container(
                                  height: 35,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 20,right: 20),
                                  decoration: BoxDecoration(
                                    color: Color(0xfff1f1f1),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        offset: const Offset(0, 0),
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Text("X-Large")
                              ),
                            ],
                          ),

                          // + - Counter Container
                          Column(
                            children: [

                              Text("QTY",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 13),),

                              const SizedBox(height: 5,),

                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(0, 0),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        //cartProv.decreaseProductQuantity(widget.pID);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                          ),
                                          color: Color(0xffffffff),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: const Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          color: Colors.black,
                                          size: 15,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Text(
                                        '1',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),

                                    InkWell(
                                      onTap: () {
                                        //cartProv.increaseProductQuantity(widget.pID);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                          ),
                                          color: Color(0xffffffff),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: const Icon(
                                          Icons.keyboard_arrow_up_outlined,
                                          color: Colors.black,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                )

              ],
            ),
          ),

          Positioned(

            right: 15,
            top: 0,
            child: Container(

                child: Icon(Icons.delete,color: Color(0xfff32f2f),)),
          )
        ],
      )
    );
  }
}