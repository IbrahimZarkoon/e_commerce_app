import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Screens/SingleCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/CartProvider.dart';
import '../Widgets/Drawer.dart';
import '../Widgets/Headings.dart';
import 'MyCart.dart';
import 'SearchPage.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          centerTitle: false,
          title: GestureDetector(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SearchPage()));
            },
            child: Container(
              height: 40,
              //width: MediaQuery.of(context).size.width*0.8,
              //margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5,top: 5),
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
                          style: const TextStyle(color: Color(0xFF8F8F9E), fontSize: 13),
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
              padding: const EdgeInsets.only(top: 15,right: 25),
              child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const MyCart()),),

                child: Stack(children: [

                  const Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 27,),

                  Provider.of<CartProvider>(context).productsList.length > 0?  Positioned(
                      top: 0,right: 0,
                      child: Container(width: 10,height: 10,decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(50)),)) : const SizedBox()
                ]),
              ),
            )
          ],
        ),
      ),

      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,

            children: [

              const SizedBox(height: 5,),

              //Headings Container
              Container(
                padding: const EdgeInsets.only(top: 20,bottom: 20 , left:15 , right:15),
                child: Row(
                  children:  [

                    Text("Browse departments",overflow: TextOverflow.ellipsis,
                        style:
                         TextStyle(color: Colors.black.withOpacity(0.85),fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
              ),


              GridView(
                  padding: EdgeInsets.only(bottom: 15,left: 15,right: 15),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.7,

                  ),

                children: [

                  //1st item
                  GestureDetector(
                    onTap: ()
                    {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context)

                      {
                        return subCategoryPage(context,"Grocery");
                      });
                    },
                    child: Stack(
                      children: [

                        Container(
                        //width: MediaQuery.of(context).size.width/3,
                        //height: 250,
                          foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.black.withOpacity(0.7),Colors.transparent]),
                            borderRadius: BorderRadius.circular(7)
                          ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://www.shutterstock.com/shutterstock/videos/1051081348/thumb/4.jpg?ip=x480"),
                            fit: BoxFit.cover
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(0,1.5)
                            )
                          ]
                        ),
                      ),

                        Positioned(
                            left: 10,top: 72,
                            child: Text("Grocery",style: TextStyle(color: Color(0xffffffff),fontSize: 15,fontWeight: FontWeight.bold),))
                      ]
                    ),
                  ),

                  //2nd Item
                  GestureDetector(
                    onTap: ()
                    {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context)

                          {
                            return subCategoryPage(context,"Clothes, shoes & accessories");
                          });
                    },
                    child: Stack(
                        children: [

                          Container(
                            //width: MediaQuery.of(context).size.width/3,
                            //height: 250,
                            foregroundDecoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Colors.black.withOpacity(0.7),Colors.transparent]),
                                borderRadius: BorderRadius.circular(7)
                            ),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage("https://img.freepik.com/premium-photo/men-fashion-casual-clothing-set-accessories_107612-164.jpg"),
                                    fit: BoxFit.cover
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: Offset(0,1.5)
                                  )
                                ]
                            ),
                          ),

                          Positioned(
                              left: 10,top: 72,right: 10,
                              child: Text("Clothes, shoes & accessories",style: TextStyle(color: Color(0xffffffff),fontSize: 15,fontWeight: FontWeight.bold),))
                        ]
                    ),
                  ),

                  //3rd item
                  GestureDetector(
                    onTap: ()
                    {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context)

                          {
                            return subCategoryPage(context,"Baby");
                          });
                    },
                    child: Stack(
                        children: [

                          Container(
                            //width: MediaQuery.of(context).size.width/3,
                            //height: 250,
                            foregroundDecoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Colors.black.withOpacity(0.7),Colors.transparent]),
                                borderRadius: BorderRadius.circular(7)
                            ),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage("https://c4.wallpaperflare.com/wallpaper/321/377/168/accessories-adorable-baby-baby-girl-wallpaper-preview.jpg"),
                                    fit: BoxFit.cover
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: Offset(0,1.5)
                                  )
                                ]
                            ),
                          ),

                          Positioned(
                              left: 10,top: 72,
                              child: Text("Baby",style: TextStyle(color: Color(0xffffffff),fontSize: 15,fontWeight: FontWeight.bold),))
                        ]
                    ),
                  ),

                  //4th item
                  Stack(
                      children: [

                        Container(
                          //width: MediaQuery.of(context).size.width/3,
                          //height: 250,
                          foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.black.withOpacity(0.7),Colors.transparent]),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRehv-p9egJ0m20j3ZBOWN17-7w_QECYYJL8Yv-PTEE4WkHniA22qVR35TFPtBJruS_Zgc&usqp=CAU"),
                                  fit: BoxFit.cover
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: Offset(0,1.5)
                                )
                              ]
                          ),
                        ),

                        Positioned(
                            left: 10,top: 72,
                            child: Text("Electronics",style: TextStyle(color: Color(0xffffffff),fontSize: 15,fontWeight: FontWeight.bold),))
                      ]
                  ),

                  //5th item
                  Stack(
                      children: [

                        Container(
                          //width: MediaQuery.of(context).size.width/3,
                          //height: 250,
                          foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.black.withOpacity(0.7),Colors.transparent]),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg?cs=srgb&dl=pexels-eric-mufasa-1350789.jpg&fm=jpg"),
                                  fit: BoxFit.cover
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: Offset(0,1.5)
                                )
                              ]
                          ),
                        ),

                        Positioned(
                            left: 10,top: 72,
                            child: Text("Furniture",style: TextStyle(color: Color(0xffffffff),fontSize: 15,fontWeight: FontWeight.bold),))
                      ]
                  ),

                  //6th item
                  Stack(
                      children: [

                        Container(
                          //width: MediaQuery.of(context).size.width/3,
                          //height: 250,
                          foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.black.withOpacity(0.7),Colors.transparent]),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("https://images.pond5.com/4k-animation-health-technology-background-footage-178591629_iconl.jpeg"),
                                  fit: BoxFit.cover
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: Offset(0,1.5)
                                )
                              ]
                          ),
                        ),

                        Positioned(
                            left: 10,top: 72,
                            child: Text("Health",style: TextStyle(color: Color(0xffffffff),fontSize: 15,fontWeight: FontWeight.bold),))
                      ]
                  ),

                  //7th item
                  Stack(
                      children: [

                        Container(
                          //width: MediaQuery.of(context).size.width/3,
                          //height: 250,
                          foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.black.withOpacity(0.7),Colors.transparent]),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("https://images.wallpaperscraft.com/image/single/books_library_shelves_138556_3840x2160.jpg"),
                                  fit: BoxFit.cover
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: Offset(0,1.5)
                                )
                              ]
                          ),
                        ),

                        Positioned(
                            left: 10,top: 72,
                            child: Text("Books",style: TextStyle(color: Color(0xffffffff),fontSize: 15,fontWeight: FontWeight.bold),))
                      ]
                  ),

                  //8th item
                  Stack(
                      children: [

                        Container(
                          //width: MediaQuery.of(context).size.width/3,
                          //height: 250,
                          foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.black.withOpacity(0.7),Colors.transparent]),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("https://www.pixelstalk.net/wp-content/uploads/images5/4K-Sports-Wallpaper-HD.jpg"),
                                  fit: BoxFit.cover
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: Offset(0,1.5)
                                )
                              ]
                          ),
                        ),

                        Positioned(
                            left: 10,top: 72,
                            child: Text("Sports",style: TextStyle(color: Color(0xffffffff),fontSize: 15,fontWeight: FontWeight.bold),))
                      ]
                  ),

                  //5th item
                  Stack(
                      children: [

                        Container(
                          //width: MediaQuery.of(context).size.width/3,
                          //height: 250,
                          foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.black.withOpacity(0.7),Colors.transparent]),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("https://images.pexels.com/photos/1350789/pexels-photo-1350789.jpeg?cs=srgb&dl=pexels-eric-mufasa-1350789.jpg&fm=jpg"),
                                  fit: BoxFit.cover
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: Offset(0,1.5)
                                )
                              ]
                          ),
                        ),

                        Positioned(
                            left: 10,top: 72,
                            child: Text("Furniture",style: TextStyle(color: Color(0xffffffff),fontSize: 15,fontWeight: FontWeight.bold),))
                      ]
                  ),

                  //6th item
                  Stack(
                      children: [

                        Container(
                          //width: MediaQuery.of(context).size.width/3,
                          //height: 250,
                          foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.black.withOpacity(0.7),Colors.transparent]),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("https://images.pond5.com/4k-animation-health-technology-background-footage-178591629_iconl.jpeg"),
                                  fit: BoxFit.cover
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: Offset(0,1.5)
                                )
                              ]
                          ),
                        ),

                        Positioned(
                            left: 10,top: 72,
                            child: Text("Health",style: TextStyle(color: Color(0xffffffff),fontSize: 15,fontWeight: FontWeight.bold),))
                      ]
                  ),

                  //7th item
                  Stack(
                      children: [

                        Container(
                          //width: MediaQuery.of(context).size.width/3,
                          //height: 250,
                          foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.black.withOpacity(0.7),Colors.transparent]),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("https://images.wallpaperscraft.com/image/single/books_library_shelves_138556_3840x2160.jpg"),
                                  fit: BoxFit.cover
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                    offset: Offset(0,1.5)
                                )
                              ]
                          ),
                        ),

                        Positioned(
                            left: 10,top: 72,
                            child: Text("Books",style: TextStyle(color: Color(0xffffffff),fontSize: 15,fontWeight: FontWeight.bold),))
                      ]
                  ),

                ],
              )
            ],

          ),
        ),
      ),

    );
  }

  Widget SearchBar() {
    return Container(
      height: 40,
      //width: MediaQuery.of(context).size.width*0.8,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xffffffff),
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
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffffffff),),
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
                      hintText: "Search Amazon",
                      hintStyle: TextStyle(color: Color(0xFF696969), fontSize: 15),
                      border: InputBorder.none),
                ),
              )),
        ],
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
