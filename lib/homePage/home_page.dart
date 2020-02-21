import 'dart:math';
import 'package:whatsapp_ui/chatPage/new_chat.dart';
import 'package:whatsapp_ui/homePage/status_page.dart';
import '../jsonFetch/photos_json.dart';
import 'package:flutter/material.dart';
import '../jsonFetch/name_json.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../chatPage/chat_page.dart';

class HomeWhatsApp extends StatefulWidget {
  @override
  _HomeWhatsAppState createState() => _HomeWhatsAppState();
}

class _HomeWhatsAppState extends State<HomeWhatsApp> {
  List<Photos> photos_list = [];
  List<Name> name_list = [];

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    photos_list = await fetchPhotos();
    name_list = await fetchName();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Stack(
        children: <Widget>[

          Scaffold(
            appBar: AppBar(
              title: Text('WhatsApp'),
              backgroundColor: Colors.teal,
              actions: <Widget>[
                Icon(Icons.search),
                SizedBox(
                  width: 10,
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
                            Text('New group'),
                            SizedBox(
                              height: 20,
                            ),
                            Text('New broadcast'),
                            SizedBox(
                              height: 20,
                            ),
                            Text('WhatsApp Web'),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Starred messages'),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Settings'),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.more_vert),
                ),
              ],
              bottom: TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                tabs: <Widget>[
                  Tab(
                    text: 'CHATS',
                  ),
                  Tab(
                    text: 'STATUS',
                  ),
                  Tab(
                    text: 'CALLS',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                SingleChildScrollView(
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(name_list.length, (index) {
                      Name namedata = name_list[index];

                      Photos photosdata = photos_list[index];

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatPage(
                                    namedata: namedata,
                                    photosdata: photosdata,
                                  )));
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 10, right: 10),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          width: 65.0,
                                          height: 65.0,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: new NetworkImage(
                                                      photosdata
                                                          .thumbnailUrl)))),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 160,
                                            height: 20,
                                           // color: Colors.black,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Flexible(
                                                  child: Text(
                                                    namedata.name,
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            'Message',
                                            style: TextStyle(fontSize: 15),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      Text('1:56 pm')
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 80,
                                      right: 5,
                                    ),
                                    child: Divider(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                StatusPage(
                   name_list:  name_list,
                photos_list: photos_list,),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'To start calling contacts who have WhatsApp,',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'tap icon at the bottom of your screen.',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),




          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewChat(
                              photosdata: photos_list,
                              namedata: name_list,
                            )));
                  },
                  backgroundColor: Colors.teal,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: Icon(
                      Icons.chat,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

Future<List<Photos>> fetchPhotos() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/photos');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    var data = json.decode(response.body);
    var rest = data as List;
    List<Photos> photos_list =
        rest.map((json) => Photos.fromJson(json)).toList();
    return photos_list;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<List<Name>> fetchName() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/users');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    var data = json.decode(response.body);
    var rest = data as List;
    List<Name> name_list = rest.map((json) => Name.fromJson(json)).toList();
    return name_list;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}
