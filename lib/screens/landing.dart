import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landing'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

            RaisedButton(
              color: Colors.blue,
              child: Text('Sign In'),
              onPressed: () {
                //Navigate to Screen 2
                Navigator.pushNamed(context, '/for_you');
              },
            ),
          ],
        ),
      ),
    );
  }
}
