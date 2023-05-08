import 'package:e_commerce/Providers/CartProvider.dart';
import 'package:e_commerce/Screens/MyCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/SearchPage.dart';
import 'SearchBar.dart';

Widget myAppBar(BuildContext context, Function openDrawer) {
  return AppBar(
    elevation: 0.1,
    backgroundColor: Color(0xFF0071dc),
    centerTitle: true,
    automaticallyImplyLeading: false,

    title: Container(
      height: kToolbarHeight,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: const BoxDecoration(
          color: Color(0xFF0071dc),
          image: DecorationImage(
              image: AssetImage("assets/images/logo-removebg-preview.png"),

              fit: BoxFit.contain)),
    ),

    leadingWidth: 50,
    leading: Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        },
      ),
    ),
    // leading: GestureDetector(
    //   onTap: () => openDrawer,
    //   child: Container(
    //     height: kToolbarHeight,
    //     child: const Icon(Icons.menu_outlined,color: Colors.black87,),
    //     //decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Screenshot_1.png"),fit: BoxFit.cover)),
    //   ),
    // ),
    actions: [
      // GestureDetector(
      //   onTap: ()
      //   {
      //
      //   },
      //   child: Padding(
      //     padding: const EdgeInsets.only(right: 15,bottom: 10),
      //     child: Icon(Icons.search),
      //   ),
      // ),

      Padding(
        padding: const EdgeInsets.only(right: 15, top: 10),
        child: GestureDetector(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const MyCart()),
                ),
            child: Hero(
                tag: "Cart",
                child: Stack(children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  Provider.of<CartProvider>(context).productsList.isNotEmpty
                      ? Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50)),
                          ))
                      : SizedBox()
                ]))),
      )
    ],

    bottom: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SearchPage(
                          tag: "appbar",
                        )));
          },
          child: Container(
            height: 40,
            //width: MediaQuery.of(context).size.width*0.8,
            margin: const EdgeInsets.all(20),
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
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
                  tag: "appbar",
                  child: Container(
                      padding: const EdgeInsets.only(
                          left: 5, right: 0, top: 0, bottom: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffffffff)),
                      child: const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 22,
                      )),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(bottom: 0),

                  child: Text(
                    "What are you looking for?",
                    style:
                        const TextStyle(color: Color(0xFF8F8F9E), fontSize: 13),
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
        )),
  );
}
