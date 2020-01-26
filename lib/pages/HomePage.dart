import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.bottomLeft,
              image: AssetImage("assets/sow-mandala-part.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 32,
              ),
              Container(
                // padding: EdgeInsets.all(16),
                // width: MediaQuery.of(context).size.width - 16,
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Kacheri",
                          textScaleFactor: 4,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.deepOrange),
                        )),
                    // IconButton(
                    //   icon: Icon(Icons.search),
                    //   onPressed: () {},
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 64,
              ),
              Card(
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, '/all-songs'),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width - 16,
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.library_music,
                            color: Colors.deepOrange,
                            size: 64,
                          ),
                        ),
                        Text("By Song"),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.people_outline,
                              color: Colors.deepOrange,
                              size: 64,
                            ),
                          ),
                          Text("By Artist"),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.music_note,
                              color: Colors.deepOrange,
                              size: 64,
                            ),
                          ),
                          Text("By Raga"),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
