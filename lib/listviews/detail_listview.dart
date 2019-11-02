import 'package:flutter/material.dart';
import 'package:mariealert/screens/show_detail_image.dart';
import '../models/news_model.dart';

class DetailListView extends StatelessWidget {
  NewsModel newsModel;

  DetailListView(this.newsModel);

  Widget showPicture() {
    return Image.network(
      newsModel.picture.toString(),
      fit: BoxFit.fitHeight,
    );
  }

  Widget showTitle() {
    return Text(
      newsModel.name.toString(),
      style: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue[900]),
    );
  }

  Widget showDetail() {
    return Container(
        margin: EdgeInsets.all(15.0), child: Text(newsModel.detail.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(30.0),
          alignment: Alignment(0, -1),
          child: Container(
            height: 200,
            child: showPicture(),
          ),
        ),
        FlatButton(
          child: Text(
            'ขยายภาพ',
            style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext context) {
              return ShowDetailImage(url: newsModel.picture,);
            });
            Navigator.of(context).push(materialPageRoute);
          },
        ),
        Container(
          alignment: Alignment(0, -1),
          child: showTitle(),
        ),
        showDetail()
      ],
    );
  }
}
