import 'package:e_commerce/Screens/HomePage.dart';
import 'package:e_commerce/Widgets/Headings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'SignIN.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFff1f1f1),

      body: SafeArea(
        child: Container(
          color: const Color(0xffffffff),
          margin: const EdgeInsets.only(top: 0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Container(

                margin: const EdgeInsets.only(left: 30,right: 30,top: 0),
                width: MediaQuery.of(context).size.width*0.6,
                height: MediaQuery.of(context).size.height*0.15,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.1),
                    //     spreadRadius: 1,
                    //     blurRadius: 1,
                    //     offset: const Offset(0, 0), // changes position of shadow
                    //   ),],

                    image: const DecorationImage(image: AssetImage("assets/images/Screenshot_1.png",),fit: BoxFit.contain,


                    )
                ),
              ),

              Expanded(
                child: Container(
                  //height: MediaQuery.of(context).size.height*.815,
                  margin: const EdgeInsets.only(left: 15,right: 15,top: 0),
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, -5),
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                        )
                      ]
                  ),

                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.72,
                      margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [


                          Container(
                            padding: const EdgeInsets.only(top: 0,bottom: 30 , left:0 , right:15),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children:  const [

                                Text("Let's get started!",
                                    style:
                                    TextStyle(color: Color(0xfffc9038),fontWeight: FontWeight.bold, fontSize: 22,)),
                              ],
                            ),
                          ),


                          //NAME ROW
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              //First Name Container
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(top: 0,bottom: 0,left: 20),
                                  //alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      //border: Border.all(width: 2),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 0),
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 5,
                                        )
                                      ],
                                      color: const Color(0xfff7f7f7)
                                  ),

                                  child: const TextField(
                                    style: TextStyle(color: Colors.black,fontSize: 17),
                                    decoration: InputDecoration(
                                      hintText: "First Name",
                                      hintStyle: TextStyle(fontSize: 15,color: Colors.black54),
                                      border: InputBorder.none,

                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width:20),

                              //Last Name Container
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(top: 0,bottom: 0,left: 20),
                                  //alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      //border: Border.all(width: 2),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 0),
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 5,
                                        )
                                      ],
                                      color: const Color(0xfff7f7f7)
                                  ),

                                  child: const TextField(
                                    style: TextStyle(color: Colors.black,fontSize: 17),
                                    decoration: InputDecoration(
                                      hintText: "Last Name",
                                      hintStyle: TextStyle(fontSize: 15,color: Colors.black54),
                                      border: InputBorder.none,

                                    ),
                                  ),
                                ),
                              ),

                              //Last Name Container
                            ],
                          ),

                          //Email ROW
                          Row(

                            children: [
                              //Email Container
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 20,bottom: 20),
                                  padding: const EdgeInsets.only(top: 0,bottom: 0,left: 20),
                                  //alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      //border: Border.all(width: 2),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 0),
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 5,
                                        )
                                      ],
                                      color: const Color(0xfff7f7f7)
                                  ),

                                  child: const TextField(
                                    style: TextStyle(color: Colors.black,fontSize: 17),
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(fontSize: 15,color: Colors.black54),
                                      border: InputBorder.none,

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //Phone Number ROW
                          Row(

                            children: [
                              //Phone Number Container
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 0,bottom: 20),
                                  padding: const EdgeInsets.only(top: 0,bottom: 0,left: 20),
                                  //alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      //border: Border.all(width: 2),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 0),
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 5,
                                        )
                                      ],
                                      color: const Color(0xfff7f7f7)
                                  ),

                                  child: TextField(
                                    style: const TextStyle(color: Colors.black,fontSize: 17),
                                    decoration: const InputDecoration(
                                      hintText: "Phone Number",
                                      hintStyle: TextStyle(fontSize: 15,color: Colors.black54),
                                      border: InputBorder.none,
                                    ),
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(r'[0-9,+]')),],
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //Password ROW
                          Row(

                            children: [
                              //Password Container
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 0,bottom: 20),
                                  padding: const EdgeInsets.only(top: 0,bottom: 0,left: 20),
                                  //alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      //border: Border.all(width: 2),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 0),
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 5,
                                        )
                                      ],
                                      color: const Color(0xfff7f7f7)
                                  ),

                                  child: const TextField(
                                    style: TextStyle(color: Colors.black,fontSize: 17),
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(fontSize: 15,color: Colors.black54),
                                      border: InputBorder.none,
                                    ),
                                    obscureText: true,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //Confirm Password ROW
                          Row(

                            children: [
                              //Password Container
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 0,bottom: 20),
                                  padding: const EdgeInsets.only(top: 0,bottom: 0,left: 20),
                                  //alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      //border: Border.all(width: 2),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 0),
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 5,
                                        )
                                      ],
                                      color: const Color(0xfff7f7f7)
                                  ),

                                  child: const TextField(
                                    style: TextStyle(color: Colors.black,fontSize: 17),
                                    decoration: InputDecoration(
                                      hintText: "Confirm Password",
                                      hintStyle: TextStyle(fontSize: 15,color: Colors.black54),
                                      border: InputBorder.none,
                                    ),
                                    obscureText: true,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //Register ROW
                          Row(

                            children: [
                              //Register Container
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => SignIn()));
                                  },
                                  child: Hero(
                                    tag: "register",

                                    child: Container(
                                      margin: const EdgeInsets.only(top: 0,bottom: 20),
                                      padding: const EdgeInsets.only(top: 5,bottom: 5,left: 0),
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          //border: Border.all(width: 2),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(0, 0),
                                              color: Colors.black.withOpacity(0.1),
                                              blurRadius: 5,
                                            )
                                          ],
                                          color: const Color(0xFFfc9038)
                                      ),

                                      child: Container(
                                          padding: const EdgeInsets.only(left: 0,top: 5,bottom: 5),
                                          child: const Text("Register",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15),)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //SIGNUP ROW
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              const Text("Already have an account?",style: TextStyle(color: Colors.black45),),

                              const SizedBox(width: 3),

                              GestureDetector(
                                onTap: ()
                                {
                                  Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => SignIn()));
                                },
                                child: const Text("Login",style: TextStyle(color: Color(0xFFfc9038),),),
                              )
                            ],
                          ),

                          const Spacer(),

                          //OTHER SIGNUP OPTIONS ROW
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [

                              Text("Or continue with",style: TextStyle(color: Colors.black54),),
                            ],
                          ),

                          const SizedBox(height: 20,),

                          //GOOGLE FACEBOOK ROW
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              //GOOGLE Container
                              Expanded(
                                child: Container(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                                    margin: const EdgeInsets.only(bottom: 30),
                                    //alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width*0.4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        //border: Border.all(width: 2),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, 0),
                                            color: Colors.black.withOpacity(0.1),
                                            blurRadius: 5,
                                          )
                                        ],
                                        color: const Color(0xfff7f7f7)
                                    ),

                                    child: Row(
                                      children: [

                                        Container(
                                            width: 40, height: 40 ,
                                            child: const Image(image: NetworkImage("https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png"),fit: BoxFit.cover,)),


                                        const SizedBox(width: 10,),

                                        const Text("Google",style: TextStyle(color: Colors.black54),)
                                      ],
                                    )
                                ),
                              ),

                              const SizedBox(width:20),

                              //FACEBOOK Container
                              Expanded(
                                child: Container(
                                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                                    margin: const EdgeInsets.only(bottom: 30),
                                    //alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width*0.4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        //border: Border.all(width: 2),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, 0),
                                            color: Colors.black.withOpacity(0.1),
                                            blurRadius: 5,
                                          )
                                        ],
                                        color: const Color(0xfff7f7f7)
                                    ),

                                    child: Row(
                                      children: [

                                        Container(
                                            width: 40, height: 40 ,
                                            child: const Image(image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1200px-Facebook_Logo_%282019%29.png"),fit: BoxFit.cover,)),


                                        const SizedBox(width: 10,),

                                        const Text("Facebook",style: TextStyle(color: Colors.black54),)
                                      ],
                                    )
                                ),
                              ),

                              //Last Name Container
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}