import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Accordion extends StatefulWidget {
  final String title;
  final Widget content;

  const Accordion(
      {Key? key,
        required this.title,
        required this.content,})
      : super(key: key);

  @override
  _AccordionState createState() => _AccordionState();
}



class _AccordionState extends State<Accordion> {
  bool _showContent = false;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.title == "PRODUCT REVIEWS")
    {
      _showContent = true;

    }
  }
  @override
  Widget build(BuildContext context) {



    return GestureDetector(
      onTap: () {
        setState(() {
          _showContent = !_showContent;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 0, right: 0),
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),

                blurRadius: 1.5,
                color: Colors.black.withOpacity(0.2))
          ],
        ),
        child: Column(
            children: [
          Container(
            height: MediaQuery.of(context).size.height*0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xffffffff),

            ),
            child: ListTile(
              
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              contentPadding: EdgeInsets.all(0),

              title: Padding(
                padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
                child: Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.6)),),
              ),

              trailing: Padding(
                padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
                child: _showContent? Icon(Icons.remove,color: Colors.black.withOpacity(0.6)) : Icon(Icons.add,color: Colors.black.withOpacity(0.6)),
              ),

              //contentPadding: const EdgeInsets.all(10),

              style: ListTileStyle.drawer,

            ),
          ),

          _showContent
              ?
          AnimatedContainer(
            duration: Duration(milliseconds: 5000),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.only(top: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0,-1)
                  )
                ]
            ),
            // height: _showContent? MediaQuery.of(context).size.height*0.8 : 100,
            padding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: widget.content,
          )
              :
          Container()
        ]),
      ),
    );
  }
}