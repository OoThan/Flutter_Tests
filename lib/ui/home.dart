import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_route.dart';
import 'package:flushbar/flushbar_helper.dart';


class ScaffoldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Udemy First Tests'.toUpperCase(),
          style: TextStyle(
            letterSpacing: 4.0,
            fontFamily: 'Times New Roman',
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade600,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.alarm_on), onPressed: () => debugPrint('Alarm is On!'))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // InkWell(
            //   child: Text(
            //     'Hello World',
            //     style: TextStyle(wordSpacing: 2.0, fontSize: 10.0, fontFamily:'Times New Roman', fontWeight: FontWeight.w400),
            //   ),
            //   onTap: _debugPrint,
            // )

            CustomButton()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade600,
        child: Icon(Icons.phone),
        onPressed: () => debugPrint('FloatingAction Button Clicked!'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline), title: Text('Message')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile'))
        ],
        onTap: (int index) => debugPrint('Tapped item : $index'),
        selectedItemColor: Colors.green.shade600,
      ),
    );
  }

  _debugPrint() {
    debugPrint('Tapped Hello World!');
  }
}


class CustomButton extends StatefulWidget {
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                    side: BorderSide(color: Colors.green)
                ),
                color: Colors.white,
                textColor: Colors.green,
                child: Text(
                  'SnackBar'.toUpperCase(),
                  style: TextStyle(
                    letterSpacing: 4.0,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _snackBar(context);
                  });
                },
              ),
              SizedBox(width: 10,),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                    side: BorderSide(color: Colors.green)
                ),
                color: Colors.green,
                textColor: Colors.white,
                child: Text(
                  'Default SnackBar'.toUpperCase(),
                  style: TextStyle(
                      letterSpacing: 4.0,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w500
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _showDefaultSnackBar(context);
                  });
                },
              )
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Default FlushBar'.toUpperCase(),
                  style: TextStyle(
                      letterSpacing: 4.0,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w500
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(color: Colors.green)
                ),
                color: Colors.white,
                textColor: Colors.green,
                onPressed: () {
                  setState(() {
                    _showSimpleFlushBar(context);
                  });
                },
              ),
              SizedBox(width: 10,),
              FlatButton(
                child: Text(
                  'Info FlushBar'.toUpperCase(),
                  style: TextStyle(
                      letterSpacing: 3.0,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w500
                  ),
                ),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    _showInfoFlushBar(context);
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Flushbar Helper'.toUpperCase(),
                  style: TextStyle(
                      letterSpacing: 3.0,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w500
                  ),
                ),
                color: Colors.grey[200],
                textColor: Colors.green,
                shape: StadiumBorder(),
                onPressed: () {
                  setState(() {
                    _showInfoFlushbarHelper(context);
                  });
                },
              ),
              SizedBox(width: 10,),
              FlatButton(
                shape: StadiumBorder(),
                child: Text(
                  'Floating Flushbar'.toUpperCase(),
                  style: TextStyle(
                      letterSpacing: 3.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Times New Roman'
                  ),
                ),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    _showFloatingFlushbar(context);
                  });
                },
              )
            ],
          )

        ],
      ),
    );
  }

  _snackBar(BuildContext context) {
    setState(() {
      final snackBar = SnackBar(content: Text('Simple Snack Bar'));
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  _showDefaultSnackBar(BuildContext context) {
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Hello From the default Snack Bar!'),
          action: SnackBarAction(
            label: 'Click Me!',
            onPressed: () => debugPrint('SnackBar Clicked!'),
          ),
        )
    );
  }

  _showSimpleFlushBar(BuildContext context) {
    Flushbar(
      message: 'Hello from FlushBar',
      mainButton: FlatButton(
        child: Text(
          'Click Me!',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        onPressed: () => debugPrint('Clicked from Flush Bar'),
      ),
      duration: Duration(seconds: 3),
    )..show(context);
  }

  _showInfoFlushBar(BuildContext context) {
    Flushbar(
      title: 'This action is prohibited.',
      message: 'Info Flush Bar',
      icon: Icon(
        Icons.info_outline,
        size: 25,
        color: Colors.green.shade300,
      ),
      leftBarIndicatorColor: Colors.green.shade300,
      duration: Duration(seconds: 3),
      mainButton: FlatButton(
        child: Text(
          'OK',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        onPressed: () {},
      ),
    )..show(context);
  }

  _showInfoFlushbarHelper(BuildContext context) {
    FlushbarHelper.createInformation(
        title: 'This action is prohibited.',
        message: 'Info Flush Bar Helper'
    )..show(context);
  }

  _showFloatingFlushbar(BuildContext context) {
    Flushbar(
      padding: EdgeInsets.all(15),
      borderRadius: 7.5,
      backgroundGradient: LinearGradient(
          colors: [Colors.green.shade600, Colors.greenAccent.shade400],
          stops: [0.6, 1]
      ),
      boxShadows: [
        BoxShadow(
            color: Colors.black45,
            offset: Offset(3, 3),
            blurRadius: 3
        )
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      title: 'This action is prohibited.',
      message: 'Floating Flush Bar',
    )..show(context);
  }

}


