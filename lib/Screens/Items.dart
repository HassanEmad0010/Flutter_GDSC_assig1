


import 'package:flutter/material.dart';

class ItemClass extends StatefulWidget {
  @override
  State<ItemClass> createState() => _ItemClassState();
}

class _ItemClassState extends State<ItemClass> {

  int pressedValue=1;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey,
     appBar: AppBar(
       backgroundColor: Colors.grey,
       title: Text("Flutter Mapp"),
       centerTitle: true,
     ),
     body:
         Column
           (
           children: [
             IconButton(onPressed: (){
               pressedValue++;
               print("value pressed= $pressedValue");
               setState(() {
               });
             },
                 icon: Icon(Icons.add,color: Colors.white,size: 35,)),

            Expanded(
              child:
              ListView.separated(separatorBuilder:(context,ind)=> const SizedBox(height: 1,),

                itemCount: pressedValue,

                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: ListTile(


                      tileColor: Colors.amber,
                      textColor: Colors.white,
                      trailing: IconButton(onPressed: (){
                        print("deleted $index");
                        pressedValue--;
                        setState(() {

                        });
                      },

                          iconSize: 40,
                          icon:Icon( Icons.delete,color: Colors.white,)),
                      title:  Text("Item $index",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                    ),
                  );
                },
              ),
            )

           ],
         )




   );


  }
}