import 'package:e_commerce/Widgets/Drawer.dart';
import 'package:flutter/material.dart';

import '../Widgets/Headings.dart';

class AddressBook extends StatefulWidget {
  const AddressBook({Key? key}) : super(key: key);

  @override
  State<AddressBook> createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {

  String _selectedOption = 'Please Select'; // default value for the dropdown list
  List<String> _options = ['Please Select', 'Mr', 'Mrs', 'Miss']; //

  String _selectCountry = 'Please Select'; // default value for the dropdown list
  List<String> _countryoptions = ['Please Select', 'Australia','Canada','United Arab Emirates','United States', 'United Kingdom']; //



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF0071dc),
        automaticallyImplyLeading: false,
        leading: BackButton(
          onPressed: () => Navigator.pop(context), color: Colors.white,),
        leadingWidth: 30,
        centerTitle: true,
        title: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text("Account Details", style: TextStyle(color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),)),
      ),

      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            //Address Container
            Container(

              margin: EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      //Image or Icon Container
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(Icons.location_on_outlined,color: Color(
                                0xffef4b4b),),
                          ),

                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Home",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),

                                const SizedBox(height: 5,),

                                Text("D-21 Block-H Street 1, Karachi"),

                                const SizedBox(height: 5,),

                                Text("Full Name : Nafeel Jawed",style: TextStyle(color: Colors.black.withOpacity(0.6)),),

                              ],
                            ),
                          ),
                        ],
                      ),

                      //Edit Container
                      Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(right: 0),
                        child: Icon(Icons.mode_edit_outline_outlined,color: Color(
                            0xffef4b4b),),
                      ),

                    ],
                  ),

                  const SizedBox(height: 10,),
                  shadowLine(context)

                ],
              ),
            ),

            //Address2 Container
            Container(

              margin: EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      //Image or Icon Container
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(Icons.location_on_outlined,color: Color(
                                0xffef4b4b),),
                          ),

                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Home",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),

                                const SizedBox(height: 5,),

                                Text("D-21 Block-H Street 1, Karachi"),

                                const SizedBox(height: 5,),

                                Text("Full Name : Nafeel Jawed",style: TextStyle(color: Colors.black.withOpacity(0.6)),),

                              ],
                            ),
                          ),
                        ],
                      ),

                      //Edit Container
                      Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(right: 0),
                        child: Icon(Icons.mode_edit_outline_outlined,color: Color(
                            0xffef4b4b),),
                      ),

                    ],
                  ),

                  const SizedBox(height: 10,),
                  shadowLine(context)

                ],
              ),
            ),

            //Address3 Container
            Container(

              margin: EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      //Image or Icon Container
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(Icons.location_on_outlined,color: Color(
                                0xffef4b4b),),
                          ),

                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Home",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),

                                const SizedBox(height: 5,),

                                Text("D-21 Block-H Street 1, Karachi"),

                                const SizedBox(height: 5,),

                                Text("Full Name : Nafeel Jawed",style: TextStyle(color: Colors.black.withOpacity(0.6)),),

                              ],
                            ),
                          ),
                        ],
                      ),

                      //Edit Container
                      Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(right: 0),
                        child: Icon(Icons.mode_edit_outline_outlined,color: Color(
                            0xffef4b4b),),
                      ),

                    ],
                  ),

                  const SizedBox(height: 10,),
                  shadowLine(context)

                ],
              ),
            ),

            //Address4 Container
            Container(

              margin: EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      //Image or Icon Container
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(Icons.location_on_outlined,color: Color(
                                0xffef4b4b),),
                          ),

                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Home",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),

                                const SizedBox(height: 5,),

                                Text("D-21 Block-H Street 1, Karachi"),

                                const SizedBox(height: 5,),

                                Text("Full Name : Nafeel Jawed",style: TextStyle(color: Colors.black.withOpacity(0.6)),),

                              ],
                            ),
                          ),
                        ],
                      ),

                      //Edit Container
                      Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(right: 0),
                        child: Icon(Icons.mode_edit_outline_outlined,color: Color(
                            0xffef4b4b),),
                      ),

                    ],
                  ),

                  const SizedBox(height: 10,),
                  shadowLine(context)

                ],
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            //   child: Text(
            //     "You don't have any saved addresses. Please click Add New to create a new address.",
            //     style: TextStyle(
            //         fontSize: 14, color: Colors.black.withOpacity(0.6)),),
            // ),

          ],
        ),
      ),

      bottomNavigationBar: Container(

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 1.5,
              offset: Offset(0,0)
            )
          ]
        ),
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.9,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,

                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            offset: Offset(0,-10),
                            blurRadius: 15,
                            spreadRadius: 1,
                          )
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white
                    ),

                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Headings(
                              context, "Create a new delivery address"),


                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Text("Title",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 14),),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width*0.5,
                            margin: const EdgeInsets.only(left: 15,right: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: DropdownButtonFormField<String>(
                              borderRadius: BorderRadius.circular(10),
                              elevation: 1,
                              value: _selectedOption,
                              decoration: InputDecoration(
                                labelText: 'Please Select',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              items: _options.map((option) {
                                return DropdownMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedOption = value!;
                                });
                              },
                            ),
                          ),

                          const SizedBox(height: 15,),

                          //First Name
                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Text("First Name *",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 14),),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15,right: 15),
                            child: TextFormField(

                              decoration: InputDecoration(
                                labelText: 'First Name',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              obscureText: true, // hides the entered password
                            ),
                          ),

                          const SizedBox(height: 15,),

                          //Last Name
                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Text("Last Name *",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 14),),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15,right: 15),
                            child: TextFormField(

                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              obscureText: true, // hides the entered password
                            ),
                          ),

                          const SizedBox(height: 15,),

                          //Address
                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Text("Address *",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 14),),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15,right: 15),
                            child: TextFormField(

                              decoration: InputDecoration(
                                labelText: 'Address',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              obscureText: true, // hides the entered password
                            ),
                          ),

                          const SizedBox(height: 15,),

                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Text("Country *",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 14),),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(left: 15,right: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: DropdownButtonFormField<String>(
                              borderRadius: BorderRadius.circular(10),
                              elevation: 1,
                              value: _selectCountry,
                              decoration: InputDecoration(
                                labelText: 'Please Select',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              items: _countryoptions.map((option) {
                                return DropdownMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectCountry = value!;
                                });
                              },
                            ),
                          ),

                          const SizedBox(height: 15,),

                          //Address
                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Text("Phone Number *",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 14),),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15,right: 15),
                            child: TextFormField(

                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              obscureText: true, // hides the entered password
                            ),
                          ),

                          const SizedBox(height: 15,),

                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(15),
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF0071dc)
                            ),
                            child: Text("Save", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Container(
            height: MediaQuery.of(context).size.height*0.06,
            margin: EdgeInsets.only(
                bottom: 15, top: 15, right: 15, left: 15),
            padding: EdgeInsets.only(
                left: 10, right: 10, bottom: 10, top: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFF0071dc)
            ),

            child: Text("Add new address", style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),),
          ),
        ),
      )

    );
  }
}
