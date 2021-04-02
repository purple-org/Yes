import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
String IP4="192.168.2.8";

class warshatee extends StatefulWidget {
  final phone;
  final name;
  final time;
  warshatee({this.phone,this.name,this.time});
  @override
  _warshateeState createState() => _warshateeState();
}

class _warshateeState extends State<warshatee> {
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 700,
      padding: EdgeInsets.only(top:30),
      child: FutureBuilder(
        future: viewwarshatee(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                print(snapshot.data[index]['workerphone']);

                return view (Todate:snapshot.data[index]['Todate'],Fromdate : snapshot.data[index]['Fromdate'],namefirst : snapshot.data[index]['namefirst'], phoneuser: snapshot.data[index]['phoneuser'], namelast: snapshot.data[index]['namelast'], 	nameofwork: snapshot.data[index]['nameofwork'],	workerphone: snapshot.data[index]['workerphone'],id : snapshot.data[index]['id']);

              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
   
  }
  Future viewwarshatee()async {
    var url = 'https://' + IP4 + '/DUAA/PHP/seereservations.php';
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
class view extends StatefulWidget {
  final Todate;
  final Fromdate;
  final namefirst;
  final phoneuser;
  final namelast;
  final 	nameofwork;
  final 	workerphone;
  final id;
  view({this.phoneuser,this.namefirst,this.nameofwork,this.workerphone,this.Todate,this.namelast,this.id,this.Fromdate});
  @override
  _viewState createState() => _viewState();
}

class _viewState extends State<view> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children:[

        card(widget.namefirst,widget.namelast,widget.Todate,widget.phoneuser,widget.workerphone,widget.nameofwork,widget.Fromdate),

    ], );
  }
  Widget card(String namefirst , String namelast,String todate,String phoneuser,String workerphone,String nameofwork ,String Fromdate)
  { print("tafaseel talab "+workerphone);

  return Container (

    margin: EdgeInsets.only(top:10),
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
              Fromdate+"                   "+"من تاريخ",
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              todate+"                   "+"حتى  ",
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          // Image.asset('assets/card-sample-image.jpg'),
          // Image.asset('assets/card-sample-image-2.jpg'),
        ],
      ),),);

  }
}
