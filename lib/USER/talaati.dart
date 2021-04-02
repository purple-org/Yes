import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterphone/Inside_the_app/longtimework.dart';
import 'package:flutterphone/Worker/edit.dart';
import 'package:http/http.dart' as http;
String IP4="192.168.2.8";
class getdata extends StatefulWidget {
final id;
final nameofwork;
final workerphone;
final phoneuser;
final namelast;
final namefirst;
getdata({this.id,this.phoneuser,this.nameofwork,this.namelast,this.namefirst,this.workerphone});
  @override
  _getdataState createState() => _getdataState();
}

class _getdataState extends State<getdata> {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,


        // ),

     child:     Container(
            width:200,height:100,
            color:Colors.white,
            child:
        FlatButton(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => viewreservation(workerphoned: widget.workerphone),
          ),);},

         child: Text("اضافة"),disabledTextColor: Colors.red,),

     ),





   );
  }
  Future<void> _showMyDialog( ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  }


class viewtalabdetails extends StatefulWidget {
  final phone;
  viewtalabdetails({this.phone});
  @override
  _viewtalabdetailsState createState() => _viewtalabdetailsState();
}

class _viewtalabdetailsState extends State<viewtalabdetails> {
  @override
  Widget build(BuildContext context) {
   // return Container(
    return Directionality(textDirection: TextDirection.rtl,
    child: Scaffold(
   // child:SingleChildScrollView(
      body:Column(
        children: [

        Container(

          color: Colors.green,
          height: 700,
          padding: EdgeInsets.only(top:30),

          //  color:  Color(0xFF1C1C1C),
          child:FutureBuilder(
            future: vieworderdetails(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                print("has data");
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    print(snapshot.data[index]['namefirst']);
                    return getdata (namefirst:snapshot.data[index]['namefirst'],namelast:snapshot.data[index]['namelast'],phoneuser:snapshot.data[index]['phoneuser'],workerphone:snapshot.data[index]['workerphone'],nameofwork:snapshot.data[index]['nameofwork'],id:snapshot.data[index]['id']);
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),),
        ],
      )
    ),);

  }

 Future vieworderdetails()async {
       var url = 'https://' + IP4 + '/testlocalhost/PHP/viewOrder.php';
       print(widget.phone);
     var ressponse = await http.post(url, body: {
       "phone": widget.phone,
     });
     // ignore: deprecated_member_use
     // var responsebody = json.decode(ressponse.body);
     // print(responsebody);
     return json.decode(ressponse.body);
   }
  }

