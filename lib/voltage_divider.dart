import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
double res1=1; double res2=2; double res3=3;
class VoltageCalculator extends ChangeNotifier{
  double get res=>1;
  void setRes(double res,int index){
    if(index==0){
      res1=res;
      notifyListeners();
    }
    else  if(index==1){
      res2=res;
      notifyListeners();
    }
    else  if(index==2){
      res3=res;
      notifyListeners();
    }
  }
}
class VoltageDivider extends StatefulWidget {
  const VoltageDivider({super.key});

  @override
  State<VoltageDivider> createState() => _VoltageDividerState();
}

class _VoltageDividerState extends State<VoltageDivider> {
  Widget valueSelector=   Container(width: 40,height: 20,

    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [

          BoxShadow(
              color: Colors.black54,
              spreadRadius: 2,
              blurRadius:1,
              offset: Offset(3, 3)
          ),
          BoxShadow(
              color: Colors.white10,
              blurRadius:4,
              spreadRadius: 3,
              offset: Offset(-3, -3)
          )
        ]
    ),);
  bool loadConnecting=true;

  Color loadColor=Colors.red.shade400;
  String loadText="Connecting load";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) { return VoltageCalculator();},
      child:Consumer<VoltageCalculator>(builder: (b,k,c)=> Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Voltage divider",style: TextStyle(fontSize: 18),),
        ),
        body: Column(
          children: [
            SizedBox(height: 20,),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                child: Stack(
                  children: [
                    SizedBox(
                        width: 400,
                        child: Image.asset("assets/voltagedivider.PNG")),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(200, 70, 50, 50),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Cont(  index: 0,),
                            SizedBox(height: 120,),
                            Row(
                              children: [
                                Cont(  index: 1,),SizedBox(width: 55,),   Cont(  index: 2,),
                              ],
                            ),

                          ],
                        )
                    ), Padding(
                      padding: const EdgeInsets.fromLTRB(280, 100, 50, 50),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              if(loadConnecting)
                              {
                                setState(() {
                                  loadColor=Colors.green.shade400;
                                  loadConnecting=false;
                                  loadText="Disconnecting  \n    load";
                                });
                              }else
                              {
                                setState(() {
                                  loadColor=Colors.red.shade400;
                                  loadConnecting=true;
                                  loadText="Connecting  \n    load";
                                });
                              }
                            },
                            child: Container(
                              child: Center(child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(loadText,style: TextStyle(fontSize: 15),),
                              )),
                              width: 100,
                              height: 40,decoration: BoxDecoration(
                                color: loadColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: loadColor,
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                    offset: Offset(2, 2),
                                  ),
                                  BoxShadow(
                                    color:loadColor,
                                    offset: Offset(-2,- 2),
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                  )]
                            ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          loadConnecting?   Container(
                            width: 40,
                            color: Colors.white,height: 5,):SizedBox(),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        SizedBox(width: 70,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                          child: Text('${res1*res3} V',style: TextStyle(color: Colors.green),),
                          //battery_voltage
                        ),
                        SizedBox(width: 170,),

                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${res1*res3} V',style: TextStyle(color: Colors.green),) ,
                            SizedBox(height: 130,)
                            ,Row(
                              children: [

                                Text('${res1*res3} V',style: TextStyle(color: Colors.green),)
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),)
    );
  }
}
class Cont extends StatefulWidget {

 late int index;
   Cont({super.key,required this.index});

  @override
  State<Cont> createState() => _ContState();
}

class _ContState extends State<Cont> {
  TextEditingController _controller=TextEditingController();
   String input='1';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          showDialog(context: context, builder: (builder)=>
              AlertDialog(
                actions: [
                  TextButton(onPressed: (){setState(() {
                    input= _controller.text;
                    Navigator.pop(context);
                    if(widget.index==0){
                      res1= double.parse(_controller.text);
                     Provider.of<VoltageCalculator>(context,listen: false).setRes(res1, widget.index);

                    }else if(widget.index==1){
                      res2= double.parse(_controller.text);
                      Provider.of<VoltageCalculator>(context,listen: false).setRes(res2, widget.index);
                    }else if(widget.index==2){
                      res3= double.parse(_controller.text);
                      Provider.of<VoltageCalculator>(context,listen: false).setRes(res3, widget.index);
                    }

                    setState(() {

                    });

                  });} , child: Text("Save")),
                  TextButton(onPressed: (){setState(() {
                    Navigator.pop(context);
                  });} , child: Text("Cancel")),
                ],
                title: Text("Enter a value",style: TextStyle(fontSize: 16),),
                content: SizedBox(
                  height: 150,
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    cursorColor: Colors.green,

                    decoration: InputDecoration(

                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red,width: 2)
                        ),

                        iconColor: Colors.green
                    ),
                    keyboardType: TextInputType.number,
                    controller: _controller,
                  ),
                ),

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                ),

              ));
        });
      },
      child: Container(
        child: Text(input,style: TextStyle(color: Colors.red),),
        width: 40,height: 20,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [

              BoxShadow(
                  color: Colors.black54,
                  spreadRadius: 2,
                  blurRadius:1,
                  offset: Offset(3, 3)
              ),
              BoxShadow(
                  color: Colors.white10,
                  blurRadius:4,
                  spreadRadius: 3,
                  offset: Offset(-3, -3)
              )
            ]
        ),),
    );
}}
