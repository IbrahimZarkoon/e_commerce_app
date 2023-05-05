import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Screens/AllCategories.dart';
import 'package:e_commerce/Screens/SignIN.dart';
import 'package:e_commerce/Screens/SignUp.dart';
import 'package:e_commerce/Screens/SingleCategory.dart';
import 'package:e_commerce/Screens/SingleProduct.dart';
import 'package:e_commerce/Widgets/AppBar.dart';
import 'package:e_commerce/Widgets/Drawer.dart';
import 'package:e_commerce/Widgets/Headings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool dailyDeals = true;
  bool weeklyDeals = false;
  bool monthlyDeals = false;

  //bool User = false;

  void setter(bool param)
  {
    setState(() {
      param = !param;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.165),
          child: myAppBar(context,() => Scaffold.of(context).openDrawer(),)),
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

              //Latest Deals ListView
              Container(
                height: MediaQuery.of(context).size.height*0.275,

                child: ListView.builder(

                  padding: EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 0),
                  physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, index)
                {
                  return GestureDetector(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SingleProduct(tag: "tag", productid: "productid")));
                    },
                    child: Stack(
                      children: [

                        Container(
                        margin: EdgeInsets.only(right: 2),
                        padding: EdgeInsets.only(top: 25,bottom: 25,left: 25,right: 15
                        ),
                        width: MediaQuery.of(context).size.width,
                        foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.65),
                                Colors.black.withOpacity(0.65)
                              ]
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: Color(0xffa41818),
                          image: DecorationImage(
                            image: NetworkImage("https://cdn.vectorstock.com/i/preview-1x/19/50/sale-and-discount-promo-background-vector-27471950.jpg"),
                            fit: BoxFit.cover
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 1.5,
                              offset: Offset(2,2)
                            )
                          ]
                        ),

                      ),

                        Positioned(
                          left: 20,right: 0,top: 20,bottom: 20,
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Row(
                              children: [
                                Icon(Icons.av_timer_outlined,color: Colors.white,size: 20,),

                                const SizedBox(width: 5,),

                                Text("Ends 26 May",style: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.bold,fontSize: 13)),
                              ],
                            ),

                            //const SizedBox(height: 10,),

                            Text("20% OFF SELECTED BIG BRAND TOYS",maxLines: 3,style: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.bold,fontSize: 26),),

                            //const SizedBox(height: 10,),

                            Text("Shop now",style: TextStyle(color: Colors.white.withOpacity(0.9),fontWeight: FontWeight.bold,fontSize: 14,decoration: TextDecoration.underline)),


                          ],
                        ),)
                      ]
                    ),
                  );
                }),

              ),

              //Top Categories Container
              topCategories2(context),


              // //Top Listview
              // Container(
              //   margin: const EdgeInsets.only(top: 15),
              //   height: MediaQuery.of(context).size.height * 0.05,
              //   child: ListView(
              //     padding: const EdgeInsets.only(
              //         top: 5, bottom: 5, left: 10, right: 10),
              //     scrollDirection: Axis.horizontal,
              //     physics: const BouncingScrollPhysics(),
              //     children: [
              //       GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             dailyDeals = true;
              //             weeklyDeals = false;
              //             monthlyDeals = false;
              //           });
              //         },
              //         child: Container(
              //           decoration: BoxDecoration(
              //               color: dailyDeals
              //                   ? const Color(0xfffd9926)
              //                   : const Color(0xfff3f5f7),
              //               borderRadius: BorderRadius.circular(50)),
              //           padding: const EdgeInsets.only(
              //               top: 5, bottom: 5, left: 20, right: 20),
              //           margin: const EdgeInsets.only(right: 5, left: 5),
              //           alignment: Alignment.center,
              //           child: Text(
              //             "Daily Deals",
              //             style: TextStyle(
              //               fontSize: 13,
              //                 color: dailyDeals
              //                     ? const Color(0xffffffff)
              //                     : const Color(0xff464646),
              //                 fontWeight: FontWeight.bold),
              //           ),
              //         ),
              //       ),
              //       GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             dailyDeals = false;
              //             weeklyDeals = true;
              //             monthlyDeals = false;
              //           });
              //         },
              //         child: Container(
              //           decoration: BoxDecoration(
              //               color: weeklyDeals
              //                   ? const Color(0xfffd9926)
              //                   : const Color(0xfff3f5f7),
              //               borderRadius: BorderRadius.circular(50)),
              //           padding: const EdgeInsets.only(
              //               top: 5, bottom: 5, left: 20, right: 20),
              //           margin: const EdgeInsets.only(right: 5, left: 5),
              //           alignment: Alignment.center,
              //           child: Text("Weekly Deals",
              //               style: TextStyle(
              //                   fontSize: 13,
              //                   color: weeklyDeals
              //                       ? Colors.white
              //                       : const Color(0xff464646),
              //                   fontWeight: FontWeight.bold)),
              //         ),
              //       ),
              //       GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             dailyDeals = false;
              //             weeklyDeals = false;
              //             monthlyDeals = true;
              //           });
              //         },
              //         child: Container(
              //           decoration: BoxDecoration(
              //               color: monthlyDeals
              //                   ? const Color(0xfffd9926)
              //                   : const Color(0xfff3f5f7),
              //               borderRadius: BorderRadius.circular(50)),
              //           padding: const EdgeInsets.only(
              //               top: 5, bottom: 5, left: 20, right: 20),
              //           margin: const EdgeInsets.only(right: 5, left: 5),
              //           alignment: Alignment.center,
              //           child: Text("Monthly Deals",
              //               style: TextStyle(
              //                   fontSize: 13,
              //
              //                   color: monthlyDeals
              //                       ? Colors.white
              //                       : const Color(0xff464646),
              //                   fontWeight: FontWeight.bold)),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              //
              // //Tab Slider Container
              // dailyDeals
              //     ? Container(
              //         padding: const EdgeInsets.only(top: 20),
              //         child: CarouselSlider(
              //             items: [
              //               //1st Item
              //
              //               homepageDeals(context,"https://wallpapercave.com/dwp2x/wp6580162.jpg","30% Off On PC Bundles"),
              //
              //               homepageDeals(context, "https://images.unsplash.com/photo-1603481588273-2f908a9a7a1b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Z2FtaW5nJTIwc2V0dXB8ZW58MHx8MHx8&w=1000&q=80",
              //                   "30% Off On PC Bundles")
              //
              //             ],
              //             options: CarouselOptions(
              //                 height:
              //                     MediaQuery.of(context).size.height * 0.3,
              //                 aspectRatio: 0.9,
              //                 viewportFraction: 1,
              //                 enlargeCenterPage: true)),
              //       )
              //     : const SizedBox(),
              //
              // weeklyDeals
              //     ? Container(
              //         padding: const EdgeInsets.only(top: 20),
              //         child: CarouselSlider(
              //             items: [
              //               //1st Item
              //               homepageDeals(context, "https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", "Upto 50% Off On Furniture"),
              //
              //
              //               //2nd item
              //               homepageDeals(context, "https://www.rollingstone.com/wp-content/uploads/2020/02/best-4k-projector.jpg", "Upto 50% Off On Furniture"),
              //             ],
              //             options: CarouselOptions(
              //                 height:
              //                     MediaQuery.of(context).size.height * 0.3,
              //                 aspectRatio: 0.9,
              //                 viewportFraction: 1,
              //                 enlargeCenterPage: true)),
              //       )
              //     : const SizedBox(),
              //
              // monthlyDeals
              //     ? Container(
              //         padding: const EdgeInsets.only(top: 20),
              //         child: CarouselSlider(
              //             items: [
              //
              //               homepageDeals(context, "https://media.istockphoto.com/id/626085868/photo/mens-accessories.jpg?s=612x612&w=0&k=20&c=M4QqVxeUyMeChfMqOucfxtVaVMZ51g00-2tlc_Vgrx0=",
              //                   "Upto 75% Off On Men Accessories"),
              //
              //             ],
              //             options: CarouselOptions(
              //                 height:
              //                     MediaQuery.of(context).size.height * 0.3,
              //                 aspectRatio: 0.9,
              //                 viewportFraction: 1,
              //                 enlargeCenterPage: true)),
              //       )
              //     : const SizedBox(),

              Headings(context, "Top Products"),

              //Top Products Slider
              topProducts(context),

              // Headings(context, "Top Categories"),
              //
              // topCategories(context),

              Headings(context, "Popular items this season"),

              Container(
                padding: const EdgeInsets.only(bottom: 0),
                // decoration: BoxDecoration(
                //     border: Border(bottom: BorderSide(width: 1.5,color: Color(0xfff1f1f1)))
                // ),
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                       const SingleProduct(
                                        tag: "popular1", productid: 'popular1',
                                      )));
                        },
                        child: popularItemsCon("popular1")),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                       const SingleProduct(
                                        tag: "popular2", productid: 'popular2',
                                      )));
                        },
                        child: popularItemsCon("popular2")),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                       const SingleProduct(
                                        tag: "popular3", productid: 'popular3',
                                      )));
                        },
                        child: popularItemsCon("popular3")),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                       const SingleProduct(
                                        tag: "popular4", productid: 'popular4',
                                      )));
                        },
                        child: popularItemsCon("popular4"))
                  ],
                ),
              ),

              //New Arrivals Heading
              Container(
                  //color: const Color(0xffe7e7e7),
                  child: Headings(context, "New Arrivals")),

              //New Arrivals Container
              Container(
                padding: const EdgeInsets.only(bottom: 0),
                // decoration: BoxDecoration(
                //     border: Border(bottom: BorderSide(width: 1.5,color: Color(0xfff1f1f1)))
                // ),
                child: Column(
                  children: [
                    newArrivalCon(
                        "https://www.czone.com.pk/Images/Thumbnails/33-czone.com.pk-1540-14487-130323100252.jpg",
                        "Twisted Minds Y Shaped Gaming Desk - Carbon Finish",
                        "599"),
                    newArrivalCon(
                        "https://www.czone.com.pk/Images/Thumbnails/15-czone.com.pk-1540-14485-130323093509.jpg",
                        "HP OMEN 17.3 Red Backpack 4YJ80AA | Black, Red",
                        "49"),
                    newArrivalCon(
                        "https://www.czone.com.pk/images/thumbnails-large/81mwdmhcbol.-sl1500--1540-8922-021219100151.jpg",
                        "Asus ROG Strix XG32VQR Curved HDR Gaming Monitor 31.5",
                        "999"),
                    newArrivalCon(
                        "https://www.czone.com.pk/images/thumbnails-large/copy-1-czone.com.pk-1540-14352-100223094654.jpg",
                        "HP 15s-EQ2179AU Laptop - AMD Ryzen 3 5300U, 4GB, 256GB SSD, 15.6",
                        "749"),
                  ],
                ),
              ),

              // Headings(context, "Discount Electronics"),
              //
              // Container(
              //   decoration: const BoxDecoration(
              //       border: Border(
              //           bottom: BorderSide(
              //               width: 1.5, color: Color(0xfff1f1f1)))),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Container(
              //         height: MediaQuery.of(context).size.height * 0.5,
              //         width: MediaQuery.of(context).size.width,
              //         padding: const EdgeInsets.only(
              //             top: 0, bottom: 20, left: 15, right: 15),
              //         child: GridView.builder(
              //             physics: const NeverScrollableScrollPhysics(),
              //             scrollDirection: Axis.horizontal,
              //             gridDelegate:
              //                 const SliverGridDelegateWithFixedCrossAxisCount(
              //                     crossAxisCount: 2,
              //                     mainAxisSpacing: 10,
              //                     crossAxisSpacing: 10,
              //                     childAspectRatio: 1.085),
              //             padding: const EdgeInsets.all(0),
              //             itemCount: 4,
              //             itemBuilder: (BuildContext context, index) {
              //               return Container(
              //                 width: MediaQuery.of(context).size.width / 2,
              //                 height:
              //                     MediaQuery.of(context).size.height * 0.25,
              //                 margin: const EdgeInsets.all(3),
              //                 decoration: BoxDecoration(
              //                     color: Colors.white,
              //                     image: const DecorationImage(
              //                         image: NetworkImage(
              //                             "https://m.media-amazon.com/images/I/61-PblYntsL._AC_UY545_QL65_.jpg"),
              //                         fit: BoxFit.scaleDown),
              //                     borderRadius: BorderRadius.circular(8),
              //                     boxShadow: [
              //                       BoxShadow(
              //                           color: Colors.black.withOpacity(0.15),
              //                           offset: const Offset(0, 0),
              //                           spreadRadius: 1,
              //                           blurRadius: 1.5)
              //                     ]),
              //               );
              //             }),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(bottom: 20),
              //         child: SizedBox(
              //           width: MediaQuery.of(context).size.width,
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Container(
              //                 padding: const EdgeInsets.only(
              //                     top: 0, bottom: 0, left: 20, right: 5),
              //                 // decoration: BoxDecoration(
              //                 //     borderRadius: BorderRadius.circular(7),
              //                 //     color: const Color(0xff9933ff),
              //                 //     boxShadow: [
              //                 //       BoxShadow(
              //                 //           color: Colors.black.withOpacity(0.15),
              //                 //           blurRadius: 5,
              //                 //           offset: const Offset(0, 0))
              //                 //     ]),
              //                 margin: const EdgeInsets.only(
              //                     top: 0, right: 0, bottom: 0),
              //                 child: const Text(
              //                   "See more",
              //                   style: TextStyle(
              //                       //fontFamily: "Fira-SemiBold",
              //                       color: Color(0xff00854e),
              //                       fontSize: 13),
              //                   softWrap: true,
              //                   overflow: TextOverflow.ellipsis,
              //                 ),
              //               ),
              //
              //               // const Icon(Icons.keyboard_double_arrow_right_outlined,size: 20,color: Color(
              //               //     0xff00854e),)
              //             ],
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),

              Headings(context, "Tablets under \$100"),

              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1.5, color: Color(0xfff1f1f1)))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 20, left: 15, right: 15),
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1.085),
                          padding: const EdgeInsets.all(0),
                          itemCount: 4,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height:
                                  MediaQuery.of(context).size.height * 0.25,
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://m.media-amazon.com/images/I/61NGnpjoRDL._AC_UY545_FMwebp_QL65_.jpg"),
                                      fit: BoxFit.scaleDown),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        offset: const Offset(0, 0),
                                        spreadRadius: 1,
                                        blurRadius: 1.5)
                                  ]),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 0, bottom: 0, left: 20, right: 5),
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(7),
                              //     color: const Color(0xff9933ff),
                              //     boxShadow: [
                              //       BoxShadow(
                              //           color: Colors.black.withOpacity(0.15),
                              //           blurRadius: 5,
                              //           offset: const Offset(0, 0))
                              //     ]),
                              margin: const EdgeInsets.only(
                                  top: 0, right: 0, bottom: 0),
                              child: const Text(
                                "Shop now",
                                style: TextStyle(
                                    //fontFamily: "Fira-SemiBold",
                                    color: Color(0xff00854e),
                                    fontSize: 13),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            // const Icon(Icons.keyboard_double_arrow_right_outlined,size: 20,color: Color(
                            //     0xff00854e),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //Subscription Container
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 40,bottom: 40,left: 15,right: 15),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text("Subscribe to our newsletter",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                    const SizedBox(height: 10,),

                    Text("Be the first to get the latest news about trends, promotions and much more!",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 12),),

                    const SizedBox(height: 20,),


                Container(
                  height: 50,
                  child: TextField(

                    decoration: InputDecoration(
                      labelText: 'Enter your email address',
                      labelStyle: TextStyle(fontSize: 13),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),

                    const SizedBox(height: 20,),

                    Container(
                      padding: EdgeInsets.only(top: 15,bottom: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(3)
                      ),
                      child: Text("SUBSCRIBE",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                    ),

                    const SizedBox(height: 20,),

                    Text("I would like to unsubscribe",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)

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
                style:  TextStyle(
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
                  style: TextStyle(fontSize: 13,
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget topCategories2(BuildContext context)
  {
    return Container(
      height: MediaQuery.of(context).size.height*0.55,
      padding: EdgeInsets.all(15),
      color: Color(0xffeef2f5),

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
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SingleCategory(tag: "TC1")));
                      },
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                            margin: EdgeInsets.only(right: 10,bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow:[
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: Offset(0,0)
                                  )
                                ]
                            ),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [

                                Text("Smartphones",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                                const SizedBox(height: 5,),

                                Text("Order from your favourite brand and what ever your like",style: TextStyle(fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,)

                              ],
                            ),

                          ),

                          Positioned(
                              bottom: 12,
                              left: 10,right: 12,
                              child: Hero(
                                tag: "TC1",
                                child: Container(
                                  width: 75,height: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      image: DecorationImage(image: NetworkImage("https://imageio.forbes.com/specials-images/imageserve/60e48ef5423e512de205d104/Apple-iPhone-12-Pro--Pacific-Blue-/960x0.jpg?format=jpg&width=960"),
                                          colorFilter: ColorFilter.mode(Colors.white, BlendMode.dstIn),
                                          fit: BoxFit.cover)
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )),

                //2nd Category
                GestureDetector(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SingleCategory(tag: "TC2")));
                  },
                  child: Stack(
                      children:[

                        Container(
                          margin: EdgeInsets.only(right: 10,bottom: 10),
                          padding: EdgeInsets.only(top: 10,left: 10,right: 90,bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow:[
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: Offset(0,0)
                                )
                              ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,

                            children: [

                              Text("Smartphone",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                              const SizedBox(height: 5,),

                              Text("Enjoy up to 20% off and what ever your like",style: TextStyle(fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,)

                            ],
                          ),
                        ),

                        Positioned(
                            bottom: 12,
                            right: 12,
                            child: Hero(
                              tag: "TC2",
                              child: Container(
                                width: 90,height: 75,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(image: NetworkImage("https://imageio.forbes.com/specials-images/imageserve/60e48ef5423e512de205d104/Apple-iPhone-12-Pro--Pacific-Blue-/960x0.jpg?format=jpg&width=960"),
                                      fit: BoxFit.cover,)
                                ),
                              ),
                            ))
                      ]
                  ),
                ),

                //3rd Category
                GestureDetector(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SingleCategory(tag: "TC3")));
                  },
                  child: Stack(
                      children:[

                        Container(
                          margin: EdgeInsets.only(right: 10,bottom: 10),
                          padding: EdgeInsets.only(top: 10,left: 10,right: 90,bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow:[
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: Offset(0,0)
                                )
                              ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,

                            children: [

                              Text("Food ",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                              const SizedBox(height: 5,),

                              Text("Deals up to 40% off and what ever your like",style: TextStyle(fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,)

                            ],
                          ),
                        ),

                        Positioned(
                            bottom: 10,
                            right: 13,
                            child: Hero(
                              tag: "TC3",
                              child: Container(
                                width: 90,height: 75,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(image: AssetImage("assets/images/Italy_pasta-removebg-preview.png"),
                                      fit: BoxFit.cover,)
                                ),
                              ),
                            ))
                      ]
                  ),
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
                    flex:2,
                    child: GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SingleCategory(tag: "TC4")));
                      },
                      child: Stack(
                          children: [

                            Container(
                              padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                              margin: EdgeInsets.only(right: 10,bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow:[
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: Offset(0,0)
                                  )
                                ],

                              ),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,

                                children: [

                                  Text("Beauty",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                                  const SizedBox(height: 5,),

                                  Text("Discover the latest trends and techniques in skincare, makeup, haircare, and more to help you look and feel your best.",style: TextStyle(fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,)

                                ],
                              ),

                            ),

                            Positioned(
                                bottom: 10,
                                right: 13,
                                child: Hero(
                                  tag: "TC4",
                                  child: Container(
                                    width: 100,height: 75,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        image: DecorationImage(image: AssetImage("assets/images/Italy_pasta-removebg-preview.png"),
                                          fit: BoxFit.cover,)
                                    ),
                                  ),
                                ))

                          ]
                      ),
                    )),

                //5th Category
                GestureDetector(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SingleCategory(tag: "TC5")));
                  },
                  child: Stack(
                      children: [Container(
                        padding: EdgeInsets.only(top: 10,left: 10,bottom: 10),
                        margin: EdgeInsets.only(right: 10,bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow:[
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  offset: Offset(0,0)
                              )
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,

                          children: [

                            Text("Furniture",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                            const SizedBox(height: 5,),

                            Text("Everyday\nessentials",style: TextStyle(fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,)

                          ],
                        ),
                      ),


                        Positioned(
                            bottom: 10,
                            right: 13,
                            child: Hero(
                              tag: "TC5",
                              child: Container(
                                width: 100,height: 75,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(image: AssetImage("assets/images/Italy_pasta-removebg-preview.png"),
                                      fit: BoxFit.cover,)
                                ),
                              ),
                            ))
                      ]
                  ),
                ),

                //6th Category
                GestureDetector(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SingleCategory(tag: "TC6")));
                  },
                  child: Stack(
                      children: [Container(
                        padding: EdgeInsets.only(top: 10,left: 10,bottom: 10,right: 90),
                        margin: EdgeInsets.only(right: 10,bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow:[
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  offset: Offset(0,0)
                              )
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,

                          children: [

                            Text("Books",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                            const SizedBox(height: 5,),

                            Text("Read out and save 25%\n",style: TextStyle(fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,)

                          ],
                        ),
                      ),

                        Positioned(
                            bottom: 12,
                            right: 12,
                            child: Hero(
                              tag: "TC6",
                              child: Container(
                                width: 90,height: 75,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(image: NetworkImage("https://imageio.forbes.com/specials-images/imageserve/60e48ef5423e512de205d104/Apple-iPhone-12-Pro--Pacific-Blue-/960x0.jpg?format=jpg&width=960"),
                                      fit: BoxFit.cover,)
                                ),
                              ),
                            ))

                      ]
                  ),
                ),

                //View All Categories
                GestureDetector(
                  onTap: ()
                  {
                    Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => AllCategories()));
                  },
                  child: Stack(
                      children: [Container(
                        padding: EdgeInsets.only(top: 10,left: 10,bottom: 10),
                        margin: EdgeInsets.only(right: 10,bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow:[
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  offset: Offset(0,0)
                              )
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,

                          children: [

                            Text("View all",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                            const SizedBox(height: 5,),

                            Text("Exotic\nCategories",style: TextStyle(fontSize: 12),maxLines: 2,overflow: TextOverflow.ellipsis,)

                          ],
                        ),
                      ),

                        Positioned(
                            bottom: 12,
                            right: 12,
                            child: Container(
                              width: 90,height: 75,
                              decoration: BoxDecoration(
                                color: Colors.transparent,

                              ),
                              child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                                  child: Icon(Icons.more_outlined,size: 40,color: Colors.black.withOpacity(0.75),)),
                            ))
                      ]
                  ),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>  const SingleProduct(
                            tag: "TP1", productid: '123',
                          )));
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
                          "Earbuds",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
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
                      ))
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>  const SingleProduct(
                            tag: "TP2", productid: '1234',
                          )));
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
                      ))
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>  const SingleProduct(
                            tag: "TP3", productid: '12345',
                          )));
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
                      ))
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

Widget homepageDeals(BuildContext context, String imageurl,String dealTitle)
{
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
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.65)
              ],
            ),
          ),
          decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(2),
              image:  DecorationImage(
                  image: NetworkImage(
                      imageurl),
                  fit: BoxFit.fill)),
        ),

        Positioned(
            top: 15,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child:  Text(
                dealTitle,
                style: const TextStyle(
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
                  bottomRight: Radius.circular(2),
                  bottomLeft: Radius.circular(2)),
              //color: Colors.white70,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(2),
                  bottomLeft: Radius.circular(2)),
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
                        Radius.circular(2),
                        bottomLeft:
                        Radius.circular(
                            2)),
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
      ],
    ),
  );
}


launchURL(String URL) async {
  final url = URL;
  final uri = Uri.parse(url);

  await launchUrl(uri, mode: LaunchMode.externalApplication);
}