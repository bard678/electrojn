import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColoredResistors extends StatefulWidget {
   ColoredResistors({super.key});

  @override
  State<ColoredResistors> createState() => _ColoredResistorsState();
}

class _ColoredResistorsState extends State<ColoredResistors> {
Color pickerColor=Colors.blue;
Color pickerColor1=Colors.blue;
Color pickerColor2=Colors.blue;
Color pickerColor3=Colors.blue;
Color pickerColor4=Colors.blue;
Color pickerColor5=Colors.blue;

void PickColor(int index){
  showDialog(context: context, builder: (b)=>AlertDialog(
    content:BlockPicker(
      availableColors: [
        Colors.green,
        Colors.blue,
        Colors.purple,
        Colors.red,
        Colors.brown,
        Colors.orange,
        Colors.black,
        Color.lerp(Colors.white, Colors.grey, 0.3)!,
        Colors.grey
      ],

        pickerColor: pickerColor, onColorChanged: (v){setState(() {
   if(index==0){pickerColor=v;}
   else  if(index==1){pickerColor1=v;}
   else  if(index==2){pickerColor2=v;}
   else  if(index==3){pickerColor3=v;}
   else  if(index==4){pickerColor4=v;}
   else  if(index==5){pickerColor5=v;}
    });})
  ));
}

  String brand="l";
  int index=0;
  @override
  Widget build(BuildContext context) {
    List<Widget> brand0 =[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 40,),
          GestureDetector(
              onTap: (){
                PickColor(0);
              },
              child: Container(color: pickerColor,width: 200,height: 100,)),SizedBox(width: 40,),
          GestureDetector(
              onTap: (){
                PickColor(1);
              },
              child: Container(color: pickerColor1,width: 200,height: 100,)),SizedBox(width: 40,),
          GestureDetector(
              onTap: (){
                PickColor(2);
              },
              child: Container(color: pickerColor2,width: 200,height: 100,)),

        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: (){
                PickColor(0);
              },
              child: Container(color: pickerColor,width: 200,height: 100,)),
          GestureDetector(
              onTap: (){
                PickColor(1);
              },
              child: Container(color: pickerColor1,width: 200,height: 100,)),
          GestureDetector(
              onTap: (){
                PickColor(2);
              },
              child: Container(color: pickerColor2,width: 200,height: 100,)),
          GestureDetector(
              onTap: (){
                PickColor(3);
              },
              child: Container(color: pickerColor3,width: 200,height: 100,)),

        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: (){
                PickColor(0);
              },
              child: Container(color: pickerColor,width: 200,height: 100,)),
          GestureDetector(
              onTap: (){
                PickColor(1);
              },
              child: Container(color: pickerColor1,width: 200,height: 100,)),
          GestureDetector(
              onTap: (){
                PickColor(2);
              },
              child: Container(color: pickerColor2,width: 200,height: 100,)),
          GestureDetector(
              onTap: (){
                PickColor(3);
              },
              child: Container(color: pickerColor3,width: 200,height: 100,)),
          GestureDetector(
              onTap: (){
                PickColor(4);
              },
              child: Container(color: pickerColor4,width: 200,height: 100,)),

        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: (){
                PickColor(0);
              },
              child: Container(color: pickerColor,width: 200,height: 100,)),SizedBox(width: 40,),
          GestureDetector(
              onTap: (){
                PickColor(1);
              },
              child: Container(color: pickerColor1,width: 200,height: 100,)),SizedBox(width: 40,),
          GestureDetector(
              onTap: (){
                PickColor(2);
              },
              child: Container(color: pickerColor2,width: 200,height: 100,)),SizedBox(width: 40,),
          GestureDetector(
              onTap: (){
                PickColor(3);
              },
              child: Container(color: pickerColor3,width: 200,height: 100,)),SizedBox(width: 40,),
          GestureDetector(
              onTap: (){
                PickColor(4);
              },
              child: Container(color: pickerColor4,width: 200,height: 100,)),SizedBox(width: 40,),
          GestureDetector(
              onTap: (){
                PickColor(5);
              },
              child: Container(color: pickerColor5,width: 200,height: 100,)),

        ],
      ),


    ];
    return Scaffold(
      appBar: AppBar(
   actions: [
     Padding(
       padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
       child: PopupMenuButton<String>(
       
         shape: const RoundedRectangleBorder(
           borderRadius: BorderRadius.zero
       
         ),
           onSelected: (v){
          setState(() {
            if(v=="3"){
              index=0;
            }
            if(v=="4"){
              index=1;
            }
            if(v=="5"){
              index=2;
            }
            if(v=="6"){
              index=3;
            }
          });


           },
           child: Icon(Icons.more_vert),
           itemBuilder: (item)=>[
             PopupMenuItem(
               value: "3",
               child: SizedBox(
                   width: 100,
                   child: Text("3Brand")),
       
             ),
             PopupMenuItem(
               value: "4",
               child: Text("4Brand"),
       
             ), PopupMenuItem(
               value: "5",
               child: Text("5Brand"),
       
             ),PopupMenuItem(
               value: "6",
               child: Text("6Brand"),
       
             ),
           ]),
     ),
   ],
        backgroundColor: Colors.green,
        title: Text("Resistors calculator",style: TextStyle(fontSize: 20),
      ),),
      body:Column(
        children: [
          SizedBox(height: 200,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
              child: brand0[index]),
        ],
      )
    );
  }
}
