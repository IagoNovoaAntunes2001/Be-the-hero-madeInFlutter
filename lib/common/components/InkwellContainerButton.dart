import 'package:flutter/material.dart';

class InkwellWidget extends StatelessWidget {
  final String _title;
  final Function onClick;

  InkwellWidget(this._title, this.onClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              _title,
              style: TextStyle(color: Colors.red[600], fontSize: 16),
            ),
            Icon(
              Icons.navigate_next,
              color: Colors.red[600],
            ),
          ],
        ),
      ),
    );
  }
}
