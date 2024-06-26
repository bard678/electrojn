import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/coloredresistors.dart';
import 'package:untitled2/settings.dart';
import 'package:untitled2/voltage.dart';
import 'package:untitled2/voltage_divider.dart';

void main() {
  runApp(MyApp());
}

class ThemeGo extends ChangeNotifier{
  final ThemeData _themeData=ThemeData.light();
  ThemeData get theme{
    return _themeData;
  }
  void setTheme(ThemeData data){
    _data=data;
    notifyListeners();
  }
}
ThemeData _data=ThemeData.light();
class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Color screenPickerColor;

  // Color for the picker in a dialog using onChanged.
  late Color dialogPickerColor;

  // Color for picker using the color select dialog.
  late Color dialogSelectColor;
  @override
  void initState() {
    super.initState;
    screenPickerColor = Colors.blue;  // Material blue.
    dialogPickerColor = Colors.red;   // Material red.
    dialogSelectColor = const Color(0xFFA239CA); // A purple color.
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=>ThemeGo() ,
      child: Consumer<ThemeGo>(
        builder: (b,i,c)=> MaterialApp(
          color: Colors.black,
          theme: _data,
          debugShowCheckedModeBanner: false,
          title: 'ElectroJN',

          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> calculations=[
    "JPT transistor",
    "Colored resistors",
    "SMD resistors ",
    "Step up converter calculations",
    "Step down converter calculations",
    "Op amp calculations",
    "Voltage divider"


  ];
  List<String> g=["a"];
  bool ask=false;
  List<String> mostCommon=[
    "Flasher circuit",
    "Step up converter",
    "Step down converter",
    "SEPIC converter",
    "Simple audio amplifier",
    "Tl494 circuit"
  ];
  List<String> mostCircuit=[
    "assets/flasher.jpg",
    "assets/flasher.jpg",
    "assets/flasher.jpg",
    "assets/flasher.jpg",
    "assets/flasher.jpg",
    "assets/flasher.jpg",

  ];
  List<String> commonMistak=[
    "Power supply",
    "Audio circuit designing",
    "Battery charger circuit designing",
    "Switch mode inverter"
  ];
  List<String> images=[
    "assets/transistor.PNG",
    "assets/resistor.PNG",
    "assets/smdres.PNG",
    "assets/img.png",
    "assets/stepdown.PNG",
    "assets/opamp.PNG",
    "assets/voltage.PNG",


  ];
  int tap=0;
  bool addIcon=false;
  @override
  Widget build(BuildContext context) {

    List<Widget> body=[
      ListView.builder(
          shrinkWrap: true,
          itemCount:calculations.length ,
          itemBuilder: (c,i){
            return Slidable(
              startActionPane: ActionPane(
                  motion: const ScrollMotion(), children: [
                SlidableAction(
                    icon: Icons.delete
                    ,onPressed: (c){setState(() {
                  g.removeAt(i);
                });})
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                 leading:SizedBox(
                   width: 40,
                     height: 50,
                     child: Image.asset(images[i],scale: 1,)),
                    onTap: (){
                      if(i==6)
                      {
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>const VoltageDivider(
                          )));
                        });
                      }
                      if(i==2)
                      {
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=> VoltageDiv(
                              data:_data
                          )));
                        });
                      }
                      if(i==1)
                      {
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=> ColoredResistors(

                          )));
                        });
                      }
                    },
                    title:Text( calculations[i],style: const TextStyle(fontSize: 14),),
                  ),
                  const Divider(
                    height: 2,
                  )
                ],
              ),
            );
          }),
      ListView.builder(
          itemCount:mostCommon.length ,
          itemBuilder: (c,i){
            return Slidable(
              startActionPane: ActionPane(
                  motion: const ScrollMotion(), children: [
                SlidableAction(
                    icon: Icons.delete
                    ,onPressed: (c){setState(() {
                  g.removeAt(i);
                });})
              ]),
              child: Column(
                children: [
                  ListTile(
                    leading: SizedBox(
                      width: 40,height: 50,child: Image.asset(mostCircuit[i]),
                    ),
                    title:Text( mostCommon[i],style: const TextStyle(fontSize: 14),),
                  ),
                  const Divider(
                    height: 2,
                  )
                ],
              ),
            );
          }),
      ListView.builder(
          itemCount:commonMistak.length ,
          itemBuilder: (c,i){
            return Slidable(
              startActionPane: ActionPane(
                  motion: const ScrollMotion(), children: [
                SlidableAction(
                    icon: Icons.delete
                    ,onPressed: (c){setState(() {
                  g.removeAt(i);
                });})
              ]),
              child: Column(
                children: [
                  ListTile(
                    title:Text( commonMistak[i],style: const TextStyle(fontSize: 14),),
                  ),
                  const Divider(height: 2,)
                ],
              ),
            );
          }),
      ListView.builder(
          itemCount:g.length ,
          itemBuilder: (c,i){
            return Slidable(
              startActionPane: ActionPane(
                  motion: const ScrollMotion(), children: [
                SlidableAction(
                    icon: Icons.delete
                    ,onPressed: (c){setState(() {
                  g.removeAt(i);
                });})
              ]),
              child: const ListTile(
                title:Text( "hi1"),
              ),
            );
          }),
      ListView.builder(
          itemCount:g.length ,
          itemBuilder: (c,i){
            return Slidable(
              startActionPane: ActionPane(
                  motion: const ScrollMotion(), children: [
                SlidableAction(
                    icon: Icons.delete
                    ,onPressed: (c){setState(() {
                  g.removeAt(i);
                });})
              ]),
              child: const ListTile(
                title:Text( "hi1"),
              ),
            );
          }),
    ] ;
    return WillPopScope(
      onWillPop: ()async{

        return await showDialog(context: context, builder: (builder)=>StatefulBuilder(
          builder: (BuildContext context,set) {
            return  AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
              ),
              title: const Text("Are you sure you want to exit?",style: TextStyle(color: Colors.grey,fontSize: 18),),
              content: Row(children: [
                Checkbox(
                    activeColor: Colors.green,

                    value: ask, onChanged: (v){
                  setState(() {
                  });
                  set(() {
                    ask=v!;
                  });
                }),const Text("Don't ask me again"),
              ],),
              actions: [
                TextButton(onPressed: (){  Navigator.pop(context);}, child:  const Text("No",style: TextStyle(color: Colors.green),)),
                TextButton(onPressed: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                }, child: const Text("Yes",style: TextStyle(color: Colors.green),))
              ],
            ); },
        ),

        );
      },
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              leading:  PopupMenuButton<String>(
                  onSelected: (v){
                    if(v=="s"){
                      Navigator.push(context, MaterialPageRoute(builder: (context){return const SettingsScreen();}));
                    }
                    print(v);
                  },
                  child: const Icon(Icons.more_vert,color: Colors.black87,),
                  itemBuilder: (itemBuilder)=>
                  [  const PopupMenuItem(
                    value: "s",
                    child: Text("Settings"),
                  ),
                    // PopupMenuItem(
                    //   value: "s",
                    //     child: Text("Settings"),
                    //   ),
                    const PopupMenuItem(
                      value: "sh",
                      child: Text("Share"),
                    ),
                  ]
              ),

              title: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("ElectroJN",textAlign: TextAlign.left,style: TextStyle(color: Colors.black87),),
                ],
              ),
              bottom: TabBar(
                unselectedLabelColor: Color.lerp(Colors.grey, Colors.black, 0.7),
                  isScrollable: true,
                  indicatorColor:Colors.green ,
                  dividerColor: Colors.green,
                  labelColor: Colors.black87,

                  onTap: (i){

                    setState(() {
                      tap=i;

                      if(tap==4){setState(() {
                        addIcon=true;
                      });}else {
                        setState(() {
                          addIcon=false;
                        });
                      }
                      print(i);
                      print(calculations.length);
                    });
                  },
                  tabs: const [
                    Tab(text: "Calculations",),
                    Tab(text: "Most common circuits",),
                    Tab(text: "Most common mistakes",),
                    Tab(text: "Tricks",),
                    Tab(text: "Notes",),
                  ]



              ),
              actions: [
                addIcon==true?IconButton(onPressed: (){setState(() {
                  g.add("a$_counter");
                  ++_counter;
                });}, icon: const Icon(Icons.add,color: Colors.black87,)):const SizedBox()],
            ),
            body:body[tap]
        ),
      ),
    );
  }
}
