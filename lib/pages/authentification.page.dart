import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthentificationPage extends StatelessWidget {
  late SharedPreferences prefs;
   TextEditingController txt_login= new TextEditingController();
  TextEditingController txt_password= new TextEditingController();
 // const AuthentificationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( backgroundColor: Colors.lightGreen,
          title: Text('Page Authentification'),
       ),
       body: Column(
        children : [
          Container(
            padding: EdgeInsets.all(10) ,
            child: TextFormField(
              controller: txt_login ,
              decoration: InputDecoration(
                prefixIcon: Icon (Icons.person),
                hintText: "utilisateur",
                border: OutlineInputBorder(borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.circular(10))),
                ),
                ),
                Container(
                   padding: EdgeInsets.all(10) ,
            child: TextFormField(
              obscureText: true,
              controller: txt_password ,
              decoration: InputDecoration(
                prefixIcon: Icon (Icons.password),
                hintText: "mot de passe",
                border: OutlineInputBorder(borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.circular(10))),
                ),
                ),
               Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(244, 139, 195, 74),
                      minimumSize: const Size.fromHeight(50)
                    ),
                    onPressed: (){
                      _onAuthentifier(context);
                    },
                    child: Text('Connexion', style: TextStyle(fontSize: 22))),
               ),
               TextButton(
                child: Text("Nouvel utilisateur",
                style: TextStyle(fontSize: 22),),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/inscription');
                },
                 )
        ], ));
    
  }
  
  Future <void> _onAuthentifier(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    String log = prefs.getString("login") ?? '';
     String psw = prefs.getString("password") ?? '';
     print(txt_password.text);
     if (txt_login.text == log && txt_password.text == psw){
      prefs.setBool("connecte", true);
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
     }
     else {
      const snackBar= SnackBar(
        content: Text('verifier votre id et mot de passe'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}