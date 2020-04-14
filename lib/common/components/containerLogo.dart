import 'package:flutter/material.dart';

class ContainerLogoWidget extends StatelessWidget {
  String _pathImage;

  ContainerLogoWidget(this._pathImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      width: MediaQuery.of(context).size.width * 0.30,
      child: Image.asset(
        _pathImage,
        fit: BoxFit.none,
      ),
    );
  }
}
