import 'package:e_commerce/Screens/MenuPage.dart';
import 'package:e_commerce/Screens/MyCart.dart';
import 'package:e_commerce/Screens/MyProfile.dart';
import 'package:e_commerce/Screens/SignUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/CartProvider.dart';
import 'AllCategories.dart';
import 'HomePage.dart';

class DashboardPage extends StatefulWidget {

  var tabindex;
  DashboardPage({Key? key,required this.tabindex}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {


  int _selectedIndex = 0;
  bool user = true;

  final tabs = [
    const HomePage(), // 0
    const MyProfile(),
    const MenuPage(),
    const AllCategories(),
    const MyCart()

  ];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(

        // |
        //appBar: PreferredSize(preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.085),child: myAppBar(context)),



        body: Center(
          child: tabs[widget.tabindex],
        ),

        bottomNavigationBar:  Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: CupertinoTabBar(
            height: 55,
            border: Border(top: BorderSide(color: Colors.black.withOpacity(0.2),width: 0.5)),
            backgroundColor: Colors.white,
            currentIndex: _selectedIndex,
            activeColor: const Color(0xFF0071dc),
            inactiveColor: const Color(0xFFAFAFAF),
            onTap: (index) {
              setState(() {
                widget.tabindex = index;
                _selectedIndex = index;
              });
            },
            items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home,size: 30,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled,size: 30,),
              label: 'Profile',
            ),
              BottomNavigationBarItem(icon: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("MENU",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              ),label: ""),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.search,size: 30,),
              label: 'Search'),
            BottomNavigationBarItem(
              icon: Stack(children: [

                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(CupertinoIcons.cart,size: 30,),
                ),

                Provider.of<CartProvider>(context).productsList.isEmpty?
                Positioned(
                    top: 0,right: 0,
                    child: Container(padding: EdgeInsets.all(2),alignment: Alignment.center,width: 15,height: 15,child: Text("0",style: TextStyle(color: Colors.white),),decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(50)),))
                    :
                Positioned(
                    top: 0,right: 0,
                    child: Container(padding: EdgeInsets.all(2),alignment: Alignment.center,width: 15,height: 15,child: Text("${Provider.of<CartProvider>(context).productsList.length}",style: TextStyle(color: Colors.white),),decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(50)),))
              ]),
              label: 'Cart',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
            //   label: 'Keypad',
            // ),
          ],),
        ),

        // bottomNavigationBar:  CupertinoTabScaffold(
        //
        //   tabBar: CupertinoTabBar(
        //     currentIndex: _selectedIndex,
        //     onTap: (index) {
        //       setState(() {
        //         _selectedIndex = index;
        //       });
        //     },
        //
        //     activeColor: Color(0xFFfc9038),
        //     items: const <BottomNavigationBarItem>[
        //       BottomNavigationBarItem(
        //         icon: Icon(CupertinoIcons.home,size: 25,),
        //         label: 'Home',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(CupertinoIcons.profile_circled,size: 25,),
        //         label: 'Profile',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(CupertinoIcons.cart,size: 25,),
        //         label: 'Cart',
        //       ),
        //       // BottomNavigationBarItem(
        //       //   icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
        //       //   label: 'Keypad',
        //       // ),
        //     ],
        //   ), tabBuilder: (BuildContext context, int index) {
        //   return CupertinoTabView(
        //     builder: (BuildContext context) {
        //       return Center(
        //         child: tabs.elementAt(_selectedIndex),
        //       );
        //     },
        //   );
        // },
        // ),




        //
        // body: SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        //   physics: BouncingScrollPhysics(),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       SizedBox(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.925,child: tabs[widget.tabindex]),
        //
        //       SizedBox(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.075,child: fbvCustomTabBar()),
        //     ],
        //   ),
        // ),

        //bottomNavigationBar:  SizedBox(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.075,child: fbvCustomTabBar()),
      ),
    );

    // (_profile || _menu)? SizedBox() :
  }

