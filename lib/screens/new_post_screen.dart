
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_it/utils/CommonUtils.dart';
import 'package:schedule_it/utils/FirebaseUtils.dart';


class NewPostScreen extends StatefulWidget {
  NewPostScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewPostScreenState createState() => new _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> with TickerProviderStateMixin {

  File _selectedImage = null;

  TextEditingController postCaptionController = TextEditingController();

  Widget _topAppBar(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 40, left: 20),
      child: RaisedButton(
          child: Icon(
            Icons.keyboard_backspace,
            size: 32,
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
            Text("Select an Image", textAlign: TextAlign.center,),
          ],
        )
    );
  }

  Widget _loadImage(){
    return Container(
      alignment: Alignment.center,
      child: this._selectedImage == null
          ? new Text('Sorry nothing selected!!')
          : new Image.file(_selectedImage, fit: BoxFit.cover,),
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

  Widget _newPostForm() {
    return Container(
        child: Column(
          children: <Widget>[
            _imageSelectionSection(),
            Container(
              padding: EdgeInsets.only(left: 28, right: 28, top: 14),
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: RaisedButton(
                        elevation: 0,
                        color: Color(0xFFFFFFFF),
                        onPressed: (){

                        },
                        child: Text("Hello"),
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