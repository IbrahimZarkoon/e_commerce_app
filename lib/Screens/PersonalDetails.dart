import 'package:e_commerce/Widgets/Headings.dart';
import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
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
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 1.5,
                    spreadRadius: 1,
                    offset: Offset(0,0)
                  )
                ]
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top:15,bottom: 0 , left:15 , right:15),
                    child: Row(
                      children:  [

                        Text("Personal Details",overflow: TextOverflow.ellipsis,
                            style:
                            const TextStyle(color: Colors.black87,fontWeight: FontWeight.bold, fontSize: 22)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20,),

                  detailsRow(context, "First Name", "Nafeel"),

                  detailsRow(context, "Last Name", "Jawed"),

                  detailsRow(context, "Email Address", "nafeeljawed@gmail.com"),

                  detailsRow(context, "Mobile Number", "+61 2344 85720"),

                  const SizedBox(height: 5,)
                ],
              ),
            ),

            const SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [

                  //Change Password
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
                    child: Container(

                      margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          Text("Change my password",style: TextStyle(decoration: TextDecoration.underline,fontSize: 18),),

                          const SizedBox(width: 15,),

                          Icon(Icons.keyboard_arrow_down_outlined,size: 20,color: Colors.black.withOpacity(0.75),)

                        ],
                      ),
                    ),
                  ),

                  //change personal details
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

                                  Headings(context, "Change my personal details"),

                                  Column(
                                    children: [
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
                                      SizedBox(height: 16), // adds some spacing between the text fields
                                      Container(
                                        margin: EdgeInsets.only(left: 15,right: 15),

                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Last Name',
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
                                            labelText: 'Mobile Number',
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
                    child: Container(

                      margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          Text("Change my personal details",style: TextStyle(decoration: TextDecoration.underline,fontSize: 18),),

                          const SizedBox(width: 15,),

                          Icon(Icons.keyboard_arrow_down_outlined,size: 20,color: Colors.black.withOpacity(0.75),)
                        ],
                      ),
                    ),
                  ),

                  //change email
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

                                  Headings(context, "Change my email address"),

                                  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 15,right: 15),
                                        child: TextFormField(

                                          decoration: InputDecoration(
                                            labelText: 'Current Email',
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
                                            labelText: 'New Email',
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
                                            labelText: 'Confirm New Email',
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
                    child: Container(

                      margin: EdgeInsets.only(left: 15,right: 15,bottom: 15),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          Text("Change my email address",style: TextStyle(decoration: TextDecoration.underline,fontSize: 18),),

                          const SizedBox(width: 15,),

                          Icon(Icons.keyboard_arrow_down_outlined,size: 20,color: Colors.black.withOpacity(0.75),)

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  Widget detailsRow(BuildContext context, String title, String value){

    return Container(

      margin: EdgeInsets.only(left: 15,right: 15,bottom: 10),

      child: Row(

        mainAxisAlignment: MainAxisAlignment.start,

        children: [

          Text("$title :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),

          const SizedBox(width: 20,),

          Text(value,style: TextStyle(fontSize: 16),),

        ],
      ),
    );
  }
}
