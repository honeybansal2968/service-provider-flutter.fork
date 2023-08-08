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
                        image: const DecorationImage(image: NetworkImage('data:image/jpeg;base64,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')),
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