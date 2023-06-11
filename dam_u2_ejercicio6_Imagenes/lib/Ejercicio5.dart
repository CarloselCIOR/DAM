import 'package:flutter/material.dart';

class Ejercicio5 extends StatefulWidget {
  const Ejercicio5({Key? key}) : super(key: key);

  @override
  State<Ejercicio5> createState() => _Ejercicio5State();
}

class _Ejercicio5State extends State<Ejercicio5> {
  List<String> ruta = ["lib/img/facebook.png",
                        "lib/img/amazon.png",
                        "lib/img/instagram.png",
                        "lib/img/tiktok.png",
                        "lib/img/whatsapp.png",
                        "lib/img/youtube.png"];
  int posicion = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aplicacion 6"),),
      body: Center(
        child: ListView(
          children: [
            SizedBox(height: 100,),
            Image.asset(ruta[posicion], width: 100, height: 100,),

            SizedBox(height: 200,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                ElevatedButton(onPressed: (){
                  setState((){
                    if(posicion>0) {
                      posicion--;
                    }else{
                      posicion=5;
                    }
                  });
                }, child: Text("Anterior")),
                SizedBox(width: 60,),
                ElevatedButton(onPressed: (){
                  setState((){
                    if(posicion<5) {
                      posicion++;
                    }else{
                      posicion=0;
                    }
                  });
                }, child: Text("Siguiente")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
