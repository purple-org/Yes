
import 'package:flutter/material.dart';
import 'package:flutterphone/Inside_the_app/longtimework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/cupertino.dart';

String IP4="192.168.2.8";
class viewWarsha extends StatefulWidget {
  final name;
  final phone;
  viewWarsha({this.phone,this.name});
  @override
  _viewWarshaState createState() => _viewWarshaState();
}

class _viewWarshaState extends State<viewWarsha> {
  @override
  Widget build(BuildContext context) {
    return Container(


      height: 700,
      padding: EdgeInsets.only(top:30),
      child: FutureBuilder(
        future: getlongtimeorder(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                print(snapshot.data[index]['workerphone']);

                return view (describes:snapshot.data[index]['describes'],nameofwork : snapshot.data[index]['nameofwork'],workerphone : snapshot.data[index]['workerphone'], namefirst: snapshot.data[index]['namefirst'], namelast: snapshot.data[index]['namelast'], phoneuser: snapshot.data[index]['phoneuser']);

              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
  Future getlongtimeorder() async {
    var url = 'https://'+IP4+'/DUAA/PHP/viewOrder.php';
    print("inside Worker warsha view"+widget.phone);
    var ressponse = await http.post(url, body: {
      "phone": widget.phone,

    });
    return json.decode(ressponse.body);
  }
}

class view extends StatefulWidget {
  final phoneuser;
  final describes;
  final namefirst;
  final namelast;

  final workerphone;
  final nameofwork;
  view({this.namelast,this.workerphone,this.namefirst,this.phoneuser,this.nameofwork,this.describes});
  @override
  _viewState createState() => _viewState();
}

class _viewState extends State<view> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children:[
        card(widget.namefirst,widget.namelast,widget.describes,widget.phoneuser,widget.workerphone,widget.nameofwork),

      ],);



  }
  Widget card(String namefirst , String namelast,String describes,String phoneuser,String workerphone,String nameofwork )
  { print("tafaseel talab "+workerphone);

  return Container (

    margin: EdgeInsets.only(top:5),
    color: Colors.white,
    child:Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 0,left: 350),
            child:IconButton(icon: Icon(Icons.arrow_forward_ios,color: Colors.blue,), onPressed: (){
              Navigator.pop(context);
              // Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => U_PROFILE(name_Me: widget.name_Me,)));
              //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => U_PROFILE(name_Me: widget.name_Me,)));
            }),
          ),
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: const Text("                 "+'  تفاصيل الطلب'),
            // MainAxisAlignment.end,
            subtitle: Text(
              namefirst+' '+namelast+"                                             "+ "اسم العميل",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              describes+"                   "+"وصف الطلب ",
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                //alignment: MainAxisAlignment.center,
                textColor: Colors.blue,
                onPressed: () {

                },
                child: const Text('الغاء'),
              ),
              FlatButton(
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => viewreservation(workerphoned: workerphone,nameofworkd:nameofwork,namelastd:namelast,namefirstd:namefirst,phoneuserd:phoneuser),
                    ),);},
                // Perform some action

                child: const Text('اضافة'),
              ),

            ],
          ),
          // Image.asset('assets/card-sample-image.jpg'),
          // Image.asset('assets/card-sample-image-2.jpg'),
        ],
      ),),);

  }

}
