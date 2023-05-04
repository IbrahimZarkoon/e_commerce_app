import 'package:e_commerce/Screens/SearchPage.dart';
import 'package:flutter/material.dart';

Widget SearchBar(BuildContext context)
{
  return Container(
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
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SearchPage()));
                },
                //controller: _searchCon,
                //focusNode: _focusNode,
                //onChanged: (query) => setState(() {}),
                style: const TextStyle(color: Colors.black, height: 1, fontSize: 15),
                decoration: InputDecoration(
                  //prefixIcon: Icon(Icons.search, color: Color(0xFF5D5D67), size: 23),
                    hintText: "What are you looking for?",
                    hintStyle: const TextStyle(color: Color(0xFF8F8F9E), fontSize: 15),
                    border: InputBorder.none),
              ),
            )),

      ],
    ),
  );
}