import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualifflutter/details.dart';
import 'package:qualifflutter/home.dart';
import 'package:qualifflutter/login.dart';
import 'package:qualifflutter/merch.dart';

class ItemsPage extends StatefulWidget {
    String username;
  ItemsPage({super.key,required this.username});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
    var merch = merchs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title : const Text('AniMerch')
        ),drawer: Drawer(
        elevation: 0,
        width: 200,
        child : ListView(
            children: [
                Padding(padding: const EdgeInsets.only(top:10.0),
                     child: ListTile(
                        title: const Text("Home"),
                        leading: Image.asset('assets/home.png',height:20,width:20),
                        onTap : (){
                             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                            ((context){
                             return HomePage(username: widget.username);
                            })),(route) => false,);
                        },
                           )

                ),ListTile(

                        title: const Text("Items"),
                        leading: Image.asset('assets/items.png',height:20,width:20),
                        onTap : (){
                             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                            ((context){
                             return ItemsPage(username: widget.username);
                            })),(route) => false,);
                        },

                ), ListTile(
                            title: const Text("Logout"),
                            leading: Image.asset('assets/download.png',height:20),
                            onTap : (){
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                                ((context){
                                return const LoginPage();
                                })),(route) => false,);
                        },
                )
          ]
        ),

      ) ,body:Column(children: [
        Expanded(child: ListView.builder(
          itemCount:merch.length,
          itemBuilder: (context,index){
          return Column(children:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
              title:Text(merch[index].name),
              leading: Image.asset(merch[index].image),
              subtitle:Text("Price: Rp.${merch[index].price}"),
              trailing : ElevatedButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                  return DetailsPage(currMerch:merch[index],username:widget.username);
                  }));
              },
              child: const Text("View Detail"),)
              ),
            )]
            );

        })
        )])

    );
  }
}
