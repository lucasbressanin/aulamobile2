import 'package:flutter/material.dart';

import 'Compra.dart';

class CardDisplay extends StatelessWidget {
  final Compra compra;
  CardDisplay(this.compra);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5, bottom: 5),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network('https://picsum.photos/250?image=9', width: 100),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(this.compra.titulo),
                SizedBox(height: 10.0),
                Text(this.compra.subtitulo),
              ],
            )
          ],
        ),
      ),
    );
  }
}
