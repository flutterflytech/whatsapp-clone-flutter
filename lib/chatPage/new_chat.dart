import 'package:flutter/material.dart';
import 'package:whatsapp_ui/chatPage/chat_page.dart';

import '../jsonFetch/name_json.dart';
import '../jsonFetch/photos_json.dart';

class NewChat extends StatefulWidget {
  final List<Name> namedata;
  final List<Photos> photosdata;

  const NewChat({Key key, this.namedata, this.photosdata})
      : super(key: key);

  @override
  _NewChatState createState() => _NewChatState();
}

class _NewChatState extends State<NewChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Select Contact',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '332 contacts',
                  style: TextStyle(fontSize: 15),
                )
              ],
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
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
                      Text('Invite a friend'),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Contacts'),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Refresh'),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Help'),
                    ],
                  ),
                ),
              );
            },
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: () {},
                        heroTag: '1',
                        backgroundColor: Colors.green,
                        child: Icon(Icons.people),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'New Group',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: () {},
                        heroTag: '2',
                        backgroundColor: Colors.green,
                        child: Icon(Icons.person_add),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'New contact',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(widget.namedata.length, (index) {
                      return Column(
                        children: <Widget>[

                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage( namedata: widget.namedata[index],photosdata: widget.photosdata[index]) ));

                            },
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    width: 65.0,
                                    height: 65.0,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image: new NetworkImage(widget
                                                .photosdata[index]
                                                .thumbnailUrl)))),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  widget.namedata[index].name,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                          ),







                          SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
