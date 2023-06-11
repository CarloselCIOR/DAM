import 'package:flutter/material.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  State<MenuLateral> createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("U3 Ejercicio 1"),),
      body: ListView(
        padding: EdgeInsets.all(40),
        children: [
          Text("Contenido", style: TextStyle(fontSize: 30, color: Colors.amber),),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                child: Column(
                  children:[
                    CircleAvatar(
                      child: Image.network("https://www.tepic.tecnm.mx/images/escudo_itt_grande.png",),
                      radius: 45,
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(height: 10,),
                    Text("Carlos Orozco", style: TextStyle(color: Colors.black, fontSize: 20),),
                  ]
                ),
              decoration: BoxDecoration(color: Colors.amber),
            ),

            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(child: Icon(Icons.ad_units)),
                    Expanded(child: Text("Tu número Celular"), flex:3)
                  ],
                ),
              )
            ),

            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(child: Icon(Icons.access_alarm)),
                    Expanded(child: Text("Alarmas"), flex: 3)
                  ],
                ),
              ),
            ),

            Divider(color: Colors.black12,),

            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(child: Icon(Icons.account_balance_sharp)),
                      Expanded(child: Text("Cuenta"), flex: 3,)
                    ],
                  ),
                ),
            ),

            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(child: Icon(Icons.add_chart_sharp)),
                      Expanded(child: Text("Estadisticas"), flex: 3,)
                    ],
                  ),
                ),
            ),

            InkWell(
              onTap: (){},
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(child: Icon(Icons.add_card)),
                    Expanded(child: Text("Tarjeta"), flex: 3,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
