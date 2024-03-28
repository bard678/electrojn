

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VoltageDiv extends StatefulWidget {
  final  ThemeData data;
  const VoltageDiv({super.key,required this.data});

  @override
  State<VoltageDiv> createState() => _VoltageDivState();
}

class _VoltageDivState extends State<VoltageDiv> {
  List<String> dropdownItems = ['μV','mV','V', 'KV', 'MV'];
  List<String> dropdownItemsOm = ['μΩ','mΩ','Ω', 'KΩ', 'MΩ'];
  String? ohmValue; String? ohmValue1; String? ohmValue2;
  String? out;
  double res0=10.0;double res1=10.0;double res2=10.0;double vinValue=5.0;double outValue=10.0;


  final TextEditingController _controller=TextEditingController();
  final TextEditingController _controller0=TextEditingController();
  final TextEditingController _controller1=TextEditingController();
  final TextEditingController _controller2=TextEditingController();
  final TextEditingController _controllerv=TextEditingController();
  String? valu;
  String vin="1";
  String vout="1";
  String r1="1";
  String r2="1";
  String r3="1";
  double vr1=0;double vr2=0;double vr3=0;double ir1=0;double ir2=0;double ir3=0;double pr1=0;double pr2=0;double pr3=0;double pTot=0;
  bool value=false;
  TextStyle style17=const TextStyle(fontSize: 17);
  TextStyle style20=const TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    double res4=(res1*res2)/(res1+res2);
    if(value) {
      outValue = vinValue * res4 / (res4 + res0);
      vr1=vinValue*res0/(res4+res0);
      vr2=vinValue*res4/(res4+res0);
      vr3=vinValue*res4/(res4+res0);
      ir1=(vinValue*res0/(res4+res0))/res0;
      ir2=(vinValue*res4/(res4+res0))/res1;
      ir3=(vinValue*res4/(res4+res0))/res2;
      pr1=pow(((vinValue*res0/(res4+res0))/res0), 2)*res0;
      pr2=pow((vinValue*res4/(res4+res0))/res1, 2)*res1;
      pr3=pow((vinValue*res4/(res4+res0))/res2, 2)*res2;
      pTot=pr1+pr2+pr3;
    }else{
      outValue=vinValue*res1/(res1+res0);
      vr1= vinValue*res0/(res1+res0);
      vr2=vinValue*res1/(res1+res0);
      vr3=0;
      ir1=(vinValue*res0/(res1+res0))/res0;
      ir2=(vinValue*res1/(res1+res0))/res1;
      ir3=0;
      pr1=pow((vinValue*res0/(res1+res0))/res0, 2)*res0;
      pr2=pow((vinValue*res1/(res1+res0))/res1, 2)*res1;
      pr3=0;
      pTot=pr1+pr2+pr3;
    }

