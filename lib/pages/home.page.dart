import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget{
  late SharedPreferences prefs;
 // const HomePage({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.lightGreen,
        title: Text('Page Home')),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text( 'Welcome', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 50),),),
              Lottie.network(
                  'https://assets6.lottiefiles.com/packages/lf20_BqybPSU3Q6.json',
                height: 200.0,
                repeat: true,
                reverse: true,
                animate: true,
              ),
              
              Container(
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                   primary: Color.fromARGB(244, 139, 195, 74),
                minimumSize: const Size.fromHeight(50)),
                onPressed: (){
                   _Deconnexion(context);
                  },
            
            child: Text('Déconnexion', style: TextStyle(fontSize: 22))), 
              )
          ],
        ),
             
           ) );
    
  }
  
  Future <void> _Deconnexion(context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", false);
    Navigator.pop(context);
    Navigator.pushNamed(context, '/authentification');
  }
}
