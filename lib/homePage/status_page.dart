import 'package:flutter/material.dart';
import 'package:whatsapp_ui/jsonFetch/name_json.dart';
import 'package:whatsapp_ui/jsonFetch/photos_json.dart';
import 'package:whatsapp_ui/statusShowPage/status_show.dart';

class StatusPage extends StatefulWidget {
  final List<Photos> photos_list;
  final List<Name> name_list;

  const StatusPage({Key key, this.photos_list, this.name_list}) : super(key: key);


  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.only(top: 10, left: 10, bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 65.0,
                        height: 65.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new NetworkImage(
                                    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80")))),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Satyam Sangal',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Tap to add status update',
                          style:
                          TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // SizedBox(height: 10,),
              Container(
                height: 30,
                width: 420,
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Recent Updates',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),

              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(widget.name_list.length, (index) {
                  Name namedata = widget.name_list[index];

                  Photos photosdata = widget.photos_list[index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StatusShow(
                                photosdata: photosdata,
                                namedata: namedata,
                              )));
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: 65.0,
                                height: 65.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new NetworkImage(
                                            photosdata.thumbnailUrl)))),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  namedata.name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Today, 8:36 am',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          )),
    );
  }
}
