import 'package:flutter/material.dart';


class NameCard extends StatelessWidget {
  const NameCard({
    super.key,
    required this.myText,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final String myText;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child:Column(children: [
          Image.asset(
            "assets/crop.jpg",
            width:500,
            height:100,
            
    
    
          ),
          const SizedBox(
            height:20,
            ),
            Text(myText, style: TextStyle(fontSize: 20,),
    
            ),
            const SizedBox(
              height:50,
            ),
             Padding(padding:const EdgeInsets.all(30),
              child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText:"Enter new name: ",
                labelText:"Name",
                border:OutlineInputBorder(),
    
    
              ),
              ),
    
            ),
           
    
        ],)
    
    
      ),
    );
  }
}