// Widget fbvCustomTabBar(){
//   _checktab();
//   return Container
//     (
//     alignment: Alignment.bottomCenter,
//     width: MediaQuery.of(context).size.width,
//     height: MediaQuery.of(context).size.height*0.075,
//     decoration: const BoxDecoration(
//         border: Border(top: BorderSide(color: Color(0x00000000),width: 1))
//       //border: Border.all(color: Colors.grey,width: 2),
//
//     ),
//
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//
//       children: [
//
//
//         // Home
//         GestureDetector(
//             onTap: (){
//               setState((){
//                 widget.tabindex = 0;
//                 _tHome = true;
//                 _tSearch = false;
//                 _tStores = false;
//                 _tCategories = false;
//               });
//               //checkTab(index);
//               //Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage()));
//             },
//             child: fbvTabBarCon(context, "Home", _tHome? Color(0xFFfc9038) : Colors.black, _tHome? const Border(top: BorderSide(color: Color(0xFFe6e6e6))): const Border()  ,_tHome? Icons.home : Icons.home_outlined)),
//
//         // Search
//         GestureDetector(
//             onTap: (){
//               //Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage()));
//               setState((){
//                 widget.tabindex = 1;
//                 _tHome = false;
//                 _tSearch = true;
//                 _tStores = false;
//                 _tCategories = false;
//               });
//             },
//             child: fbvTabBarCon(context, "Search", _tSearch? Color(0xFFfc9038) : Colors.black,_tSearch? const Border(top: BorderSide(width: 1,color: Color(0xFFe6e6e6))): const Border() , Icons.search_outlined)),
//
//         // Stores
//         GestureDetector(
//             onTap: (){
//               //Navigator.push(context, MaterialPageRoute(builder: (_) => const StorePage()));
//               setState((){
//                 widget.tabindex = 2;
//                 _tHome = false;
//                 _tSearch = false;
//                 _tStores = true;
//                 _tCategories = false;
//               });
//             },
//             child: fbvTabBarCon(context, "Stores", _tStores? Color(0xFFfc9038) : Colors.black,_tStores? const Border(top: BorderSide(width: 1,color: Color(0xFFe6e6e6))): const Border() ,_tStores? Icons.store : Icons.store_outlined)),
//
//         // Categories
//         GestureDetector(
//             onTap: (){
//               //Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage()));
//               setState((){
//                 widget.tabindex = 3;
//                 _tHome = false;
//                 _tSearch = false;
//                 _tStores = false;
//                 _tCategories = true;
//               });
//             },
//             child: fbvTabBarCon(context, "Categories", _tCategories? Color(0xFFfc9038) : Colors.black,_tCategories? const Border(top: BorderSide(width: 1,color: Color(0xFFe6e6e6))): const Border(),_tCategories? Icons.category : Icons.category_outlined)),
//
//       ],
//     ),
//   );
// }
//
// _checktab()
// {
//   switch(widget.tabindex){
//     case 0:
//       setState(() {
//         _tHome = true;
//         _tSearch = false;
//         _tStores = false;
//         _tCategories = false;
//         _menu = false;
//         _profile = false;
//       });
//       break;
//
//     case 1:
//       setState(() {
//         _tHome = false;
//         _tSearch = true;
//         _tStores = false;
//         _tCategories = false;
//         _menu = false;
//         _profile = false;
//       });
//       break;
//
//     case 2:
//       setState(() {
//         _tHome = false;
//         _tSearch = false;
//         _tStores = true;
//         _tCategories = false;
//         _menu = false;
//         _profile = false;
//       });
//       break;
//
//     case 3:
//       setState(() {
//         _tHome = false;
//         _tSearch = false;
//         _tStores = false;
//         _tCategories = true;
//         _menu = false;
//         _profile = false;
//       });
//       break;
//
//     case 4:
//       setState(() {
//         _tHome = false;
//         _tSearch = false;
//         _tStores = false;
//         _tCategories = false;
//         _menu = true;
//         _profile = false;
//       });
//       break;
//
//     case 5:
//       setState(() {
//         _tHome = false;
//         _tSearch = false;
//         _tStores = false;
//         _tCategories = false;
//         _menu = false;
//         _profile = true;
//       });
//       break;
//   }
//
// }
}