    return  Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,title: Text("Voltage divider",style: TextStyle(fontSize: Platform.isWindows? 20:18),),),
      body: Padding(
        padding:  EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(130, 40, 0, 0),
                    child: GestureDetector(
                        onTap: (){setState(() {
                          showDialog(context: context, builder: (builder)=>AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero
                            ),
                            actions: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(120, 40),
                                      backgroundColor: Colors.grey,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero
                                      )
                                  ),
                                  onPressed: () {
                                  },
                                  child: Text("CANCEL",
                                    style: TextStyle(color:widget.data==ThemeData.light()? Colors.black54:Colors.white),)),
                              const SizedBox(width: 5),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(120, 40),
                                      backgroundColor: Colors.green,
                                      shape: const RoundedRectangleBorder(

                                          borderRadius: BorderRadius.zero
                                      )
                                  ),
                                  onPressed: (){setState(() {
                                    vin=_controller.text;
                                    vinValue=double.parse(vin);
                                    if(value) {
                                      outValue = vinValue * res4 / (res4 + res0);
                                    }else{
                                      outValue=vinValue*res1/(res1+res0);
                                    }
                                    if(vin.isNotEmpty)Navigator.pop(context);
                                  });}, child: Text("OK",style: TextStyle(color:widget.data==ThemeData.light()? Colors.black54:Colors.white),))

                            ],
                            title: const Text("Insert the value of Vin",style: TextStyle(fontSize: 15),),
                            content:  Row(
                              children: [
                                SizedBox(
                                  width: 130,
                                  child: TextField(
                                    controller: _controller,
                                    maxLength: 5,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    cursorColor: Colors.green,
                                    decoration: const InputDecoration(
                                        focusedBorder: UnderlineInputBorder(

                                            borderSide: BorderSide(color: Colors.green)
                                        ) ,
                                        enabledBorder:
                                        UnderlineInputBorder(

                                            borderSide: BorderSide(color: Colors.green)
                                        ),
                                        hoverColor: Colors.green,
                                        fillColor: Colors.green
                                        ,focusColor: Colors.green



                                    ),
                                  ),
                                ),
                                const SizedBox(width: 40,),
                                StatefulBuilder(
                                  builder: (context,set)=>
                                      SizedBox(
                                        width: 50,
                                        child: DropdownButton<String>(
                                            isExpanded: true,
                                            hint: const Text('V'),
                                            value: valu,
                                            items: dropdownItems.map((e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(e,style: const TextStyle(fontSize: 13),),)).toList(), onChanged: (String? v){set(() {
                                          valu=v;
                                        });}),
                                      ),
                                )

                              ],
                            ),
                          ));
                        });},
                        child:
                        Container(width: 60,height: 40,color: Colors.green,child:  Text("   Vin\n  $vinValue v",style: const TextStyle(fontSize: 12),),)),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                              child: GestureDetector(
                                  onTap: (){setState(() {
                                    showDialog(context: context, builder: (builder)=>AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: const Size(120, 40),
                                                backgroundColor: Colors.grey,
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.zero
                                                )
                                            ),
                                            onPressed: () {
                                            },
                                            child: Text("CANCEL",
                                              style: TextStyle(color:widget.data==ThemeData.light()? Colors.black54:Colors.white),)),
                                        const SizedBox(width: 5),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: const Size(120, 40),
                                                backgroundColor: Colors.green,
                                                shape: const RoundedRectangleBorder(
                    
                                                    borderRadius: BorderRadius.zero
                                                )
                                            ),
                                            onPressed: (){setState(() {
                                              r1=_controller0.text;
                                              res0=double.parse(r1);
                                              if(value) {
                                                outValue = vinValue * res4 / (res4 + res0);
                                              }else{
                                                outValue=vinValue*res1/(res1+res0);
                                              }
                                              if(r1.isNotEmpty)   Navigator.pop(context);
                                            });}, child: Text("OK",style: TextStyle(color:widget.data==ThemeData.light()? Colors.black54:Colors.white),))
                    
                                      ],
                                      title: const Text("Insert the value of R1",style: TextStyle(fontSize: 15),),
                                      content:  Row(
                                        children: [
                                          SizedBox(
                                            width: 130,
                                            child: TextField(
                                              controller: _controller0,
                                              maxLength: 5,
                                              inputFormatters: [
                                                FilteringTextInputFormatter.digitsOnly
                                              ],
                                              cursorColor: Colors.green,
                                              decoration: const InputDecoration(
                                                  focusedBorder: UnderlineInputBorder(
                    
                                                      borderSide: BorderSide(color: Colors.green)
                                                  ) ,
                                                  enabledBorder:
                                                  UnderlineInputBorder(
                    
                                                      borderSide: BorderSide(color: Colors.green)
                                                  ),
                                                  hoverColor: Colors.green,
                                                  fillColor: Colors.green
                                                  ,focusColor: Colors.green
                    
                    
                    
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 40,),
                                          StatefulBuilder(
                                            builder: (context,set)=>
                                                SizedBox(
                                                  width: 50,
                                                  child: DropdownButton<String>(
                                                      isExpanded: true,
                                                      hint: const Text('Ω'),
                                                      value: ohmValue,
                                                      items: dropdownItemsOm.map((e) => DropdownMenuItem(
                                                        value: e,
                                                        child: Text(e,style: const TextStyle(fontSize: 13),),)).toList(), onChanged: (String? v){set(() {
                                                    ohmValue=v;
                                                  });}),
                                                ),
                                          )
                    
                                        ],
                                      ),
                                    ));
                                  });},
                                  child: Container(width: 60,height: 40,color: Colors.green,child:  Text("   R1\n  $res0 k",style: const TextStyle(fontSize: 12),),)),
                            ),
                            const SizedBox(height: 50,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                              child: GestureDetector(
                                  onTap: (){setState(() {
                                    showDialog(context: context, builder: (builder)=>AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: const Size(120, 40),
                                                backgroundColor: Colors.grey,
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.zero
                                                )
                                            ),
                                            onPressed: () {
                                            },
                                            child: Text("CANCEL",
                                              style: TextStyle(color:widget.data==ThemeData.light()? Colors.black54:Colors.white),)),
                                        const SizedBox(width: 5),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: const Size(120, 40),
                                                backgroundColor: Colors.green,
                                                shape: const RoundedRectangleBorder(
                    
                                                    borderRadius: BorderRadius.zero
                                                )
                                            ),
                                            onPressed: (){setState(() {
                                              r2=_controller1.text;
                                              res1=double.parse(r2);
                                              if(value) {
                                                outValue = vinValue * res4 / (res4 + res0);
                                              }else{
                                                outValue=vinValue*res1/(res1+res0);
                                              }
                                              if(r2.isNotEmpty)  Navigator.pop(context);
                                            });}, child: Text("OK",style: TextStyle(color:widget.data==ThemeData.light()? Colors.black54:Colors.white),))
                    
                                      ],
                                      title: const Text("Insert the value of R2",style: TextStyle(fontSize: 15),),
                                      content:  Row(
                                        children: [
                                          SizedBox(
                                            width: 130,
                                            child: TextField(
                                              controller: _controller1,
                                              maxLength: 5,
                                              inputFormatters: [
                                                FilteringTextInputFormatter.digitsOnly
                                              ],
                                              cursorColor: Colors.green,
                                              decoration: const InputDecoration(
                                                  focusedBorder: UnderlineInputBorder(
                    
                                                      borderSide: BorderSide(color: Colors.green)
                                                  ) ,
                                                  enabledBorder:
                                                  UnderlineInputBorder(
                    
                                                      borderSide: BorderSide(color: Colors.green)
                                                  ),
                                                  hoverColor: Colors.green,
                                                  fillColor: Colors.green
                                                  ,focusColor: Colors.green
                    
                    
                    
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 40,),
                                          StatefulBuilder(
                                            builder: (context,set)=>
                                                SizedBox(
                                                  width: 50,
                                                  child: DropdownButton<String>(
                                                      isExpanded: true,
                                                      hint: const Text('Ω'),
                                                      value: ohmValue1,
                                                      items: dropdownItems.map((e) => DropdownMenuItem(
                                                        value: e,
                                                        child: Text(e,style: const TextStyle(fontSize: 13),),)).toList(), onChanged: (String? v){set(() {
                                                    ohmValue1=v;
                                                  });}),
                                                ),
                                          )
                    
                                        ],
                                      ),
                                    ));
                                  });},
                                  child: Container(width: 60,height: 40,color: Colors.green,child:  Text("   R2\n  ${res1 }k",style: const TextStyle(fontSize: 12),),)),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10,),
                        Center(child: Stack(
                          children: [
                            Image.asset("assets/voltagediv.PNG",scale:2,),
                            value?const SizedBox(): Padding(
                              padding: const EdgeInsets.fromLTRB(79.5, 160, 0, 0),
                              child: Container(width: 5,height: 20,color: Colors.white,),
                            )
                          ],
                        )),
                        const SizedBox(width: 10,),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: GestureDetector(
                                  onTap: (){setState(() {
                                    showDialog(context: context, builder: (builder)=>AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: const Size(120, 40),
                                                backgroundColor: Colors.grey,
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.zero
                                                )
                                            ),
                                            onPressed: () {
                                            },
                                            child: Text("CANCEL",
                                              style: TextStyle(color:widget.data==ThemeData.light()? Colors.black54:Colors.white),)),
                                        const SizedBox(width: 5),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: const Size(120, 40),
                                                backgroundColor: Colors.green,
                                                shape: const RoundedRectangleBorder(
                    
                                                    borderRadius: BorderRadius.zero
                                                )
                                            ),
                                            onPressed: (){setState(() {
                                              vout=_controllerv.text;
                                              if(vout.isNotEmpty)  Navigator.pop(context);
                                            });}, child: Text("OK",style: TextStyle(color:widget.data==ThemeData.light()? Colors.black54:Colors.white),))
                    
                                      ],
                                      title: const Text("Insert the value of Vout",style: TextStyle(fontSize: 15),),
                                      content:  Row(
                                        children: [
                                          SizedBox(
                                            width: 130,
                                            child: TextField(
                                              controller: _controllerv,
                                              maxLength: 5,
                                              inputFormatters: [
                                                FilteringTextInputFormatter.digitsOnly
                                              ],
                                              cursorColor: Colors.green,
                                              decoration: const InputDecoration(
                                                  focusedBorder: UnderlineInputBorder(
                    
                                                      borderSide: BorderSide(color: Colors.green)
                                                  ) ,
                                                  enabledBorder:
                                                  UnderlineInputBorder(
                    
                                                      borderSide: BorderSide(color: Colors.green)
                                                  ),
                                                  hoverColor: Colors.green,
                                                  fillColor: Colors.green
                                                  ,focusColor: Colors.green
                    
                    
                    
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 40,),
                                          StatefulBuilder(
                                            builder: (context,set)=>
                                                SizedBox(
                                                  width: 50,
                                                  child: DropdownButton<String>(
                                                      isExpanded: true,
                                                      hint: const Text("V"),
                    
                                                      value: out,
                                                      items: dropdownItems.map((e) => DropdownMenuItem(
                                                        value: e,
                                                        child: Text(e,style: const TextStyle(fontSize: 13),),)).toList(), onChanged: (String? v){set(() {
                                                    out=v;
                                                  });}),
                                                ),
                                          )
                    
                                        ],
                                      ),
                                    ));
                                  });},
                                  child: Container(width: 60,height: 40,color: Colors.green,child:  Text("   Vout\n   $outValue v",style: const TextStyle(fontSize: 12),))),
                            ),
                            const SizedBox(height: 50,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: GestureDetector(
                                  onTap: (){setState(() {
                                    showDialog(context: context, builder: (builder)=>AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: const Size(120, 40),
                                                backgroundColor: Colors.grey,
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.zero
                                                )
                                            ),
                                            onPressed: () {
                                            },
                                            child: Text("CANCEL",
                                              style: TextStyle(color:widget.data==ThemeData.light()? Colors.black54:Colors.white),)),
                                        const SizedBox(width: 5),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: const Size(120, 40),
                                                backgroundColor: Colors.green,
                                                shape: const RoundedRectangleBorder(
                    
                                                    borderRadius: BorderRadius.zero
                                                )
                                            ),
                                            onPressed: (){setState(() {
                                              r3=_controller2.text;
                                              res2=double.parse(r3);
                                              if(value) {
                                                outValue = vinValue * res4 / (res4 + res0);
                                              }else{
                                                outValue=vinValue*res1/(res1+res0);
                                              }
                                              if(r3.isNotEmpty) Navigator.pop(context);
                                            });}, child: Text("OK",style: TextStyle(color:widget.data==ThemeData.light()? Colors.black54:Colors.white),))
                    
                                      ],
                                      title: const Text("Insert the value of R3",style: TextStyle(fontSize: 15),),
                                      content:  Row(
                                        children: [
                                          SizedBox(
                                            width: 130,
                                            child: TextField(
                                              controller: _controller2,
                                              maxLength: 5,
                                              inputFormatters: [
                                                FilteringTextInputFormatter.digitsOnly
                                              ],
                                              cursorColor: Colors.green,
                                              decoration: const InputDecoration(
                                                  focusedBorder: UnderlineInputBorder(
                    
                                                      borderSide: BorderSide(color: Colors.green)
                                                  ) ,
                                                  enabledBorder:
                                                  UnderlineInputBorder(
                    
                                                      borderSide: BorderSide(color: Colors.green)
                                                  ),
                                                  hoverColor: Colors.green,
                                                  fillColor: Colors.green
                                                  ,focusColor: Colors.green
                    
                    
                    
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 40,),
                                          StatefulBuilder(
                                            builder: (context,set)=>
                                                SizedBox(
                                                  width: 50,
                                                  child: DropdownButton<String>(
                                                      isExpanded: true,
                                                      hint: const Text('Ω'),
                                                      value: ohmValue2,
                                                      items: dropdownItemsOm.map((e) => DropdownMenuItem(
                                                        value: e,
                                                        child: Text(e,style: const TextStyle(fontSize: 13),),)).toList(), onChanged: (String? v){set(() {
                                                    ohmValue2=v;
                                                  });}),
                                                ),
                                          )
                    
                                        ],
                                      ),
                                    ));
                                  });},
                                  child: Container(width: 60,height: 40,color: Colors.green,child:  Text("   R3\n  $r3 k",style: const TextStyle(fontSize: 12),))),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40,),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Checkbox(
                          activeColor: Colors.green,
                          value: value, onChanged: (v){setState(() {
                        value=v!;
                      });}),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: Text("Enable load RL",style: TextStyle(fontSize: 15),),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text("Enter R1,R2,Vin to calculate Vout value",style: TextStyle(fontSize: 20),),const SizedBox(height: 30,),
                        const Text("The voltage across every resistor in this circuit is:",style: TextStyle(fontSize: 17),),const SizedBox(height: 10,),
                        Text("V(R1)=${vr1}v\nV(R2)=${vr2}v\nV(R3)=${vr3}v"),const SizedBox(height: 10,),
                        const Text("The current across every resistor",style: TextStyle(fontSize: 17)),const SizedBox(height: 10,),
                        Text("I(R1)=${ir1}A\nI(R2)=${ir2}A\nI(R3)=${ir3}A"), const SizedBox(height: 10,),
                        const Text("The power dissipated by the circuit is:",style: TextStyle(fontSize: 17)),const SizedBox(height: 10,),
                        Text("P(R1)=${pr1}w\nP(R2)=${pr2}w\nP(R3)=${pr3}w\nP(tot)=${pTot}w")
                      ],),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}