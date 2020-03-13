import 'dart:math' as math;

import 'package:flutter/material.dart';

const double spacing = 0.8;
const double smallScreen = 700;

const Color accent = Color(0xFFb83e64);

class MultipleScreens extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MultipleScreens> with TickerProviderStateMixin {
  bool _isCheckboxChecked = false;
  double _screenHeight;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Raleway'),
      home: Builder(
        builder: (BuildContext context) {
          _screenHeight ??= MediaQuery.of(context).size.height;
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: _isKeyboardDisplayed(context) ? null : _getAppBar(),
            backgroundColor: Color(0xFF9d2b66),
            body: Stack(
              children: <Widget>[
                _getBackgroundGradient(),
                _getMiddleWhiteShape(context),
                _getLoginCircleAndText(context),
                _getInputsAndOkButton(context),
                _isKeyboardDisplayed(context)
                    ? Container()
                    : _getForgotPassAndSignUp()
              ],
            ),
          );
        },
      ),
    );
  }

  Align _getForgotPassAndSignUp() {
    return Align(
      alignment: Alignment.bottomCenter,
      //FORGOT PASS AND SIGN UP
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: 40, vertical: _screenHeight / 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton.icon(
              padding: EdgeInsets.all(0),
              label: Text(
                'Forgot password?',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: spacing,
                ),
              ),
              icon: Icon(
                Icons.vpn_key,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {},
            ),
            Divider(
              height: 1,
              color: Colors.white.withOpacity(0.6),
            ),
            FlatButton.icon(
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.person_add,
                color: Colors.white,
                size: 20,
              ),
              label: Text(
                'Sign up',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: spacing,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Align _getInputsAndOkButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      //MIDDLE ITEMS(INPUTS AND 'OK' BUTTON)
      child: Container(
        height: _isKeyboardDisplayed(context)
            ? (_screenHeight / 20) * 9
            : (_screenHeight / 20) * 10,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _getTextField('Username'),
                  _getTextField('Password'),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 12,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                color: Color(0xFFcf7698),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 20,
                                      spreadRadius: 3)
                                ],
                                shape: BoxShape.circle),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.transparent,
                            ),
                            child: Checkbox(
                              value: _isCheckboxChecked,
                              onChanged: (bool newValue) {
                                setState(() {
                                  _isCheckboxChecked = !_isCheckboxChecked;
                                });
                              },
                              activeColor: Colors.transparent,
                              checkColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Remember this account?',
                        style: TextStyle(
                            color: Colors.white, letterSpacing: spacing),
                      )
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.center,
                height: _screenHeight < smallScreen ? 40 : 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50))),
                child: Icon(
                  Icons.check,
                  color: accent,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align _getLoginCircleAndText(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      //LOGIN CIRCLE AND TEXT
      child: Container(
        height: _isKeyboardDisplayed(context)
            ? (_screenHeight / 20) * 10
            : (_screenHeight / 20) * 12,
        child: Column(
          children: <Widget>[
            Container(
              width: _screenHeight / 10,
              height:
                  _screenHeight < smallScreen && _isKeyboardDisplayed(context)
                      ? _screenHeight / 10
                      : _screenHeight / 9,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: Transform.rotate(
                  angle: 7,
                  child: Icon(
                    Icons.vpn_key,
                    color: accent,
                    size: 30,
                  ),
                ),
              ),
            ),
            _screenHeight < smallScreen || _isKeyboardDisplayed(context)
                ? Container()
                : Transform.rotate(
                    angle: 6.15,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: 'Kaushan',
                          fontSize: 50,
                          height: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Align _getMiddleWhiteShape(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      //MIDDLE WHITE SHAPE
      child: Container(
        height: _isKeyboardDisplayed(context)
            ? (_screenHeight / 20) * 9
            : (_screenHeight / 20) * 10,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            border: Border.all(color: Colors.black.withOpacity(0.05)),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(80),
              bottomLeft: Radius.circular(50),
            )),
      ),
    );
  }

  Container _getBackgroundGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            accent,
            Color(0xFFad2367),
            Colors.deepOrangeAccent,
            Colors.yellow
          ],
        ),
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      title: Text(
        'Login',
        style: TextStyle(
          letterSpacing: spacing,
        ),
      ),
      leading: Icon(
        Icons.keyboard_backspace,
        color: Colors.white,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  bool _isKeyboardDisplayed(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom != 0;

  Widget _getTextField(String hint) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        autofocus: false,
        style: TextStyle(fontSize: 16.0, color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          hintText: hint,
          hintStyle: TextStyle(
              color: Colors.white, fontSize: 16, letterSpacing: spacing),
          contentPadding: const EdgeInsets.only(left: 16.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
