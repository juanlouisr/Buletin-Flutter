import 'package:flutter/material.dart';
import 'package:buletin/widgets/channel.dart';
import 'package:buletin/widgets/player.dart';

class VideoPlayer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final column1 = widthScreen / 10 * 6.5;
    return Container(
      width: column1,
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Player(),
          Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: Text(
              'Narasi Newsroom',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
            child: Text(
              'Ide Provinsi Sunda Raya (Jawa Barat, Jakarta, Banten) dan KontroversinyaIde Provinsi Sunda Raya (Jawa Barat, Jakarta, Banten) dan Kontroversinya',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Divider(),
          Channel(),
          Container(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              'Aturan baru Pembayaran Manfaat Jaminan Hari Tua (JHT) yang dikeluarkan pemerintah menuai polemik. Pasalnya, dalam aturan itu, pekerja tidak bisa mencairkan JHT langsung setelah kena PHK atau mengundurkan diri dari pekerjaan mereka. Namun pekerja baru bisa menikmati JHT mereka setelah berusia 56 tahun',
              style: TextStyle(
                fontSize: 16
              )
            ),
          )
        ],
      ),
    );
  }

}