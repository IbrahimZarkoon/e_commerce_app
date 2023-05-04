import 'package:e_commerce/Widgets/CartProduct.dart';
import 'package:e_commerce/Widgets/SearchBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController _searchCon = TextEditingController();
  final FocusNode _focusNode = FocusNode();


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      // Focus the text field and show the keyboard
      _focusNode.requestFocus();
      _searchCon.selection = TextSelection.fromPosition(
          TextPosition(offset: _searchCon.text.length));
      //TextInput.showKeyboard();
    });
  }

  @override
  void dispose()
  {
    _searchCon.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.175),
          child: Container(
            color: Color(0xFF0071dc),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                GestureDetector(
                  onTap: ()=> Navigator.pop(context),
                  child: Row(
                    children: [

                      BackButton(color: Colors.white,),

                      Text("Search",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
                    ],
                  ),
                ),

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
                            child: TextField(
                              controller: _searchCon,
                              //controller: _searchCon,
                              focusNode: _focusNode,
                              //onChanged: (query) => setState(() {}),
                              style: const TextStyle(color: Colors.black, height: 1, fontSize: 15),
                              decoration: const InputDecoration(
                                //prefixIcon: Icon(Icons.search, color: Color(0xFF5D5D67), size: 23),
                                  hintText: "What are you looking for?",
                                  hintStyle: TextStyle(color: Color(0xFF8F8F9E), fontSize: 15),
                                  border: InputBorder.none),
                            ),
                          )),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [

              recentSearchCon("bed"),
              
              recentSearchCon("Furniture"),
              
              recentSearchCon("grocery")

            ],
          ),
        ),
      ),
    );
  }
  
  Widget recentSearchCon(String title)
  {
    return Container(
      padding: EdgeInsets.only(top: 5,bottom: 5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.1),width: 0.5))
      ),
      margin: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Row(
            children: [
              Icon(Icons.youtube_searched_for_outlined,size: 20,color: Colors.black.withOpacity(0.8),),

              const SizedBox(width: 20,),

              Text(title,style: TextStyle(fontSize: 16),),
            ],
          ),

          Transform.rotate(
              angle: -45 * 0.0174533,
              child: Icon(Icons.arrow_upward,size: 20,color: Colors.black.withOpacity(0.8),))


        ],
      ),
    );
  }
}
