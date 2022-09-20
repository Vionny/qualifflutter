

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualifflutter/comments.dart';
import 'package:qualifflutter/merch.dart';

// ignore: must_be_immutable
class DetailsPage extends StatelessWidget {
  Merch currMerch;
  String username;
  DetailsPage({super.key,required this.currMerch,required this.username});

  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
      child: Scaffold(
        appBar : AppBar(
          title: const Text("AniMerch"),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.details)),
            Tab(icon: Icon(Icons.comment)),
          ])
          ),
        body: TabBarView(children: [
            Container(
            child:Column(children: [
                Column(children:[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(currMerch.name,style:const TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Price: Rp.${currMerch.price}",style:const TextStyle(fontSize: 16)),
                ),
                Image.asset(currMerch.image),
                TextField(
                    controller : commentController,
                    decoration: const InputDecoration(hintText : "Input Comment"),
                ), ElevatedButton(onPressed:()=>{
                    if(commentController.text != ''){
                    currMerch.comments.add(Comment(username:username,comment:commentController.text)),
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                        return DetailsPage(currMerch: currMerch, username: username);
                    },))
                    }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Comment cannot be empty"),
                            ),
                            )
                    }

                }, child: const Text("Add Comment"))
                ]
            )])
            ),Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                    Expanded(child: ListView.builder(
                    itemCount:currMerch.comments.length,
                    itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Column(children:[
                          Text("Username : ${currMerch.comments[index].username}"),
                         Text(currMerch.comments[index].comment),

                      ]),
                    );
                })
            )])

            )
            ]
        ),

    ));
  }
}
