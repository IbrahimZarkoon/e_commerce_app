import 'package:e_commerce/Screens/Dashboard.dart';
import 'package:e_commerce/Screens/SingleProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff1f1f1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF0071dc),
          leadingWidth: MediaQuery.of(context).size.width / 2,
          centerTitle: false,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (BuildContext context) {
                return DashboardPage(tabindex: 1);
              }));
            },
            child: Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 23,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Wishlist",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.search_outlined,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              itemCount: 6,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Stack(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Image Container
                        Hero(
                          tag: "Wishlist$index",
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 110,
                            height: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      offset: const Offset(0, 0),
                                      spreadRadius: 0,
                                      blurRadius: 1.5)
                                ],
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://selectronics.com.pk/wp-content/uploads/2022/11/Mix-Products-47-300x300.jpg"),
                                    fit: BoxFit.contain)),
                          ),
                        ),

                        //Details Column
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "ELECTRONICS",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xfffd9926),
                                  letterSpacing: 2),
                            ),

                            const SizedBox(
                              height: 10,
                            ),

                            const Text(
                              "EcoStar 55' QLED",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),

                            const SizedBox(
                              height: 10,
                            ),

                            //Ratings Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                Text(
                                  " ${double.parse("4.4")}/5.0",
                                  style: const TextStyle(
                                      color: Color(0xff8c8c8c), fontSize: 16),
                                )
                              ],
                            ),

                            const SizedBox(
                              height: 30,
                            ),

                            const Text(
                              "GBP 109.99",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xfffd9926)),
                            ),
                          ],
                        )
                      ],
                    ),

                    //Delete Container
                    Positioned(
                        right: 0,
                        top: 0,
                        child: GestureDetector(
                            onTap: () {
                              //Delete Function
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.black.withOpacity(0.6),
                            ))),

                    //View Container
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                ),
                                builder: (BuildContext context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.85,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            offset: Offset(0, -10),
                                            blurRadius: 15,
                                            spreadRadius: 1,
                                          )
                                        ],
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        color: Colors.white),
                                    child: SingleProduct(
                                      tag: 'Wishlist$index',
                                      productid: 'Wishlist$index',
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 7, bottom: 7),
                            decoration: BoxDecoration(
                                color: const Color(0xfffd9926),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                const Text(
                                  "View",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ))
                  ]),
                );
              }),
        ),
      ),
    );
  }
}
