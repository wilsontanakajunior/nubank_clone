import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubank_app_clone/pages/home/widgets/my_app_bar.dart';
import 'package:nubank_app_clone/pages/home/widgets/my_dots_app.dart';
import 'package:nubank_app_clone/pages/home/widgets/page_view_app.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  bool _showmenu = false;
  int _currentIndex = 0;
  double _yPosition = 0;

  @override
  void initState() {
    super.initState();
    _showmenu = false;
    _yPosition = 0;
  }

  Widget build(BuildContext context) {
    double _screenHeigth = MediaQuery.of(context).size.height;
    if (_yPosition == 0) {
      _yPosition = _screenHeigth * .24;
    }

    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyAppBar(
            showMenu: _showmenu,
            onTap: () {
              setState(() {
                _showmenu = !_showmenu;
                _yPosition =
                    _showmenu ? _screenHeigth * .75 : _screenHeigth * .24;
              });
            },
          ),
          PageViewApp(
            showMenu: _showmenu,
            top:
                _yPosition, // !_showmenu ? _screenHeigth * .24 : _screenHeigth * .75,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdate: (details) {
              double positionBottomLimit = _screenHeigth * .75;
              double positionTopLimit = _screenHeigth * .24;
              double midlePosition =
                  (positionBottomLimit - positionTopLimit) / 2;

              setState(() {
                _yPosition += details.delta.dy;

                _yPosition = _yPosition < positionTopLimit
                    ? positionTopLimit
                    : _yPosition;

                _yPosition = _yPosition > positionBottomLimit
                    ? positionBottomLimit
                    : _yPosition;

                if (_yPosition != positionBottomLimit && details.delta.dy > 0) {
                  _yPosition =
                      _yPosition > positionTopLimit + midlePosition - 50
                          ? positionBottomLimit
                          : _yPosition;
                }
                if (_yPosition != positionTopLimit && details.delta.dy < 0) {
                  _yPosition = _yPosition < positionBottomLimit - midlePosition
                      ? positionTopLimit
                      : _yPosition;
                }

                if (_yPosition == positionBottomLimit) {
                  _showmenu = true;
                } else if (_yPosition == positionTopLimit) {
                  _showmenu = false;
                }
              });
            },
          ),
          MyDotApp(
            top: _screenHeigth * .70,
            currentIndex: _currentIndex,
          )
        ],
      ),
    );
  }
}
