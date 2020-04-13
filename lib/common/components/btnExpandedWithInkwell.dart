import 'package:flutter/material.dart';

class BtnExpandedWithInkwellWidget extends StatelessWidget {
  final Function _onClick;
  final String _title;

  BtnExpandedWithInkwellWidget(this._onClick, this._title);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: _onClick,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.redAccent,
          ),
          child: Center(
            child: Text(
              _title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
