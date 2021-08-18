import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void openWhatsapp(int phone) async {
    String url() {
      if (Platform.isAndroid) {
        return "https://wa.me/$phone";
      } else {
        return "https://api.whatsapp.com/send?phone=$phone";
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final maxSize = max(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    final minSize = min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Roboto'
          ),
        ),
      ),
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: [
                Container(
                  color: Colors.red,
                  height: maxSize/5,
                ),
                SizedBox(
                  height: minSize/4,
                ),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Ferdinand Wijaya S',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 28,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                ),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Perguruan Tinggi:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                        ),
                      ),
                    )
                ),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        'Universitas Gadjah Mada',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                ),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Program Studi:',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20
                        ),
                      ),
                    )
                ),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        'Teknologi Informasi 2018',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  icon: Icon(
                    Icons.chat_rounded,
                  ),
                  label: Text(
                    "Open Whatsapp",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18
                    ),
                  ),
                  onPressed: () {
                    openWhatsapp(6281225223939);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0)
                    ),
                  ),
                )
              ],
            ),
            Positioned(
                top: maxSize/5-minSize/4,
                child: CircleAvatar(
                  radius: minSize/4,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: minSize/4-8,
                    backgroundImage: AssetImage('images/profile.jpg'),
                  ),
                )
            )
          ]
        ),
      ),
    );
  }
}
