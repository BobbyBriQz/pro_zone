
import 'package:flutter/material.dart';


class UpdateProvider extends StatefulWidget {
  @override
  _UpdateProviderState createState() => _UpdateProviderState();
}

class _UpdateProviderState extends State<UpdateProvider> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 12,
              color: Colors.green,

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("I have a job as a Software Engineer and I have had so much work on my plate of late. \n"
                    "\nI wrote the bulk of the code during the weekend but couldn't find time to complete it."
                    "\n\nThanks for the opportunity. \nCheers :D",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.blue,
                        blurRadius: 10.0,
                        offset: Offset(5.0, 5.0),
                      ),
                      Shadow(
                        color: Colors.red,
                        blurRadius: 10.0,
                        offset: Offset(-5.0, 5.0),
                      ),
                    ],
                  ),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
