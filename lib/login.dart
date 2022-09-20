import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualifflutter/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
var image = 'assets/logo.png';

    void handleLogin(){
        String username = usernameController.text;
        String password = passwordController.text;
        if(username== '' || password== ''){
            showDialog(context: context, builder: (context) {
                return AlertDialog(
                title: const Text("Error"),
                content: const Text("All Fields must be filled !"),
                actions: [
                    TextButton(onPressed: () {
                    Navigator.pop(context);
                    }, child: const Text("OK"))
                ],
                );
            });
            return;
        }
        else if (username.length < 3) {
            showDialog(context: context, builder: (context) {
                return AlertDialog(
                title: const Text("Error"),
                content: const Text("Username must be more than 3 chars"),
                actions: [
                    TextButton(onPressed: () {
                    Navigator.pop(context);
                    }, child: const Text("OK"))
                ],
                );
            });
            return;
        }
        else if(!password.contains(RegExp(r'[0-9]'))){
            showDialog(context: context, builder: (context) {
                return AlertDialog(
                title: const Text("Error"),
                content: const Text("Password must contains number!"),
                actions: [
                    TextButton(onPressed: () {
                    Navigator.pop(context);
                    }, child: const Text("OK"))
                ],
                );
            });
            return;
        }
        Navigator.push(context,MaterialPageRoute(builder: (context){
            return HomePage(username: usernameController.text);
        },));
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context){
            return HomePage(username: usernameController.text);
        }), (route) => false);
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('AniMerch'),),
        body:SingleChildScrollView(
            child:Container(
                padding:const EdgeInsets.all(25.0),
                child: Column(children: [
                    Image.asset(image,width: 200, height: 200,),
                    const Padding(
                      padding: EdgeInsets.only(top:15.0),
                      child: Text("Username : ",textAlign: TextAlign.start,style:TextStyle(fontSize: 16.0)),
                    ),
                    TextField(
                        controller: usernameController,
                        decoration : const InputDecoration(hintText: "Username")
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top:15.0),
                      child: Text("Password : ",textAlign: TextAlign.start,style:TextStyle(fontSize: 16.0)),
                    ),
                    TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(hintText: "Password"),
                        obscureText: true,
                    ),
                    Padding(
                      padding:const EdgeInsets.only(top:30.0),
                      child: ElevatedButton(onPressed:handleLogin, child: const Text("Login")),
                    )
                ],
                )
            )
        )

    );
  }
}
