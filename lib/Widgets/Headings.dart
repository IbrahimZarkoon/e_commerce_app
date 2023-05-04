import 'package:flutter/material.dart';

Widget Headings(BuildContext context,String heading){

  String _Heading = heading;
  return Container(
    padding: const EdgeInsets.only(top: 20,bottom: 20 , left:15 , right:15),
    child: Row(
      children:  [

        Text(_Heading,overflow: TextOverflow.ellipsis,
            style:
            const TextStyle(color: Colors.black87,fontWeight: FontWeight.bold, fontSize: 18)),
      ],
    ),
  );
}