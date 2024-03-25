import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


double res1=1; double res2=2; double res3=3; double bat=3;
String input="";
class VoltageCalculator extends ChangeNotifier{
  double get res=>1;
  String get _input=>"";
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
    } else  if(index==3){
      bat=res;
      notifyListeners();
    }
  }
  void setInput(String input0){
    input=input0;
    notifyListeners();
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
                          padding: const EdgeInsets.fromLTRB(0, 80, 0, 40),
                          child:   Cont(  index: 3,),
                          //battery_voltage
                        ),
                        SizedBox(width: 170,),

                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            input.isNotEmpty?

                            Text( loadConnecting?'${bat*res1/(res1+res2)}  V':'${bat*res1/(((res2*res3)/(res2+res3))+res1)}  V',style: TextStyle(color: Colors.green),) :Text(""),
                            SizedBox(height: 130,)
                            ,Row(
                              children: [
                                input.isNotEmpty?
                                Text(loadConnecting?'${bat*res2/(res2+res1)} V':'${bat*((res2*res3)/(res2+res3))/(((res2*res3)/(res2+res3))+res1)} V',style: TextStyle(color: Colors.green),):Text(""),
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

  int index;
   Cont({super.key,required this.index});

  @override
  State<Cont> createState() => _ContState();
}

class _ContState extends State<Cont> {

  TextEditingController _controller=TextEditingController();
  String defaultValue="";
  @override
  Widget build(BuildContext context) {

    if(widget.index==0){
      setState(() {
        defaultValue="$res1";
      });
    } else  if(widget.index==1){
      setState(() {
        defaultValue="$res2";
      });
    }
   else if(widget.index==2){
      setState(() {
        defaultValue="$res3";
      });
    }else if(widget.index==3){
      setState(() {
        defaultValue="$bat";
      });
    }
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
                      Provider.of<VoltageCalculator>(context,listen: false).setInput(_controller.text);
                      res1= double.parse(input);
                     Provider.of<VoltageCalculator>(context,listen: false).setRes(res1, widget.index);

                    }else if(widget.index==1){
                      Provider.of<VoltageCalculator>(context,listen: false).setInput(_controller.text);
                      res2= double.parse(input);
                      Provider.of<VoltageCalculator>(context,listen: false).setRes(res2, widget.index);
                    }else if(widget.index==2){
                      Provider.of<VoltageCalculator>(context,listen: false).setInput(_controller.text);
                      res3= double.parse(input);
                      Provider.of<VoltageCalculator>(context,listen: false).setRes(res3, widget.index);
                    }
                    else if(widget.index==3){
                      Provider.of<VoltageCalculator>(context,listen: false).setInput(_controller.text);
                      bat= double.parse(input);
                      Provider.of<VoltageCalculator>(context,listen: false).setRes(bat, widget.index);
                    }

                    setState(() {

                    });

                  });} , child: Text("Save",style: TextStyle(color: Colors.green),)),
                  TextButton(onPressed: (){setState(() {
                    Navigator.pop(context);
                  });} , child: Text("Cancel",style: TextStyle(color: Colors.green))),
                ],
                title: Text("Enter a value",style: TextStyle(fontSize: 16),),
                content: SizedBox(
                  height: 150,
                  child: TextField(

                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    cursorColor: Colors.green,

                    decoration: InputDecoration(

                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green,width: 2)
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
        child:_controller.text.isNotEmpty?
        Text(widget.index==3? "${_controller.text}V" :_controller.text,style: TextStyle(color: Colors.red),): Text(defaultValue,style: TextStyle(color: Colors.red),),
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
