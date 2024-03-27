

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/main.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  List<String> title=["Confirmation on exit","Change language","Change theme"];
  List<String> supTitle=["Asking before exiting","Choose your own language","customise theme"];
List<IconData> icons=[Icons.exit_to_app,Icons.language,Icons.room_preferences_outlined];
  int radio=0;
  bool checked=false;
  bool ask=false;
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        // backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child:

           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("Application preferences",style: TextStyle(color: Colors.green),),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height-AppBar().preferredSize.height-40,
                child: ListView.builder(itemCount: title.length,itemBuilder: (context,i){

                  return Column(
                    children: [
                      ListTile(
                        trailing:i==0? Checkbox(
                          activeColor: Colors.green,
                            value: checked, onChanged: (v){setState(() {
                          checked=v!;
                            });}):const SizedBox(),
                        onTap: (){
                        if(i==2){
                          showDialog(context: context, builder: (builder)=>StatefulBuilder(
                            builder: (c,set){return
                              AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero
                                ),
                                title: const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Choose theme"),
                                  ],
                                ),content: SizedBox(
                                height: 100,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        Radio(
                                          activeColor: Colors.green,
                                          value: 0, groupValue: radio, onChanged: (v){
                                          set(() {
                                            Provider.of<ThemeGo>(context,listen: false).setTheme(ThemeData.light());
                                            radio=v as int;
                                          });
                                        }
                                          ,
                                        ),
                                        const SizedBox(width: 20,),  const Text('Light'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        Radio(
                                          focusColor: Colors.green,
                                          activeColor: Colors.green,
                                          value: 1, groupValue: radio, onChanged: (v){set(() {
                                          Provider.of<ThemeGo>(c,listen: false).setTheme(ThemeData.dark());
                                          radio=v as int;
                                        } );}
                                          ,
                                        ) ,
                                        const SizedBox(width: 20,),
                                        const Text('Dark'),

                                      ],
                                    ),
                                  ],
                                ),
                              ),);},

                          ));
                        }

                        },
                      leading: Icon(icons[i]),
                        title: Text(title[i]),subtitle: Text(supTitle[i]),),
                      const Divider(
                        height: 2,
                      )
                    ],
                  );
                }),
              )
            ],

        ),
      ),
    );
  }
}
