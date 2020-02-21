import 'package:flutter/material.dart';
import 'package:whatsapp_ui/profilePage/profile_image_view_page.dart';

import '../jsonFetch/name_json.dart';
import '../jsonFetch/photos_json.dart';

class ProfilePage extends StatefulWidget {

  final Name namedata;
  final Photos photosdata;

  const ProfilePage({Key key, this.namedata, this.photosdata})
      : super(key: key);


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black12,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: 420.0,
                  height: 400.0,
                  child: Stack(
                    children: <Widget>[

                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileImageView(namedata : widget.namedata, photosdata:widget.photosdata)));

                        },
                        child:  Hero(
                          tag: widget.photosdata.thumbnailUrl,
                          child: Container(
                              width: 420.0,
                              height: 450.0,
                              decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new NetworkImage(
                                          widget.photosdata.thumbnailUrl)))),
                        ),



                      ),



                      Container(
                        width: 420.0,
                        height: 450.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  onPressed: (){
                                    Navigator.pop(context);

                                  },
                                  icon: Icon(Icons.arrow_back, color: Colors.white,size: 30,),
                                ),

                                Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.more_vert,
                                      size: 30, color: Colors.white),
                                )
                              ],
                            ),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    widget.namedata.name,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.white,
                  // elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Media, links, and docs',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 16),
                            ),
                            Spacer(),
                            Text(
                              '230',
                              style: TextStyle(color: Colors.black38),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.black38,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        child: ListView(
                          //shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: List.generate(230, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 4, right: 8, bottom: 8),
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"))),
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Mute Notifications',
                                style: TextStyle(fontSize: 17),
                              ),
                              Spacer(),
                              Text(
                                'Switch Button',
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Custom notifications',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Media visibility',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Encryption',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: Container(
                                      height: 50,
                                      width: 240,
                                      //color: Colors.black,
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            'Message to this chat ans calls are secured with end-to-end encryption. Tap to verify.',
                                            style: TextStyle(color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  /*Text(
                                    'end-to-end encryption. Tap to verify.',
                                    style: TextStyle(color: Colors.black54),
                                  ),*/
                                ],
                              ),
                              Spacer(),
                              Icon(
                                Icons.lock,
                                color: Colors.teal,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'About and phone number',
                            style: TextStyle(fontSize: 17, color: Colors.teal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Happy',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    '12 August 2017',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '+91 958762158',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    'Mobile',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Icon(
                                Icons.message,
                                color: Colors.teal,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.call,
                                color: Colors.teal,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.videocam,
                                color: Colors.teal,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.block,
                          size: 25,
                          color: Colors.pink,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          'Block',
                          style: TextStyle(fontSize: 20, color: Colors.pink),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.thumb_down,
                          size: 25,
                          color: Colors.pink,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          'Report ',
                          style: TextStyle(fontSize: 20, color: Colors.pink),
                        )
                      ],
                    ),
                  ),
                ),


                SizedBox(height: 50,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
