import 'package:flutter/material.dart';
import 'package:whatsapp_ui/profilePage/profile_page.dart';

import '../jsonFetch/name_json.dart';
import '../jsonFetch/photos_json.dart';

class ChatPage extends StatefulWidget {
  final Name namedata;
  final Photos photosdata;

  const ChatPage({Key key, this.namedata, this.photosdata})
      : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage( namedata:widget.namedata, photosdata : widget.photosdata    )));


            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                widget.photosdata.thumbnailUrl)))),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    widget.namedata.name,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.videocam),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.call),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    contentPadding: EdgeInsets.all(20),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('View contact'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Media,links, and doc'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Search'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Mute Notifications'),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Wallpaper'),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Text('More'),
                            Spacer(),
                            Icon(Icons.arrow_right)
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: Icon(Icons.more_vert),
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/93/b7/d6/93b7d66cc72d22bbbd6dcc5479209419.jpg"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(top:8,bottom: 8),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right:8.0),
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.tag_faces,
                                  size: 30,
                                ),
                              ),
                              Expanded(
                                child: Container(

                                  height: 50,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Type a message'),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.attach_file,
                                size: 30,
                              ),
                              Icon(
                                Icons.camera_alt,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.mic),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
