import 'package:flutter/material.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  String select="Select a service";
  List<String> listItem = ["Item 1","Item 2","Item 3","Select a service"];

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Order Details',style: TextStyle(fontWeight:FontWeight.w500,fontSize: 32),),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Text(
                      'Ticket ID:',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 32,
                      width: 120,
                      child: const Center(
                          child: Text(
                            'X X X X X X',
                            style: TextStyle(
                                fontSize: 19, color: Color(0xFFFFFFFF)),
                          )),
                      decoration: BoxDecoration(
                        color: const Color(0xFF10C500),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text('Status:',style: TextStyle(fontSize: 13),),
                    const Text('On-going',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text('Vehicle Details:',style: TextStyle(fontSize: 25),),
                const SizedBox(
                  height: 3,
                ),
                Container(

                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Vehicle Number:',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'MH14HPXXXX',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),



                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Brand:',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Honda',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            'Model:',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'City',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Customer Info', style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.yellow,
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    Container(
                      child:const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Name:',style: TextStyle(fontSize: 14)),
                              Text('Customer Name',style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),),

                            ],
                          ),
                          Row(
                            children: [
                              Text('Mobile Number:',style: TextStyle(fontSize: 14)),
                              Text('9825098250',style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),

                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text('Services Added:',style: TextStyle(fontSize: 25),),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tyre Puncture'),
                    Text('Rs.700'),
                  ],
                ),
                const Divider(color: Color(0xFFD9D9D9), thickness: 2,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Windshield Cleaning'),
                    Text('Rs.700'),
                  ],
                ),
                const Divider(color: Color(0xFFD9D9D9), thickness: 2,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Brake Oil Replacement'),
                    Text('Rs.700'),
                  ],
                ),
                const Divider(color: Color(0xFFD9D9D9), thickness: 2,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Battery Check'),
                    Text('Rs.700'),
                  ],
                ),
                const Divider(color: Color(0xFFD9D9D9), thickness: 2,),
                const SizedBox(
                  height: 5,
                ),
                const Text('Add new service:',style: TextStyle(fontSize: 23),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 25,
                      width: 200,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFFFFFFF),

                        boxShadow:const [
                          BoxShadow(
                            color: Color(0xFF000000),
                            blurRadius: 2,
                          ),
                        ],

                      ),

                      child: DropdownButton(


                        hint: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7),
                          child: Text("Select a service:", style: TextStyle(fontSize: 15),),
                        ),

                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 28,
                        isExpanded: true,
                        underline: const SizedBox(),

                        value: select,
                        onChanged: (newValue) {
                          setState(() {
                            select = newValue!;
                          });
                        },
                        items: listItem.map((e) {
                          return DropdownMenuItem(
                              value: e,
                              child: Text(e));
                        }).toList(),
                      ),
                    ),

                    Container(

                      height: 25,
                      width: 90,
                      child: const Center(child: Text('ADD', style: TextStyle(fontSize: 15,color: Color(0xFFFFFFFF)),)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFF10C500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),

                Container(
                  margin: const EdgeInsets.only(bottom: 0),
                  width: 340,
                  height: 63,
                  decoration: BoxDecoration(
                    color: const Color(0xFF000000),
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Taking much time?',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            Text('Convert this to scheduled service now!',style: TextStyle(color: Colors.white,fontSize: 10),),
                          ],
                        ),
                        Container(

                          height: 30,
                          width: 100,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),


                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.arrow_forward,color: Colors.white,size: 35,),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 0),
                  width: 380,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Color(0xFF000000),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Bill Amount', style: TextStyle(fontSize: 5,color:Colors.white),),
                            Text('Rs.2800',style: TextStyle(fontSize: 15,color:Colors.white),),
                          ],
                        ),
                        Container(

                          height: 30,
                          width: 100,
                          child: const Center(child: Text('Click', style: TextStyle(fontSize: 15,color: Color(0xFFFFFFFF)),)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFF10C500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}