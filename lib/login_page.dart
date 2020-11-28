import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync:this,
        duration: new Duration(milliseconds: 500)
    );
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeOut
    );
    _iconAnimation.addListener(() => this.setState(() { }));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand,   //Fotoğrafı tüm ekrana sığdırır.
        children: <Widget>[
          new Image(
              image: new AssetImage("assets/landsape.jpg"),
              fit: BoxFit.cover,
              color: Colors.black45,
              colorBlendMode: BlendMode.darken,   // Ekranı karartmaya yarar
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(size: _iconAnimation.value * 100),

              new Form(
                child: new Theme(
                  data: ThemeData(
                    brightness: Brightness.dark, primarySwatch: Colors.teal, inputDecorationTheme: new InputDecorationTheme(
                    labelStyle: new TextStyle(
                      color: Colors.teal,
                      fontSize: 20.0
                    )
                  )
                  ),
                  child: new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Enter e-mail"
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Enter password"
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),

                      ],
                    ),
                  ),
                )
              ),

              new MaterialButton(
                minWidth: 100.0,
                color: Colors.teal,
                textColor: Colors.white,
                child: new Text("Login"),
                onPressed: () => null,
                splashColor: Colors.red,
              )
            ],
          )
        ],
      ),
    );
  }
}