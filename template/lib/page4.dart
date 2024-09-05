import 'package:flutter/material.dart';


class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
   
      
      appBar: AppBar(

        
        
        backgroundColor: Colors.green[900],
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(10.0),
        

          child: Icon(Icons.grass, color: Colors.orangeAccent,),
           // Example icon for the app's logo
        ),
      ),    
      body: Container(
        color: Colors.green[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Location',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Bilzen, Tanjungbalai',
              style: TextStyle(fontSize: 20, color: Colors.green[900]),
            ),
            const SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.white,
              child: const Center(
                child: Text(
                  'Preview',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    

                    onPressed: () {
                      // Add your upload picture function here
                    },
                    icon: const Icon(Icons.upload,color: Colors.white,),
                    label: const Text('Upload Picture',style: TextStyle( color: Colors.white,)),
                    style: ElevatedButton.styleFrom(
                      
                      backgroundColor:Color(0xFF024206),
                      minimumSize: Size(double.infinity, 50), 
                      // Full width button
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your take a picture function here
                    },
                    icon: const Icon(Icons.camera_alt, color: Colors.white,),
                    label: const  Text('Take A Picture',style: TextStyle( color: Colors.white,)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Color(0xFF024206),

                    minimumSize: const Size(double.infinity, 50), // Full width button
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
