import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualifflutter/items.dart';
import 'package:qualifflutter/login.dart';
import 'package:qualifflutter/theme.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
class HomePage extends StatefulWidget {
String username;
   HomePage({super.key,required this.username,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    var images = ['assets/1.png','assets/2.png','assets/3.png','assets/4.png','assets/5.png','assets/6.png','assets/7.png'];

  @override
  Widget build(BuildContext context) {
    ThemeProvider tp = Provider.of<ThemeProvider>(context,listen:false);
    return Scaffold(
      appBar:AppBar(
        title : const Text("AniMerch"),
        actions: <Widget>[
            PopupMenuButton<ThemeProvider>(
              itemBuilder: (BuildContext context) => <PopupMenuEntry<ThemeProvider>>[
                    PopupMenuItem<ThemeProvider>(
                      child: const Text('Change Theme'),
                      onTap:()=>tp.swapTheme()
                    )
                ]),
        ]
      ),drawer: Drawer(
        elevation: 0,
        width: 200,
        child : ListView(
            children: [
                ListTile(
                    title: Text("Welcome ! ${widget.username}")
                ),
                Padding(padding: const EdgeInsets.only(top:10.0),
                     child: ListTile(
                        title: const Text("Items"),
                        leading: Image.asset('assets/items.png',height:20,width:20),
                        onTap : (){
                             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                            ((context){
                             return ItemsPage(username: widget.username);
                            })),(route) => false,);
                        },
                           )

                ), ListTile(
                            title: const Text("Logout"),
                            leading: Image.asset('assets/download.png',height:20),
                            onTap : (){
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                                ((context){
                                return const LoginPage();
                                })),(route) => false,);
                        },
                ),
          ]
        ),

      ) ,
      body:Column(
          children:[

                Padding(
                  padding: const EdgeInsets.only(left: 20.0 ,right:20.0),
                  child: CarouselSlider(
                      items: images.map((e) => Image.asset(e)).toList(),
                      options:CarouselOptions(height:200,autoPlay : true,reverse:true,autoPlayInterval: const Duration(seconds : 3,))),
                ),
              Padding(padding: const EdgeInsets.only(top:20.0),
                  child:Column(
                      children:const [
                          Text("About Us",style:TextStyle(fontSize: 20.0)),
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text("We are a shop that sells many merchandise based on animes, manhwas, manhuas, and mangas. The merchandise that we sold are all original merchandise !",style:TextStyle(fontSize: 16.0),textAlign:TextAlign.center,),
                          )
                      ]
                  )
              )
          ]

          )
    );
  }
}
