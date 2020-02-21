import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import '../jsonFetch/name_json.dart';
import '../jsonFetch/photos_json.dart';

class StatusShow extends StatefulWidget {
  final Name namedata;
  final Photos photosdata;

  const StatusShow({Key key, this.namedata, this.photosdata})
      : super(key: key);

  @override
  _StatusShowState createState() => _StatusShowState();
}

class _StatusShowState extends State<StatusShow> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: Scaffold(
            body: Stack(
          children: <Widget>[
            Container(
              height: 900,
              width: 420,
              child: StoryView(
                [
                  StoryItem.text(widget.namedata.name, Colors.lightBlueAccent,
                      fontSize: 40),
                  StoryItem.pageImage(
                    NetworkImage(widget.photosdata.thumbnailUrl),
                    caption: "This is my photo",
                  ),
                  StoryItem.pageImage(
                    NetworkImage(
                        "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"),
                  ),
                ],
                progressPosition: ProgressPosition.top,
                repeat: false,
                controller: storyController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 53, right: 10, left: 20),
              child: Container(
                height: 40,
                width: 420,
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
                    Text(
                      widget.namedata.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Spacer(),
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
                                Text('Mute'),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )));
  }
}
