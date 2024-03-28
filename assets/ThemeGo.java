import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/settings.dart';
import 'package:untitled2/voltage_divider.dart';

void main() {
  runApp(const MyApp());
}

class ThemeGo extends ChangeNotifier{
  ThemeData _themeData=ThemeData.light();
  ThemeData get theme{
    return _themeData;
  }
  void setTheme(ThemeData data){
    _data=data;
   notifyListeners();
  }
}
ThemeData _data=ThemeData.light();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=>ThemeGo() ,
      child: Consumer<ThemeGo>(
       builder: (b,i,c)=> MaterialApp(
         debugShowCheckedModeBanner: false,
         title: 'Flutter Demo',
         theme: _data,
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
  List<String> commonMistak=[
    "Power supply",
    "Audio circuit designing",
    "Battery charger circuit designing",
    "Switch mode inverter"
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
            motion: ScrollMotion(), children: [
          SlidableAction(
              icon: Icons.delete
              ,onPressed: (c){setState(() {
            g.removeAt(i);
          });})
        ]),
        child: Column(
          children: [
            ListTile(
              onTap: (){
              if(i==6)
              {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>VoltageDivider(
                  )));
                });
              }
              },
              title:Text( calculations[i],style: TextStyle(fontSize: 14),),
            ),
            Divider(
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
            motion: ScrollMotion(), children: [
          SlidableAction(
              icon: Icons.delete
              ,onPressed: (c){setState(() {
            g.removeAt(i);
          });})
        ]),
        child: Column(
          children: [
            ListTile(
              title:Text( mostCommon[i],style: TextStyle(fontSize: 14),),
            ),
            Divider(
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
            motion: ScrollMotion(), children: [
          SlidableAction(
              icon: Icons.delete
              ,onPressed: (c){setState(() {
            g.removeAt(i);
          });})
        ]),
        child: Column(
          children: [
            ListTile(
              title:Text( commonMistak[i],style: TextStyle(fontSize: 14),),
            ),
            Divider(height: 2,)
          ],
        ),
      );
    }),
  ListView.builder(
      itemCount:g.length ,
      itemBuilder: (c,i){
        return Slidable(
          startActionPane: ActionPane(
              motion: ScrollMotion(), children: [
            SlidableAction(
                icon: Icons.delete
                ,onPressed: (c){setState(() {
              g.removeAt(i);
            });})
          ]),
          child: ListTile(
            title:Text( "hi1"),
          ),
        );
      }),
  ListView.builder(
      itemCount:g.length ,
      itemBuilder: (c,i){
        return Slidable(
          startActionPane: ActionPane(
              motion: ScrollMotion(), children: [
            SlidableAction(
                icon: Icons.delete
                ,onPressed: (c){setState(() {
              g.removeAt(i);
            });})
          ]),
          child: ListTile(
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
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
          ),
          title: Text("Are you sure you want to exit?",style: TextStyle(color: Colors.grey,fontSize: 18),),
          content: Row(children: [
            Checkbox(
                activeColor: Colors.green,

                value: ask, onChanged: (v){
              setState(() {
              });
              set(() {
                ask=v!;
              });
            }),Text("Don't ask me again"),
          ],),
          actions: [
            TextButton(onPressed: (){}, child: Text("No",style: TextStyle(color: Colors.green),)),
            TextButton(onPressed: (){

            }, child: Text("Yes",style: TextStyle(color: Colors.green),))
          ],
        ); },
    ),

    );
  },
  child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
  leading:  PopupMenuButton<String>(
    onSelected: (v){
      if(v=="s"){
        Navigator.push(context, MaterialPageRoute(builder: (context){return SettingsScreen();}));
      }
      print(v);
    },
    child: Icon(Icons.more_vert),
      itemBuilder: (itemBuilder)=>
  [  PopupMenuItem(
    value: "s",
      child: Text("Settings"),
    ),
  // PopupMenuItem(
  //   value: "s",
  //     child: Text("Settings"),
  //   ),
  PopupMenuItem(
    value: "sh",
      child: Text("Share"),
    ),
  ]
  ),

            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("ElectroJN",textAlign: TextAlign.left,),
              ],
            ),
            bottom: TabBar(
              indicatorColor:Colors.green ,
              dividerColor: Colors.green,
              labelColor: Colors.green,
              onTap: (i){

                setState(() {
                  tap=i;

                  if(tap==4){setState(() {
                    addIcon=true;
                  });}else setState(() {
                    addIcon=false;
                  });
                  print(i);
                  print(calculations.length);
                });
              },
                tabs: [
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
            });}, icon: Icon(Icons.add)):SizedBox()],
          ),
        body:body[tap]
        ),
      ),
);
  }
}