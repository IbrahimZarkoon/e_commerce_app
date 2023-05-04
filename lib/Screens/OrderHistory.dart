import 'package:e_commerce/Widgets/Headings.dart';
import 'package:flutter/material.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF0071dc),
        automaticallyImplyLeading: false,
        leading: BackButton(onPressed: () => Navigator.pop(context),color: Colors.white,),
        leadingWidth: 30,
        title: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text("Orders & Reordering",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

        child: Column(

          children: [

            Headings(context, "Past Orders"),

            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0,0)
                      )
                    ],

                    borderRadius: BorderRadius.circular(8)
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(15),
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [

                      //1st Row for image title and cost
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        
                        children: [

                          //Image Container
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 75,height: 75,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0,0)
                                  )
                                ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image: NetworkImage("https://rebeltech.com/wp-content/uploads/2021/10/MME73.jpg"),
                              fit: BoxFit.contain)
                            ),
                          ),

                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Apple",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 17),),

                                    Text("£ 42.00",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 17),),

                                  ],
                                ),

                                const SizedBox(height: 10,),

                                Text("18 Apr, 03:56",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 13),),

                                const SizedBox(height: 10,),

                                Text("Airpods Pro",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: 15),)

                              ],
                            ),
                          )
                        ],

                      ),

                      //Rate Order Container
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 10,bottom: 10),
                          padding: const EdgeInsets.only(left: 0,top: 7,bottom: 7),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFfc9038)),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Text("Rate order",textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFfc9038),fontSize: 14),)),

                      //Select items to reorder Container
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 0,bottom: 10),
                          padding: const EdgeInsets.only(left: 0,top: 7,bottom: 7),
                          decoration: BoxDecoration(
                            color: Color(0xFFfc9038),
                            //border: Border.all(color: Color(0xFFfc9038)),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Text("Select items to reorder",textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 14),)),
                    ],
                  ),
                );
              }),
            )


          ],
        ),
      ),
    );
  }
}
