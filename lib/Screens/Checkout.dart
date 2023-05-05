
import 'package:e_commerce/Widgets/Headings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Widgets/CustomStepper.dart';
import 'Dashboard.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _Checkout();
}

class _Checkout extends State<Checkout> {



  int currentStep = 1;
  int stepLength = 3;
  late bool complete;

  bool card = false;
  bool cod = true;

  bool keyboard = false;

  next() {
    if (currentStep <= stepLength) {
      goTo(currentStep + 1);
    }
  }

  back() {
    if (currentStep > 1) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
    if (currentStep > stepLength) {
      setState(() => complete = true);
    }
  }

  ScrollController S1 = ScrollController();

  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  TextEditingController city = TextEditingController();

  scroll1Listener() {
    // if (scrollcontroller.offset >= scrollcontroller.position.maxScrollExtent &&
    //     !scrollcontroller.position.outOfRange) {
    //   setState(() {
    //     topContHeight = false;
    //     print("reached end");
    //   });
    // }
    if (keyboard == true && S1.offset >= S1.position.maxScrollExtent) {
      FocusManager.instance.primaryFocus?.unfocus();
      setState(() {
        keyboard = false;
      });
    }
    // if (S1.offset < S1.position.maxScrollExtent && S1.offset > S1.position.minScrollExtent &&
    //     positionedTop == 150) {
    //   setState(() {
    //     positionedTop = 0;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    S1.addListener(scroll1Listener);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: GestureDetector(
            onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => DashboardPage(tabindex: 0))),
            child: Row(
              children: const [

                Padding(
                  padding: EdgeInsets.only(bottom: 5.0,left: 0,right: 10),

                  child: Icon(Icons.arrow_back_ios_new,color: Colors.black,size: 19,),
                ),

                Text(
                  "Checkout",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
              ],
            )),

        leadingWidth: 0,
        elevation: 0,
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          SingleChildScrollView(
            controller: S1,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                NumberStepper(
                  totalSteps: stepLength,
                  width: MediaQuery.of(context).size.width,
                  curStep: currentStep,
                  stepCompleteColor: const Color(0xff31ca00),
                  currentStepColor: const Color(0xffdbecff),
                  inactiveColor: const Color(0xffdbecff),
                  lineWidth: 3.5,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: currentStep <= stepLength
                      ? currentStep == 1
                          ? shippingPage(context)
                          : currentStep == 2
                              ? paymentPage(context)
                              : confirmationPage(context)
                      : const Text(
                          "Completed!",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xff31ca00),
                          ),
                        ),
                )
              ],
            ),
          ),
          currentStep > 3
              ? const SizedBox()
              : Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.only(left: 15,right: 15,top: 0),
                    //color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        currentStep != 1
                            ? Expanded(
                                child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xffff1c1c)),
                                  ),
                                  onPressed: currentStep == 1
                                      ? null
                                      : () {
                                          back();
                                        },
                                  child: const Text(
                                    "Back",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        currentStep != 1
                            ? const SizedBox(
                                width: 20,
                              )
                            : const SizedBox(),
                        Expanded(
                          flex: 2,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF0071dc)),
                            ),
                            onPressed: () {
                              next();
                            },
                            child: Text(
                              currentStep >= stepLength
                                  ? 'Confirm and pay'
                                  : 'Continue',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
        ]),
      ),
      // bottomNavigationBar: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     Expanded(
      //       child: FloatingActionButton(
      //         backgroundColor: Colors.grey[50],
      //         onPressed: currentStep == 1
      //             ? null
      //             : () {
      //           back();
      //         },
      //         child: Text('Back'),
      //       ),
      //     ),
      //     Expanded(
      //       child: TextButton(
      //         onPressed: () {
      //           next();
      //         },
      //         child: Text(
      //           currentStep == stepLength ? 'Finish' : 'Next',
      //           style: TextStyle(color: Colors.white),
      //         ),
      //
      //       ),
      //     )
      //   ],
      // ),
      //Old Stepper

      // body: Stepper(
      //
      //   elevation: 0.5,
      //   type: StepperType.horizontal,
      //   currentStep: _currentStep,
      //   onStepContinue: () {
      //     if (_currentStep <2) {
      //       setState(() {
      //         _currentStep += 1;
      //       });
      //     }
      //   },
      //   onStepCancel: () {
      //     if (_currentStep>0) {
      //       setState(() {
      //         _currentStep -= 1;
      //       });
      //     }
      //   },
      //   steps: [
      //
      //     //Shipping Step
      //     Step(
      //       state: StepState.editing,
      //       title: SizedBox(),
      //       label: Text("Shipping",style: TextStyle(color: Color(0xff31ca00)),),
      //       content: shippingPage(context),
      //       isActive: _currentStep >= 0,
      //     ),
      //
      //     //Payment Step
      //     Step(
      //       state: StepState.complete,
      //       title: SizedBox(),
      //       label: Text("Payment",style: TextStyle(color: _currentStep >= 1? Color(0xff31ca00) : Colors.red),),
      //       content: Text("Content for Step 2"),
      //       isActive: _currentStep >= 1,
      //     ),
      //
      //     //Confirmation Step
      //     Step(
      //       title: SizedBox(),
      //       label: Text("Confirmation",style: TextStyle(color: _currentStep >= 2? Color(0xff31ca00) : Colors.red),),
      //       content: Text("Content for Step 3"),
      //       isActive: _currentStep >= 2,
      //     ),
      //
      //   ],
      //
      // ),
    );
  }

  Widget shippingPage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 100),
      //color: Colors.white,
      child: Column(
        children: [
          //Headings Container
          Container(
              // decoration: BoxDecoration(
              //     border: Border(
              //         bottom:
              //             BorderSide(color: Colors.black.withOpacity(0.05)))),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Delivery Address",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ],
                ),
              )),

          //Full Name Container
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 15,right: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 1,
                    spreadRadius: 0.5,
                    offset: Offset(0,0)
                )
              ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 15, right: 15),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        keyboard = true;
                      });
                    },
                    controller: fullName,
                    cursorHeight: 20,
                    style: TextStyle(
                        height: 1,
                        color: Colors.black.withOpacity(0.6), fontSize: 17),
                    decoration: const InputDecoration(

                      hintText: "Full Name",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                      border: InputBorder.none,
                    ),
                  ),
                ),

              ],
            ),
          ),

          //Phone Number Container
          Container(
            width: MediaQuery.of(context).size.width,

            margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 1,
                      spreadRadius: 0.5,
                      offset: Offset(0,0)
                  )
                ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 15, right: 15),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        keyboard = true;
                      });
                    },
                    controller: fullName,
                    cursorHeight: 20,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9,+]')),
                    ],
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        height: 1,
                        color: Colors.black.withOpacity(0.6), fontSize: 17),
                    decoration: const InputDecoration(

                      hintText: "+92 *** *******",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                      border: InputBorder.none,
                    ),
                  ),
                ),

              ],
            ),
          ),


          //Email Container
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 1,
                      spreadRadius: 0.5,
                      offset: Offset(0,0)
                  )
                ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 15, right: 15),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        keyboard = true;
                      });
                    },
                    //controller: fullName,
                    cursorHeight: 20,
                    style: TextStyle(
                        height: 1,
                        color: Colors.black.withOpacity(0.6), fontSize: 17),
                    decoration: const InputDecoration(

                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                      border: InputBorder.none,
                    ),
                  ),
                ),

              ],
            ),
          ),

          //Address Container
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 1,
                      spreadRadius: 0.5,
                      offset: Offset(0,0)
                  )
                ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 15, right: 15),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        keyboard = true;
                      });
                    },
                    //controller: fullName,
                    cursorHeight: 20,
                    style: TextStyle(
                        height: 1,
                        color: Colors.black.withOpacity(0.6), fontSize: 17),
                    decoration: const InputDecoration(

                      hintText: "Address",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                      border: InputBorder.none,
                    ),
                  ),
                ),

              ],
            ),
          ),

          //Address 2 Container
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 1,
                      spreadRadius: 0.5,
                      offset: Offset(0,0)
                  )
                ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 15, right: 15),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        keyboard = true;
                      });
                    },
                    //controller: fullName,
                    cursorHeight: 20,
                    style: TextStyle(
                        height: 1,
                        color: Colors.black.withOpacity(0.6), fontSize: 17),
                    decoration: const InputDecoration(

                      hintText: "Area",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                      border: InputBorder.none,
                    ),
                  ),
                ),

              ],
            ),
          ),

          //Zip Code Container
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 1,
                      spreadRadius: 0.5,
                      offset: Offset(0,0)
                  )
                ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 15, right: 15),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        keyboard = true;
                      });
                    },
                    //controller: fullName,
                    cursorHeight: 20,
                    style: TextStyle(
                        height: 1,
                        color: Colors.black.withOpacity(0.6), fontSize: 17),
                    decoration: const InputDecoration(

                      hintText: "Zip Code",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                      border: InputBorder.none,
                    ),
                  ),
                ),

              ],
            ),
          ),

          //City Container
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 1,
                      spreadRadius: 0.5,
                      offset: Offset(0,0)
                  )
                ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 15, right: 15),
                  child: TextField(
                    onTap: () {
                      // setState(() {
                      //   keyboard = true;
                      // });
                    },
                    //controller: fullName,
                    cursorHeight: 20,
                    style: TextStyle(
                        height: 1,
                        color: Colors.black.withOpacity(0.6), fontSize: 17),
                    decoration: const InputDecoration(

                      hintText: "City",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                      border: InputBorder.none,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentPage(BuildContext context) {
    return Container(
      //color: Colors.white,
      child: Column(
        children: [
          //Headings Container
          Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Colors.black.withOpacity(0.05)))),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Payment",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ],
                ),
              )),

          //COD or Card Container
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 0, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Card Container
                GestureDetector(
                  onTap: () {
                    setState(() {
                      card = true;
                      cod = false;
                    });
                  },
                  child: Stack(children: [
                    Container(
                      width: 150,
                      margin:
                          const EdgeInsets.only(right: 10, top: 20, bottom: 20),
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 0, left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: const Color(0xfff1f1f1),
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.credit_card,
                            size: 75,
                          ),
                          Text("Card"),
                        ],
                      ),
                    ),
                    card
                        ? Positioned(
                            top: 15,
                            right: 5,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: const Color(0xff31ca00),
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 18,
                              ),
                            ))
                        : const SizedBox()
                  ]),
                ),

                //Cash on Delivery Container
                GestureDetector(
                  onTap: () {
                    setState(() {
                      card = false;
                      cod = true;
                    });
                  },
                  child: Stack(children: [
                    Container(
                      width: 150,
                      margin:
                          const EdgeInsets.only(right: 10, top: 20, bottom: 20),
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 0, left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: const Color(0xfff1f1f1),
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.delivery_dining_outlined,
                            size: 75,
                          ),
                          Text("Cash on Delivery"),
                        ],
                      ),
                    ),
                    cod
                        ? Positioned(
                            top: 15,
                            right: 5,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: const Color(0xff31ca00),
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 18,
                              ),
                            ))
                        : const SizedBox()
                  ]),
                ),
              ],
            ),
          ),

          card
              ? Column(
                  children: [
                    //Headings Container
                    Container(
                        margin: const EdgeInsets.only(bottom: 0),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 15, right: 15),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Card Details",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                        )),

                    //Name on Card Container
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 15,right: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 1,
                                spreadRadius: 0.5,
                                offset: Offset(0,0)
                            )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 0, bottom: 0, left: 15, right: 15),
                            child: TextField(
                              onTap: () {
                                setState(() {
                                  keyboard = true;
                                });
                              },
                              //controller: fullName,
                              cursorHeight: 20,
                              style: TextStyle(
                                  height: 1,
                                  color: Colors.black.withOpacity(0.6), fontSize: 17),
                              decoration: const InputDecoration(

                                hintText: "Full Name",
                                hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    //Card Number Container
                    Container(
                      width: MediaQuery.of(context).size.width,

                      margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 1,
                                spreadRadius: 0.5,
                                offset: Offset(0,0)
                            )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 0, bottom: 0, left: 15, right: 15),
                            child: TextField(
                              onTap: () {
                                setState(() {
                                  keyboard = true;
                                });
                              },
                              controller: fullName,
                              cursorHeight: 20,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9,+]')),
                              ],
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  height: 1,
                                  color: Colors.black.withOpacity(0.6), fontSize: 17),
                              decoration: const InputDecoration(

                                hintText: "**** **** **** ****",
                                hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),


                    //Expiration Date Container
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 1,
                                spreadRadius: 0.5,
                                offset: Offset(0,0)
                            )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 0, bottom: 0, left: 15, right: 15),
                            child: TextField(
                              onTap: () {
                                setState(() {
                                  keyboard = true;
                                });
                              },
                              //controller: fullName,
                              cursorHeight: 20,
                              style: TextStyle(
                                  height: 1,
                                  color: Colors.black.withOpacity(0.6), fontSize: 17),
                              decoration: const InputDecoration(

                                hintText: "MM/YYYY",
                                hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    //CVV Container
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 1,
                                spreadRadius: 0.5,
                                offset: Offset(0,0)
                            )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 0, bottom: 0, left: 15, right: 15),
                            child: TextField(
                              onTap: () {
                                setState(() {
                                  keyboard = true;
                                });
                              },
                              //controller: fullName,
                              cursorHeight: 20,
                              style: TextStyle(
                                  height: 1,
                                  color: Colors.black.withOpacity(0.6), fontSize: 17),
                              decoration: const InputDecoration(

                                hintText: "CVV",
                                hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget confirmationPage(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.06),
      height: MediaQuery.of(context).size.height * 0.79,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //Headings Container
            Container(
                // decoration: BoxDecoration(
                //     border: Border(
                //         bottom:
                //             BorderSide(color: Colors.black.withOpacity(0.05)))),
                child: Container(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Confirmation",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ],
              ),
            )),

            //Your Order Container
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              margin: const EdgeInsets.only(top: 0,left: 10,right: 10,bottom: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 1,
                        spreadRadius: 0.5,
                        offset: Offset(0,0)
                    )
                  ]
              ),
              //color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(10),
                  //
                  //   ),
                  //   padding: const EdgeInsets.only(
                  //       top: 10, bottom: 10, left: 15, right: 15),
                  //   child: Row(
                  //     children: const [
                  //       Text("Your Order",
                  //           overflow: TextOverflow.ellipsis,
                  //           style: TextStyle(
                  //               color: Colors.black87,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 15)),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    padding: const EdgeInsets.only(top: 20,bottom: 20 , left:15 , right:15),
                    child: Row(
                      children:  [

                        Text("Your Cart",overflow: TextOverflow.ellipsis,
                            style:
                            const TextStyle(color: Colors.black87,fontWeight: FontWeight.bold, fontSize: 17)),
                      ],
                    ),
                  ),

                  //Your Order Product Container
                  cartProductCon(
                      context, "Jeans", "ZERRES", "5665646", "99.99", 2),
                  cartProductCon(
                      context, "Jeans", "ZERRES", "5665646", "99.99", 2),
                  cartProductCon(
                      context, "Jeans", "ZERRES", "5665646", "99.99", 2),
                  cartProductCon(
                      context, "Jeans", "ZERRES", "5665646", "99.99", 2),
                ],
              ),
            ),

            //Delivery Address & Name Container
            Container(
              margin: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 1,
                        spreadRadius: 0.5,
                        offset: Offset(0,0)
                    )
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 15, right: 15),
                    child: GestureDetector(
                      onTap: ()
                      {
                        goTo(1);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text("Ship to",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),

                          Icon(Icons.mode_edit_outline_outlined,size: 18,color: Color(0xfffd9926),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 15, right: 15),
                    child: Row(
                      children: [
                        Text("Ibrahim Khan Zarkoon",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 10, left: 15, right: 15),
                    child: Text(
                      "D-21/1 Block-H, Karachi",
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  )
                ],
              ),
            ),

            //Payment Container
            Container(
              margin: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 1,
                        spreadRadius: 0.5,
                        offset: Offset(0,0)
                    )
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 15, right: 15),
                    child: GestureDetector(
                      onTap: ()
                      {
                        goTo(2);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text("Payment Details",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),

                          Icon(Icons.mode_edit_outline_outlined,size: 18,color: Color(0xfffd9926),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 15, right: 15),
                    child: Row(
                      children: [
                        Text(
                            card
                                ? "6789 2716 3109 6544"
                                : "Ibrahim Khan Zarkoon / +92 336 3434322",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 10, left: 15, right: 15),
                    child: Text(
                      card ? "Card" : "Cash on Delivery",
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  )
                ],
              ),
            ),

            //Voucher Codes Container
            Container(
              margin: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 1,
                        spreadRadius: 0.5,
                        offset: Offset(0,0)
                    )
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 0),

                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),

                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 0, left: 15, right: 15),
                          child: Row(
                            children: const [
                              Text("Gift cards, coupons, vouchers",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 1,
                                    spreadRadius: 0.5,
                                    offset: Offset(0,0)
                                )
                              ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 0, bottom: 0, left: 15, right: 15),
                                child: TextField(
                                  onTap: () {
                                    setState(() {
                                      keyboard = true;
                                    });
                                  },
                                  //controller: fullName,
                                  cursorHeight: 20,
                                  style: TextStyle(
                                      height: 1,
                                      color: Colors.black.withOpacity(0.6), fontSize: 17),
                                  decoration: const InputDecoration(

                                    hintText: "XXXXXX",
                                    hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       top: 0, bottom: 10, left: 15, right: 15),
                  //   child: Text(
                  //     "VX37466",
                  //     style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  //   ),
                  // )
                ],
              ),
            ),

            //Order Summar Container
            Container(
              margin: const EdgeInsets.only(bottom: 3,left: 10,right: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 1,
                      spreadRadius: 0.5,
                      offset: Offset(0,0)
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Headings(context, "Order Summary"),

                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Items Total",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        Text("4",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 0, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Shipping",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        Text("GBP £9.99",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Discount",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        Text("GBP £100.00",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 10, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Payment",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        Text("GBP £404.99",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // //Order Total Container
            // Container(
            //   margin: const EdgeInsets.only(top: 0,bottom: 30),
            //   width: MediaQuery.of(context).size.width,
            //   color: Colors.white,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Container(
            //         padding: const EdgeInsets.only(
            //             top: 10, bottom: 10, left: 15, right: 15),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: const [
            //             Text("Order Total",
            //                 overflow: TextOverflow.ellipsis,
            //                 style: TextStyle(
            //                     color: Colors.black87,
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 15)),
            //             Text("GBP £504.99",
            //                 overflow: TextOverflow.ellipsis,
            //                 style: TextStyle(
            //                     color: Colors.black,
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 14)),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget cartProductCon(BuildContext context, String pTitle, String pStoreTitle,
      String pOrderNumber, String pCost, int productCount) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .15,
      margin: const EdgeInsets.only(top: 0, bottom: 0),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(color: Colors.white,),
      child: Row(
        children: [
          //Image Container
          Container(
            width: 100,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: const Offset(0, 0))
                ],
                image: const DecorationImage(
                    image: NetworkImage(
                        "https://www.luxury-legs.com/images/zerres-gina-wellness-lightweight-trousers-p4247-207206_medium.jpg"))),
          ),

          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pTitle,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    Text(
                      pStoreTitle,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 13),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    Text(
                      "Order #$pOrderNumber",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 13),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const Spacer(),

                    //Price and + - Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "£ ${double.parse(pCost) * productCount}0",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),

                        // //+ - Counter Container
                        // Container(
                        //   height: 40,
                        //   //margin: EdgeInsets.only(right: 15),
                        //   //width: MediaQuery.of(context).size.width*0.31,
                        //   decoration: BoxDecoration(
                        //       //color: Color(0xffffffff),
                        //       borderRadius: BorderRadius.circular(5),
                        //
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       InkWell(
                        //         onTap: () {
                        //           if (productCount > 0) {
                        //             setState(() {
                        //               productCount--;
                        //             });
                        //           }
                        //         },
                        //         child: Container(
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(5),
                        //             boxShadow: [
                        //               BoxShadow(
                        //                   color: Colors.black.withOpacity(0.1),
                        //                   offset: Offset(0,0),
                        //                   blurRadius: 1,
                        //                   spreadRadius: 1
                        //               )
                        //             ],
                        //             color: Colors.black,
                        //           ),
                        //           padding: EdgeInsets.all(8),
                        //           child: Icon(Icons.remove, color: Colors.white),
                        //         ),
                        //       ),
                        //
                        //       const SizedBox(width: 5,),
                        //
                        //       //Product Count Container
                        //       Container(
                        //           alignment: Alignment.center,
                        //           //height: 50,
                        //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),                                color: Colors.white,
                        //               boxShadow: [
                        //                 BoxShadow(
                        //                     color: Colors.black.withOpacity(0.1),
                        //                     offset: Offset(0,0),
                        //                     blurRadius: 1,
                        //                     spreadRadius: 1
                        //                 )
                        //               ]),
                        //           padding: EdgeInsets.only(left: 15,right: 15),
                        //           child: Text('$productCount')),
                        //
                        //       const SizedBox(width: 5,),
                        //
                        //       InkWell(
                        //         onTap: () {
                        //           productCount++;
                        //
                        //           print("++");
                        //           setState(() {
                        //             productCount++;
                        //           });
                        //         },
                        //         child: Container(
                        //           decoration: BoxDecoration(
                        //               boxShadow: [
                        //                 BoxShadow(
                        //                     color: Colors.black.withOpacity(0.1),
                        //                     offset: Offset(0,0),
                        //                     blurRadius: 1,
                        //                     spreadRadius: 1
                        //                 )
                        //               ],
                        //             borderRadius: BorderRadius.circular(5),
                        //             color: Colors.black,
                        //           ),
                        //           padding: EdgeInsets.all(8),
                        //           child: Icon(Icons.add, color: Colors.white),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    )
                  ],
                ),
                Text(
                  "x$productCount",
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
