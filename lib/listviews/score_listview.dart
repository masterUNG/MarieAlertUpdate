import 'package:flutter/material.dart';
import 'package:mariealert/models/score_model.dart';

class ScoreListView extends StatelessWidget {
  List<ScoreModel> scoreModels = [];
  ScoreListView(this.scoreModels);

  Widget showDate(int index) {
    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            'วันที่ :',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            scoreModels[index].lasupdate,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        )
      ],
    );
  }

  Widget showRemark(int index) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            'หมายเหตุ:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            scoreModels[index].remark,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ],
    );
  }

  Widget showUserCheck(int index) {
    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            'บันทึกโดย :',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text(scoreModels[index].user_chk),
        )
      ],
    );
  }

  Widget showScore(int index) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'รับคะแนนเพิ่ม',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  scoreModels[index].score_plus,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.green[800],
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  'หักคะแนน',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  scoreModels[index].score_del,
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[600]),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget myDivider() {
    return Divider(
      height: 5.0,
      color: Colors.blue[900],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: scoreModels.length,
      itemBuilder: (context, int index) {
        return Container(
          padding: EdgeInsets.all(8.0),
          decoration: index % 2 == 0
              ? BoxDecoration(color: Colors.blue[100])
              : BoxDecoration(color: Colors.blue[200]),
          child: Column(
            children: <Widget>[
              showDate(index),
              showRemark(index),
              showUserCheck(index),
              showScore(index),
            ],
          ),
        );
      },
    );
  }
}
