import 'dart:async';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigatopnPage);
  }

  void navigatopnPage() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              'images/pokeball.png',
              width: 200,
            ),
          ),
          Stack(
            children: <Widget>[
              // Stroked text as border.
              Text(
                'Pokédex',
                style: TextStyle(
                  fontSize: 80,
                  fontFamily: 'PokemonSolid',
                  color: Color(0xFFFFDE00),
                ),
              ),
              Text(
                'Pokédex',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PokemonHollow',
                  color: Color(0xFF3B4CCA),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}