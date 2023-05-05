import 'package:e_commerce/Screens/SingleProduct.dart';
import 'package:e_commerce/Widgets/Headings.dart';
import 'package:e_commerce/Widgets/SortandFilter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Widgets/PriceRangeFilter.dart';
import 'SearchPage.dart';

class SingleCategory extends StatefulWidget {
  const SingleCategory({Key? key, required this.tag}) : super(key: key);

  final String tag;

  @override
  State<SingleCategory> createState() => _SingleCategoryState();
}

class _SingleCategoryState extends State<SingleCategory> {
  String _selectedSize = "Sort By";
  
  bool searchbar = false;

  Color inStoreColor = Color(0xfff3f5f7);

  ScrollController _scrollController = ScrollController();
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    super.dispose();
  }

  void _handleScroll() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse && _isVisible == true) {
      setState(() {
        _isVisible = false;
      });
    } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward && _isVisible == false) {
      setState(() {
        _isVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize
        (
        preferredSize: searchbar? Size.fromHeight(MediaQuery.of(context).size.height*0.14) : Size.fromHeight(MediaQuery.of(context).size.height*0.075),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: AppBar(
            backgroundColor: const Color(0xFF0071dc),
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: const BackButton(
              color: Colors.white,
            ),
            leadingWidth: 10,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.tag,

                  child: Container(
                    //margin: EdgeInsets.only(left: 75),
                    height: kToolbarHeight,
                    width: MediaQuery.of(context).size.width *0.4,
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/logo-removebg-preview.png"),fit: BoxFit.contain)),),
                ),
              ],
            ),

            actions: [

              GestureDetector(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SearchPage()));
                  },
                  child: Hero(
                      tag: "searchbar",
                      child: Icon(CupertinoIcons.search_circle,size: 30,))),

              const SizedBox(width: 20,),

              Icon(CupertinoIcons.shopping_cart),

              const SizedBox(width: 15,),

            ],

            // bottom:searchbar? PreferredSize(preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.05),
            //     child: Column(
            //       children: [
            //         SearchBar(context),
            //       ],
            //     )) : PreferredSize(child: SizedBox(), preferredSize: Size.fromHeight(0))
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(children: [

            // Row(
            //   children: [
            //
            //     //Sort Container
            //     GestureDetector(
            //       onTap: () {
            //         showCupertinoModalPopup<void>(
            //           context: context,
            //           builder: (BuildContext context) => CupertinoActionSheet(
            //             title: Text(
            //               'Sort By',
            //               style: TextStyle(
            //                   color: Colors.black.withOpacity(0.9),
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold),
            //             ),
            //             //message: const Text('Message'),
            //             actions: <CupertinoActionSheetAction>[
            //               CupertinoActionSheetAction(
            //                 /// This parameter indicates the action would be a default
            //                 /// defualt behavior, turns the action's text to bold text.
            //                 isDefaultAction: false,
            //                 onPressed: () {
            //                   setState(() {
            //                     _selectedSize = "Relevance";
            //                   });
            //                   Navigator.pop(context);
            //                 },
            //                 child: const Text('Relevance'),
            //               ),
            //               CupertinoActionSheetAction(
            //                 /// This parameter indicates the action would be a default
            //                 /// defualt behavior, turns the action's text to bold text.
            //                 isDefaultAction: false,
            //                 onPressed: () {
            //                   setState(() {
            //                     _selectedSize = "Title A-Z";
            //                   });
            //                   Navigator.pop(context);
            //                 },
            //                 child: const Text('Title A-Z'),
            //               ),
            //               CupertinoActionSheetAction(
            //                 /// This parameter indicates the action would be a default
            //                 /// defualt behavior, turns the action's text to bold text.
            //                 isDefaultAction: false,
            //                 onPressed: () {
            //                   setState(() {
            //                     _selectedSize = "Price: Low - High";
            //                   });
            //                   Navigator.pop(context);
            //                 },
            //                 child: const Text('Price: Low - High'),
            //               ),
            //               CupertinoActionSheetAction(
            //                 /// This parameter indicates the action would be a default
            //                 /// defualt behavior, turns the action's text to bold text.
            //                 isDefaultAction: false,
            //                 onPressed: () {
            //                   setState(() {
            //                     _selectedSize = "Price: High - Low";
            //                   });
            //                   Navigator.pop(context);
            //                 },
            //                 child: const Text('Price: High - Low'),
            //               ),
            //               CupertinoActionSheetAction(
            //                   isDefaultAction: true,
            //                   onPressed: () => Navigator.pop(context),
            //                   child: const Text(
            //                     "Cancel",
            //                     style: TextStyle(color: Colors.red),
            //                   ))
            //             ],
            //           ),
            //         );
            //       },
            //       child: Container(
            //         alignment: Alignment.center,
            //         width: MediaQuery.of(context).size.width/3,
            //         margin: const EdgeInsets.only(
            //             top: 10, bottom: 20, left: 15, right: 15),
            //         padding: const EdgeInsets.all(10),
            //         decoration: BoxDecoration(
            //             color: const Color(0xfff3f5f7),
            //             borderRadius: BorderRadius.circular(5),
            //             boxShadow: [
            //               BoxShadow(
            //                   color: Colors.black.withOpacity(0.15),
            //                   blurRadius: 1,
            //                   offset: const Offset(0, 0))
            //             ]),
            //         child: Text(
            //           "$_selectedSize",
            //           style: const TextStyle(fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ),
            //
            //
            //
            //   ],
            // )

            //Filter Container

            _isVisible? Headings(context, "Jeans") : SizedBox(),


            _isVisible?
            Container(
              height: MediaQuery.of(context).size.height*0.065,

              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.1)))
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                scrollDirection: Axis.horizontal,
                children: [

                  //Sort By
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        context: context,
                        builder: (BuildContext context) => SortandFilter(),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      //width: MediaQuery.of(context).size.width*0.25,

                      margin: EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.only(left: 25,right: 25,bottom: 5,top: 5),

                      decoration: BoxDecoration(
                          color: const Color(0xfff3f5f7),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 1,
                                offset: const Offset(0, 0))
                          ]),
                      child: Row(
                        children: [

                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                            child: Icon(Icons.sort,size: 17,),
                          ),

                          const SizedBox(width: 5,),

                          Text(
                            "$_selectedSize",
                            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                          ),

                          const SizedBox(width: 5,),

                          Icon(Icons.keyboard_arrow_down,size: 18,)
                        ],
                      ),
                    ),
                  ),

                  //In Store Container
                  GestureDetector(
                    onTap: ()
                    {
                      setState(() {
                        inStoreColor = Color(0xff2d2d2d);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      //width: MediaQuery.of(context).size.width*0.25,

                      margin: EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.only(left: 25,right: 25,bottom: 5,top: 5),
                      decoration: BoxDecoration(
                          color: inStoreColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 1,
                                offset: const Offset(0, 0))
                          ]),
                      child: Text(
                        "In Store",
                        style:  TextStyle(color: (inStoreColor == Color(0xff2d2d2d))? Colors.white : Colors.black ,fontWeight: FontWeight.bold,fontSize: 12),
                      ),
                    ),
                  ),

                  //Price Range
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(

                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),),
                        context: context,
                        builder: (BuildContext context) {
                          return  Container(
                            height: MediaQuery.of(context).size.height*0.35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: PriceRangeFilter());
                        },
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      //width: MediaQuery.of(context).size.width*0.25,

                      margin: EdgeInsets.only(right: 0),
                      padding: const EdgeInsets.only(left: 25,right: 25,bottom: 5,top: 5),

                      decoration: BoxDecoration(
                          color: const Color(0xfff3f5f7),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 1,
                                offset: const Offset(0, 0))
                          ]),
                      child: Row(
                        children: [

                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xfff3f5f7),
                                border: Border.all(color: Colors.black.withOpacity(0.5))
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black.withOpacity(0.5),
                                //     spreadRadius: 1,
                                //     blurRadius: 0.5,
                                //     offset: Offset(0,0)
                                //   )
                                // ]
                              ),
                              padding: EdgeInsets.all(2),
                              child: Icon(Icons.price_check,size: 12,)),

                          const SizedBox(width: 5,),

                          Text(
                            "Price Range",
                            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                          ),

                          const SizedBox(width: 5,),

                          Icon(Icons.keyboard_arrow_down,size: 18,)
                        ],
                      ),
                    ),
                  ),

                  //Clear all Filters
                  GestureDetector(
                    onTap: ()
                    {

                    },
                    child: Container(
                      alignment: Alignment.center,
                      //width: MediaQuery.of(context).size.width*0.25,

                      padding: const EdgeInsets.only(left: 25,right: 25,bottom: 5,top: 5),
                      // decoration: BoxDecoration(
                      //     color: inStoreColor,
                      //     borderRadius: BorderRadius.circular(20),
                      //     boxShadow: [
                      //       BoxShadow(
                      //           color: Colors.black.withOpacity(0.15),
                      //           blurRadius: 1,
                      //           offset: const Offset(0, 0))
                      //     ]),
                      child: Text(
                        "Clear all",
                        style:  TextStyle(color: Colors.black,fontSize: 13),
                      ),
                    ),
                  ),

                ],
              ),
            ) : SizedBox(),

            //SearchBar(context),

            // //Filter Container
            // GestureDetector(
            //   onTap: () {
            //     showCupertinoModalPopup<void>(
            //       context: context,
            //       builder: (BuildContext context) => CupertinoActionSheet(
            //         title: Text(
            //           'Sort By',
            //           style: TextStyle(
            //               color: Colors.black.withOpacity(0.9),
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold),
            //         ),
            //         //message: const Text('Message'),
            //         actions: <CupertinoActionSheetAction>[
            //           CupertinoActionSheetAction(
            //             /// This parameter indicates the action would be a default
            //             /// defualt behavior, turns the action's text to bold text.
            //             isDefaultAction: false,
            //             onPressed: () {
            //               setState(() {
            //                 _selectedSize = "Relevance";
            //               });
            //               Navigator.pop(context);
            //             },
            //             child: const Text('Relevance'),
            //           ),
            //           CupertinoActionSheetAction(
            //             /// This parameter indicates the action would be a default
            //             /// defualt behavior, turns the action's text to bold text.
            //             isDefaultAction: false,
            //             onPressed: () {
            //               setState(() {
            //                 _selectedSize = "Title A-Z";
            //               });
            //               Navigator.pop(context);
            //             },
            //             child: const Text('Title A-Z'),
            //           ),
            //           CupertinoActionSheetAction(
            //             /// This parameter indicates the action would be a default
            //             /// defualt behavior, turns the action's text to bold text.
            //             isDefaultAction: false,
            //             onPressed: () {
            //               setState(() {
            //                 _selectedSize = "Price: Low - High";
            //               });
            //               Navigator.pop(context);
            //             },
            //             child: const Text('Price: Low - High'),
            //           ),
            //           CupertinoActionSheetAction(
            //             /// This parameter indicates the action would be a default
            //             /// defualt behavior, turns the action's text to bold text.
            //             isDefaultAction: false,
            //             onPressed: () {
            //               setState(() {
            //                 _selectedSize = "Price: High - Low";
            //               });
            //               Navigator.pop(context);
            //             },
            //             child: const Text('Price: High - Low'),
            //           ),
            //           CupertinoActionSheetAction(
            //               isDefaultAction: true,
            //               onPressed: () => Navigator.pop(context),
            //               child: const Text(
            //                 "Cancel",
            //                 style: TextStyle(color: Colors.red),
            //               ))
            //         ],
            //       ),
            //     );
            //   },
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     margin: const EdgeInsets.only(
            //         top: 10, bottom: 20, left: 15, right: 15),
            //     padding: const EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //         color: const Color(0xfff3f5f7),
            //         borderRadius: BorderRadius.circular(5),
            //         boxShadow: [
            //           BoxShadow(
            //               color: Colors.black.withOpacity(0.15),
            //               blurRadius: 1,
            //               offset: const Offset(0, 0))
            //         ]),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           "Sort By: $_selectedSize",
            //           style: const TextStyle(fontWeight: FontWeight.bold),
            //         ),
            //         const Icon(Icons.arrow_downward_rounded)
            //       ],
            //     ),
            //   ),
            // ),

            //Products Grid
            Expanded(
              child: GridView(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 5),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 10, right: 10),
                physics: const BouncingScrollPhysics(),
                children: [
                  productsContainer2(
                      "https://www.luxury-legs.com/images/zerres-sarah-fine-ribbed-velvet-jeans-p4248-194915_medium.jpg",
                      "ZERRES",
                      "Cora Crop Jeans Gina Wellness Lightweight Trousers Gina Wellness Lightweight Trousers Gina Wellness Lightweight Trousers",
                      "79.00",
                    true, "P1"
                  ),
                  productsContainer2(
                      "https://images.salesfire.co.uk/49ae2095-f508-4fc4-96cc-a58e99bed522/600x600/4247/r-contain/c-FFFFFFFF/1983395332.webp",
                      "ZERRES",
                      "Gina Wellness Lightweight Trousers",
                      "89.00",
                    false, "P2"
                      ),
                  productsContainer2(

                      "https://www.luxury-legs.com/images/zerres-carla-snake-trouser-p4358-209223_medium.jpg",
                      "ZERRES",
                      "Carla Snake Trousers",
                      "99.00",
                    true, "P3"
                     ),
                  productsContainer2(
                      "https://www.luxury-legs.com/images/zerres-sarah-fine-ribbed-velvet-jeans-p4248-194915_medium.jpg",
                      "ZERRES",
                      "Sarah Fine Ribbed Velvet Jeans",
                      "95.00",
                    true, "P4"
                     ),
                  productsContainer2(
                      "https://www.luxury-legs.com/images/zerres-sarah-flower-capri-p4476-209249_medium.jpg",
                      "ZERRES",
                      "Sarah Flower Capri",
                      "109.00",
                    false, "P5"
                     ),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height*0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black,size: 15,),
                        onPressed: () {

                        },
                      ),
                    ),
                  SizedBox(width: 8.0),

                    Text("1"),

                    SizedBox(width: 8,),

                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black,size: 15,),
                        onPressed: () {

                        },
                      ),
                    ),
                ],
              ),
            ),

            //   ListView(
            //     padding: EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //
            //   children: [
            //
            //     CategoryProductsCon(context,"https://www.luxury-legs.com/images/zerres-sarah-fine-ribbed-velvet-jeans-p4248-194915_medium.jpg", "ZERRES", "Cora Crop Jeans", "79.00",
            //         "https://images.salesfire.co.uk/49ae2095-f508-4fc4-96cc-a58e99bed522/600x600/4247/r-contain/c-FFFFFFFF/1983395332.webp", "ZERRES", "Gina Wellness Lightweight Trousers", "89.00"),
            //
            //     CategoryProductsCon(context,"https://www.luxury-legs.com/images/zerres-carla-snake-trouser-p4358-209223_medium.jpg", "ZERRES", "Carla Snake Trousers", "99.00",
            //         "https://www.luxury-legs.com/images/zerres-sarah-fine-ribbed-velvet-jeans-p4248-194915_medium.jpg", "ZERRES", "Sarah Fine Ribbed Velvet Jeans", "95.00"),
            //
            //     CategoryProductsCon(context, "https://www.luxury-legs.com/images/zerres-sarah-flower-capri-p4476-209249_medium.jpg", "ZERRES", "Sarah Flower Capri", "109.00",
            //         "https://www.luxury-legs.com/images/mac-dream-summer-denim-culotte-p4374-209617_medium.jpg", "MAC", "Dream Summer Denim Culotte", "109.00")
            //   ],
            // ),
          ]),
        ),
      ),
    );
  }

  Widget SearchBar(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SearchPage()));
      },
      child: Container(
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

            Hero(
              tag: "searchbar",
              child: Container(
                  padding: const EdgeInsets.only(left: 5,right: 0,top: 0,bottom: 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffffffff)
                  ),
                  child: const Icon(Icons.search,color: Colors.black, size: 22,)),
            ),

            const SizedBox(width: 10),

            Expanded(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 0),

                  child: Text(
                    "What are you looking for?",
                    style: const TextStyle(color: Color(0xFF8F8F9E), fontSize: 15),
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
    );
  }

  Widget SingleProductCon(BuildContext context, String I1, String T1, String C1,
      String P1, bool New, bool isFirst,String tag,String id) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => SingleProduct(tag: tag, productid: '',)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        //margin: EdgeInsets.only(right: 10),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                  tag: tag,
                  child: SizedBox(height: 200, child: Image.network("$I1"))),

              //Colors Row
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(bottom: 5),
                decoration: const BoxDecoration(color: Color(0xffeeeeee)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isFirst
                        ? Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.luxury-legs.com/images/attributes/1662978584-47028100.jpg"))),
                        )
                        : Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/attributes/1662978584-47028100.jpg"))),
                          ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.luxury-legs.com/images/attributes/1664548021-60351300.jpg"))),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.luxury-legs.com/images/attributes/1659959376-87332900.jpg"))),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.luxury-legs.com/images/attributes/1676456531-21759000.jpg"))),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.luxury-legs.com/images/attributes/1676456531-44075100.jpg"))),
                    ),
                  ],
                ),
              ),
              //Title Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text("$T1",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        //textScaleFactor: 1.1,
                        style: const TextStyle(
                            color: Colors.black87,
                            //fontFamily: 'Fira-SemiBold',
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ),
                ],
              ),

              const SizedBox(
                height: 5,
              ),

              //Category Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text("$C1",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textScaleFactor: 1.1,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            // fontFamily: 'Fira-Regular',
                            fontSize: 12)),
                  ),
                ],
              ),

              const SizedBox(
                height: 5,
              ),

              //Cost Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "£ ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$P1",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          New
              ? Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    decoration: const BoxDecoration(color: Color(0xffeeeeee)),
                    alignment: Alignment.center,
                    child: const Text(
                      "New Arrivals",
                      style: TextStyle(fontSize: 12),
                    ),
                  ))
              : const SizedBox(),
        ]),
      ),
    );
  }

  Widget CategoryProductsCon(
    BuildContext context,
    String I1,
    String T1,
    String C1,
    String P1,
    String I2,
    String T2,
    String C2,
    String P2,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              margin: const EdgeInsets.only(right: 10),
              child: Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 200, child: Image.network("$I1")),

                    //Colors Row
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: const BoxDecoration(color: Color(0xffeeeeee)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/attributes/1662978584-47028100.jpg"))),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/attributes/1664548021-60351300.jpg"))),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/attributes/1659959376-87332900.jpg"))),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/attributes/1676456531-21759000.jpg"))),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/attributes/1676456531-44075100.jpg"))),
                          ),
                        ],
                      ),
                    ),
                    //Title Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text("$T1",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              //textScaleFactor: 1.1,
                              style: const TextStyle(
                                  color: Colors.black87,
                                  //fontFamily: 'Fira-SemiBold',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    //Category Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text("$C1",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textScaleFactor: 1.1,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  // fontFamily: 'Fira-Regular',
                                  fontSize: 12)),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    //Cost Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "£ ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$P1",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      decoration: const BoxDecoration(color: Color(0xffeeeeee)),
                      alignment: Alignment.center,
                      child: const Text(
                        "New Arrivals",
                        style: TextStyle(fontSize: 12),
                      ),
                    )),
              ]),
            ),
          ),
          Flexible(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(I2))),
                    ),

                    //Colors Row
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: const BoxDecoration(color: Color(0xffeeeeee)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/attributes/1662978584-47028100.jpg"))),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/attributes/1664548021-60351300.jpg"))),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/attributes/1659959376-87332900.jpg"))),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/attributes/1676456531-21759000.jpg"))),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.luxury-legs.com/images/attributes/1676456531-44075100.jpg"))),
                          ),
                        ],
                      ),
                    ),
                    //Title Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text("$T2",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              //textScaleFactor: 1.1,
                              style: const TextStyle(
                                  color: Colors.black87,
                                  //fontFamily: 'Fira-SemiBold',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    //Category Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text("$C2",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textScaleFactor: 1.1,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  //fontFamily: 'Fira-Regular',
                                  fontSize: 12)),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    //Cost Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "£ ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$P2",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      decoration: const BoxDecoration(color: Color(0xffeeeeee)),
                      alignment: Alignment.center,
                      child: const Text(
                        "New Arrivals",
                        style: TextStyle(fontSize: 12),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productsContainer2(String image,String title,String category,String price,bool New, String tag)
  {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SingleProduct(tag: tag, productid: "1"))),
      child: Container(

        margin: const EdgeInsets.only(right: 15,top: 2,bottom: 2),
        width: MediaQuery.of(context).size.width/2,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.1)))
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Stack(
                children: [
                  Hero(
                    tag: tag,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: Image.network(image)),
                  ),

                  //Wishlist Positioned
                  Positioned(
                      right: 5,top: 5,
                      child: GestureDetector(
                        onTap: ()
                        {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item added to Wishlist")));

                        },
                        child: Container(

                          decoration: const BoxDecoration(

                          ),
                          child: const Icon(Icons.favorite_outline,color: Color(
                              0xffFF3D6A),size: 20,weight: 0.1,),
                        ),
                      )
                  ),


                  //Add to Cart Positioned
                  Positioned(
                      right: 0,bottom: 3,
                      child: GestureDetector(
                        onTap: ()
                        {
                          // cartProv.addProduct(Product(id: widget.productid, title: "ZERRES", quantity: 1, price: 99.00));

                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item added to Cart")));
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 10,right: 18,top: 8,bottom: 8),
                          decoration: BoxDecoration(
                              color: const Color(0xFF0071dc),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(bottom: 1),
                                child: Icon(Icons.add,color: Colors.white,size: 14,weight: 0.1,),
                              ),
                              SizedBox(width: 5,),
                              Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),)
                            ],
                          ),
                        ),
                      )
                  ),

                  New
                      ? Positioned(
                      top: 0,
                      left: 0,

                      child: Container(
                        margin: EdgeInsets.only(left: 3,top: 3),
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 5, bottom: 5),
                        decoration:  BoxDecoration(color: Color(0xFFfc9038),
                        borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: const Text(
                          "New Arrivals",
                          style: TextStyle(fontSize: 12,color: Colors.white),
                        ),
                      ))
                      : const SizedBox(),
                ]
            ),

            //const SizedBox(height: 10,),

            Padding(
        padding: const EdgeInsets.only(left: 0,right: 10),

        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              const Text(
                "£",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              Text(
                price,
                style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
              ),

               const SizedBox(width: 5,),

               Text(
                "£100.00",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.4),decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
      ),

            Flexible(
              child: Column(
                children: [
                  const SizedBox(height: 5,),

                  Padding(
                    padding: const EdgeInsets.only(left: 0,right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              //border: Border(right: BorderSide(color: Colors.black.withOpacity(0.1)))
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //Title Row
                                Padding(
                                  padding: const EdgeInsets.only(left: 0,right: 5),
                                  child: Text(
                                      title,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12
                                      )
                                  ),
                                ),

                                const SizedBox(height: 5,),

                                //Category Row
                                Padding(
                                  padding: const EdgeInsets.only(left: 0,right: 5),
                                  child: Text(
                                    category,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    textScaleFactor: 1.1,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontSize: 11
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //
                        // //Cost Row
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children:  [
                        //     const Text(
                        //       "£ ",
                        //       style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                        //     ),
                        //
                        //     Text(
                        //       price,
                        //       style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 5,),

                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: AbsorbPointer(
                            absorbing: true,
                            child: RatingBar(
                              initialRating: double.parse("4.4"),
                              allowHalfRating: true,
                              itemSize: 16,
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
                        ),

                        const SizedBox(width: 2,),
                        
                        Text("332",style: TextStyle(color: Colors.black.withOpacity(0.4),fontSize: 11),)

                      ],
                    ),
                  ),

                  const SizedBox(height: 5,),

                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        //Shipping Tag Container
                        Container(
                          padding: EdgeInsets.only(left: 5,right: 5,bottom: 5,top: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Color(0xFF0071dc)
                          ),
                          child: Text("Shipping",style: TextStyle(color: Color(
                              0xffffffff),fontSize: 9),),
                        ),

                        const SizedBox(width: 5,),

                        //Delivery Tag Container
                        Container(
                          padding: EdgeInsets.only(left: 5,right: 5,bottom: 5,top: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Color(0xFF0071dc)
                          ),
                          child: Text("Delivery",style: TextStyle(color: Color(
                              0xffffffff),fontSize: 9),),
                        ),

                        const SizedBox(width: 5,),

                        //Pickup Tag Container
                        Container(
                          padding: EdgeInsets.only(left: 5,right: 5,bottom: 5,top: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Color(0xFF0071dc)
                          ),
                          child: Text("Pickup",style: TextStyle(color: Color(
                              0xffffffff),fontSize: 9),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
