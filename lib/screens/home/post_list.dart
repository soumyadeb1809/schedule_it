import 'package:flutter/material.dart';
import 'package:schedule_it/model/post.dart';
import 'package:schedule_it/utils/CommonUtils.dart';

class PostList extends StatelessWidget {
  final List<Post> posts;
  PostList(this.posts);

  Widget _buildProductItem(BuildContext context, int index) {
    Post post = posts[index];
    return Container(
        color: Colors.white,
        alignment: Alignment.topCenter,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20, 8, 20, 76),
              width: 360,
              height: 360,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x40000000),
                        offset: new Offset(0.0, 3.0),
                        blurRadius: 20.0
                    )
                  ]
              ),
              child: CommonUtils.getClippedImageAsset(post.url, cornerRadius: 10),
            ),
            Positioned(
              top: 308,
              child: Container(
                width: 320,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x20000000),
                          offset: new Offset(0.0, 3.0),
                          blurRadius: 10.0
                      )
                    ]
                ),
                padding: EdgeInsets.fromLTRB(16, 16, 10, 16),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.timer, color: Colors.black, size: 26,),
                            SizedBox(width: 10,),
                            Text("16th May, 7:30pm", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Attending a trade show can be very effective\n method of promoting yourself. "
                            "And one of the most \neffective way of to optimise your trade  show display",
                          style: TextStyle(color: Colors.grey, fontSize: 12), maxLines: 4,)
                      ],
                    ),
                    Expanded(
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
                        )
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildProductItem,
      itemCount: posts.length,
    );
  }
}