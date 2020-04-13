import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: CircularProgressIndicator(
            strokeWidth: 4.5,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            backgroundColor: Colors.grey,
          ),
        ),
        SizedBox(height: 20,),
        Text("Carregando...", style: TextStyle(color: Colors.black87, fontSize: 18.0, fontWeight: FontWeight.bold),),
      ],
    );
  }
}
