import 'package:e_commerce/Screens/AddressBook.dart';
import 'package:e_commerce/Screens/PaymentMethods.dart';
import 'package:e_commerce/Screens/PersonalDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/Headings.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF0071dc),
        automaticallyImplyLeading: false,
        leading: BackButton(onPressed: () => Navigator.pop(context),color: Colors.white,),
        leadingWidth: 30,
        centerTitle: true,
        title: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text("Account Details",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,

          children: [

            //Personal Details Container
            GestureDetector(
                onTap: ()
                {
                  Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => PersonalDetails()));
                },
                child: accountContainer(context, "Personal Details")),

            GestureDetector(
                onTap: ()
                {
                  Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => AddressBook()));
                },
                child: accountContainer(context, "Address Book")),

            GestureDetector(
                onTap: ()
                {
                  Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => PaymentMethods()));
                },
                child: accountContainer(context, "Payment Methods")),

            GestureDetector(
                onTap: ()
                {
                  showModalBottomSheet(context: context,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                      ),
                      builder: (BuildContext context)
                      {
                        return Container(
                          height: MediaQuery.of(context).size.height*0.45,
                          width: MediaQuery.of(context).size.width,

                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  offset: Offset(0,-10),
                                  blurRadius: 15,
                                  spreadRadius: 1,
                                )
                              ],
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                              color: Colors.white
                          ),

                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.start,

                            children: [

                              Headings(context, "Change my password"),

                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15,right: 15),
                                    child: TextFormField(

                                      decoration: InputDecoration(
                                        labelText: 'Current Password',
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      ),
                                      obscureText: true, // hides the entered password
                                    ),
                                  ),
                                  SizedBox(height: 16), // adds some spacing between the text fields
                                  Container(
                                    margin: EdgeInsets.only(left: 15,right: 15),

                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'New Password',
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                                      ),
                                      obscureText: true,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    margin: EdgeInsets.only(left: 15,right: 15),

                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Confirm New Password',
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                                      ),
                                      obscureText: true,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 15,),

                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(15),
                                padding: EdgeInsets.only(top: 10,bottom: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF0071dc)
                                ),
                                child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                              )
                            ],
                          ),
                        );
                      });
                },
                child: accountContainer(context, "Change Password"))

          ],
        ),
      ),

    );
  }

  Widget accountContainer(BuildContext context, String title)
  {
    return Container(


      margin: EdgeInsets.only(left: 15,right: 15,top: 15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0,0),
            blurRadius: 1.5,
          )
        ],
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),

          Icon(Icons.keyboard_arrow_right_outlined,color: Colors.black.withOpacity(0.6),)
        ],
      ),
    );
  }
}
