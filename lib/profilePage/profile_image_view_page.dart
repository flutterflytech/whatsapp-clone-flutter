import 'package:flutter/material.dart';

import '../jsonFetch/name_json.dart';
import '../jsonFetch/photos_json.dart';

class ProfileImageView extends StatefulWidget {
  final Name namedata;
  final Photos photosdata;

  const ProfileImageView({Key key, this.namedata, this.photosdata})
      : super(key: key);




  @override
  _ProfileImageViewState createState() => _ProfileImageViewState();
}

class _ProfileImageViewState extends State<ProfileImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: <Widget>[

                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);

                        },
                        icon: Icon(Icons.arrow_back, color: Colors.white,size: 25,),
                      ),


                      SizedBox(width: 20,),
                      Text(widget.namedata.name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),

                    ],
                  ),
                ),
                SizedBox(height: 125,),

                Hero(
                  tag: widget.photosdata.thumbnailUrl,
                  child: Container(
                    //color: Colors.white,
                      width: 420.0,
                      height: 450.0,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  widget.photosdata.thumbnailUrl)))),
                ),




              ],
            ),
          ),
        ),
      ),




    );
  }
}
