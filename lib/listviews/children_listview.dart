import 'package:flutter/material.dart';
import 'package:mariealert/screens/show_score_list.dart';
import '../models/children_model.dart';

class ChildrenListView extends StatelessWidget {
  List<ChildrenModel> childrenModels;
  List<String> idCodeList = [];
  ChildrenListView(this.childrenModels);

  // Method
  Widget showButtonScore(BuildContext context, int index) {
    return Container(
      child: FlatButton.icon(
        color: Colors.blue[900],
        icon: Icon(
          Icons.score,
          color: Colors.white,
        ),
        label: Text(
          'แสดง คะแนน',
          style: TextStyle(color: Colors.white),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        onPressed: () {
          moveToDetail(context, index);
        },
      ),
    );
  }

  Widget showDelete(int index, BuildContext context) {
    return Container(
      child: FlatButton.icon(
        color: Colors.red[700],
        icon: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        label: Text(
          'ลบบุตร',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(30.0)),
        onPressed: () {
          myAlert(index, context);
        },
      ),
    );
  }

  void myAlert(int index, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(Icons.access_alarms),
              title: Text(
                'ผู้ปกครองแน่ใจนะ ?',
                style: TextStyle(
                    color: Colors.red[700], fontWeight: FontWeight.bold),
              ),
            ),
            content: Text(
                'คุณผู้ปกครอง ต้องการลบ ${childrenModels[index].fname} ออกจาก บุตรหลาน ของท่าน'),
            actions: <Widget>[
              cancleButton(context),
              okButton(context, index),
            ],
          );
        });
  }

  Widget okButton(BuildContext context, int index) {
    return FlatButton(
      child: Text(
        'ลบเลย',
        style: TextStyle(color: Colors.red[700]),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        deleteChildrent(index);
      },
    );
  }

  Future<void> deleteChildrent(int index) async {
    String idCodeDelete = childrenModels[index].idcode;
  }

  Widget cancleButton(BuildContext context) {
    return FlatButton(
      child: Text('อย่าพึ่งลบ'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget showButton(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        children: <Widget>[
          Expanded(
            child: showButtonScore(context, index),
          ),
          Expanded(
            child: showDelete(index, context),
          ),
        ],
      ),
    );
  }

  Widget showImage(int index) {
    String urlImage = childrenModels[index].imagePath.toString();

    if (urlImage.length != 0) {
      return Container(
        height: 200.0,
        padding: EdgeInsets.all(20.0),
        child: Image.network(urlImage),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(20.0),
        height: 200.0,
        child: Image.asset('images/child.png'),
      );
    }
  }

  Widget showName(int index) {
    print('fname ==> ${childrenModels[index].fname}');
    return Text(
      childrenModels[index].fname,
      style: TextStyle(fontSize: 24.0, color: Colors.white),
    );
  }

  Widget showRoom(int index) {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment(0, 0),
              child: Text(
                '${childrenModels[index].studentClass}',
                style: TextStyle(fontSize: 18.0, color: Colors.blue[800]),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment(0, 0),
              child: Text(
                'ห้อง  ${childrenModels[index].room}',
                style: TextStyle(fontSize: 18.0, color: Colors.blue[800]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget showList() {
    for (var value in childrenModels) {
      // print('value ==> $value');
      idCodeList.add(value.idcode);
    }
    print('idCodeList = $idCodeList');
    return ListView.builder(
      itemCount: childrenModels.length,
      itemBuilder: (context, int index) {
        return GestureDetector(
          child: Container(
            child: Column(
              children: <Widget>[
                showImage(index),
                showName(index),
                showRoom(index),
                showButton(context, index),
              ],
            ),
          ),
          onTap: () {
            moveToDetail(context, index);
          },
        );
      },
    );
  }

  void moveToDetail(BuildContext context, int index) {
    String idCode = childrenModels[index].idcode;
    print('Click idCode ==> $idCode');

    var showScoreRoute = MaterialPageRoute(
        builder: (BuildContext context) => ShowScoreList(
              idCode: idCode,
            ));
    Navigator.of(context).push(showScoreRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(
              radius: 2.0,
              colors: [Colors.white, Colors.blue],
              center: Alignment(1, 1))),
      child: showList(),
    );
  }
}
