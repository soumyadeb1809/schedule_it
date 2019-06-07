
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_it/utils/CommonUtils.dart';
import 'package:schedule_it/utils/DateTimeUtils.dart';
import 'package:schedule_it/utils/FirebaseUtils.dart';


class NewPostScreen extends StatefulWidget {
  NewPostScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewPostScreenState createState() => new _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> with TickerProviderStateMixin {

  File _selectedImage = null;
  DateTime _selectedDate = null;
  TimeOfDay _selctedTime = null;

  TextEditingController postCaptionController = TextEditingController();

  Widget _topAppBar(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 32, left: 20),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Icon(
          Icons.keyboard_backspace,
          size: 32,
          color: Colors.grey,
        ),
        )
      ),
    );
  }

  Widget _pickImageWidget(){
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: CommonUtils.getImageAsset(
                  "images/image_placeholder.png", 150, 150),
              margin: EdgeInsets.all(6),
            ),
            Text("Select an Image",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
    );
  }

  Widget _loadImage(){
    return ClipRRect(
        borderRadius: new BorderRadius.circular(10),
        child: Image.file(_selectedImage, fit: BoxFit.cover)
      );
  }

  Widget _imageSelectionSection(){
    Widget imageSection = this._selectedImage == null ? _pickImageWidget() : _loadImage();
    return GestureDetector(
      onTap: () {
      debugPrint("Container tapped");
      _pickImageFromGallery();
      },
      child: Container(
          margin: EdgeInsets.all(12),
          width: 330,
          height: 330,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                    color: Color(0x16000000),
                    offset: new Offset(0.0, 3.0),
                    blurRadius: 20.0
                )
              ]
          ),
          child: imageSection
        )
    );
  }

  Widget _getSelectDateText(){
    String text;
    if(null == this._selectedDate){
      text = "Select Date";
    }
    else {
      text = "${this._selectedDate.day}-${this._selectedDate.month}-${this._selectedDate.year}";
    }
    return Text(text, style: TextStyle(color: Colors.grey),);
  }

  Widget _scheduleDateContent(){
    return Container(
      height: 54,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: Colors.grey, width: 1.5)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.calendar_today, color: Colors.grey,),
          SizedBox(width: 10,),
          _getSelectDateText()
        ],
      ),
    );
  }


  Widget _getSelectTimeText(){
    String text;
    if(null == this._selctedTime){
      text = "Select Time";
    }
    else {
      text = "${this._selctedTime.hour}:${this._selctedTime.minute}";
    }
    return Text(text, style: TextStyle(color: Colors.grey),);
  }

  Widget _scheduleTimeContent(){
    return Container(
      height: 54,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: Colors.grey, width: 1.5)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.access_time, color: Colors.grey,),
          SizedBox(width: 10,),
          _getSelectTimeText()
        ],
      ),
    );
  }

  Widget _newPostForm() {
    return Container(
        child: Column(
          children: <Widget>[
            _imageSelectionSection(),
            Container(
              margin: EdgeInsets.only(left: 28, right: 28, top: 14),
              child: TextField(
                controller: postCaptionController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    labelText: 'Post Caption',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    )
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 28, right: 28, top: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: InkWell(
                        onTap: () {
                          DateTimeUtils.selectDate(context).then((dateTime){
                            if (dateTime != null)
                              debugPrint("Selected Date: " + dateTime.toString());
                              setState(() {
                                this._selectedDate = dateTime;
                              });
                          });
                        },
                        child: _scheduleDateContent(),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      child: InkWell(
                        onTap: () {
                          DateTimeUtils.selectTime(context).then((timeOfDay){
                            if (timeOfDay != null)
                              debugPrint("Selected Time: " + timeOfDay.toString());
                            setState(() {
                              this._selctedTime = timeOfDay;
                            });
                          });
                        },
                        child: _scheduleTimeContent(),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
    );
  }

  Widget _schedulePostButtonContent(){
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
                color: Color(0x29000000),
                offset: new Offset(0.0, 3.0),
                blurRadius: 20.0
            )
          ]
      ),
      margin: EdgeInsets.only(left: 28.0, right: 28.0, top: 28, bottom: 24),
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Schedule Post",
            style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 16.0,),
          RotatedBox(
            quarterTurns: 2,
            child: Icon(Icons.keyboard_backspace, color: Colors.white,),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _topAppBar(),
                _newPostForm(),
                _schedulePostButtonContent(),
              ],
            ),
          ),
        )
    );
  }

  void _pickImageFromGallery() {
    CommonUtils.imageSelectorGallery().then((imageFile){
      if(imageFile == null)
        return;

      debugPrint("You selected gallery image : " + imageFile.path);
      setState(() {
        this._selectedImage = imageFile;
      });

      FirebaseUtils.saveImage(imageFile).then((downloadUrl){
        debugPrint("File Uploaded!! Download Url: $downloadUrl");
      }).catchError((error){
        debugPrint("Error occrred while uploading: " + error.toString());
      });


    });
  }




}