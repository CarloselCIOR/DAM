import 'package:flutter/material.dart';

class Ejercicio3 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Ejercicio3();
  }
}

class _Ejercicio3 extends State<Ejercicio3>{
  final num1 = TextEditingController();
  final num2 = TextEditingController();
  var resultadoResta="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.recycling))
        ],
        title: const Text("Ejercicio 3"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            "Operaciones",
            style: TextStyle(
              fontSize: 35,
              color: Colors.red,
            ),
          ),

          SizedBox(height: 50,),
          Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              controller: num1,
              decoration: InputDecoration(
                labelText: "Valor 1",
                border: OutlineInputBorder()
              ),
            ),
          ),

          SizedBox(height: 50,),
          Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                controller: num2,
                decoration: InputDecoration(
                  labelText: "Valor 2",
                ),
              ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: (){
                suma(num1.text, num2.text);
              }, child: Text("SUMA")),

              SizedBox(width: 50,),
              OutlinedButton(onPressed: (){
                int n1 = int.parse(num1.text);
                int n2 = int.parse(num2.text);
                var b = "";
                //n1-=n2;
                for(int i = 1; i <= 10; i++){
                  b += "${n1} x ${i} = ${i*n1} \n";
                }

                setState(() {
                  resultadoResta = "${b}";
                });
              }, child: Text("RESTA"))
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: (){
                multiplicacion(num1.text, num2.text);

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Resultado: ")));
              }, child: Text("MULTIPLICACION")),

              SizedBox(width: 50,),
              OutlinedButton(onPressed: (){
                division(num1.text, num2.text);

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Resultado: ")));
              }, child: Text("DIVISION"))
            ],
          ),

         SizedBox(height: 20,),
         Text("${resultadoResta}", style: TextStyle(fontSize: 30, color: Colors.blue),)
        ], //Children columns
      ),
    );
  }

  //valor de retorno, identificador (parametro){}
  void suma(String text, String text2) {
    int n1 = int.parse(text);
    int n2 = int.parse(text2);
    int resultado = n1 + n2;

    //Mensaje ALERT DIALOG
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("RESULTADO"),
        content: Text("La suma es ${resultado}"),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("Ok"))
        ],
      );
    });
  }//METODO

  void multiplicacion(String text, String text2) {
    int n1 = int.parse(text);
    int n2 = int.parse(text2);
    int resultado = n1 * n2;

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Resultado multiplicacion: ${resultado}")));
  }//METODO

  void division(String text, String text2) {
    int n1 = int.parse(text);
    int n2 = int.parse(text2);
    double resultado = n1 / n2;

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Resultado division: ${resultado}")));
  }//METODO
}