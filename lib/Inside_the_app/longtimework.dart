//import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

import '../constants.dart';
import 'List_worker_group.dart';
String IP4="192.168.2.8";
class viewreservation extends StatefulWidget {
  //final workerphone;
 // final phone;
 // final id;

  final phoneuserd;
  final namefirstd;
  final namelastd;
  final nameofworkd;
  final workerphoned;

  viewreservation({this.workerphoned,this.phoneuserd,this.nameofworkd,this.namelastd,this.namefirstd});
  @override
  _viewreservationState createState() => _viewreservationState();
}

class _viewreservationState extends State<viewreservation> {
  // List <String>fromdate=List <String>();
  // List<String>Todate=[];
  var ListFromdate=[];
  var listTodate=[];
  @override
  Widget build(BuildContext context) {
     return Container(
    //    color: Colors.green,
    //    height: 200,
    //    width:500,
    //    padding: EdgeInsets.only(top:30),
    //    child:Column(
    //  children: [
    //      Container(
    //      width: 400,
    //      height: 100,
    //      margin: EdgeInsets.only(top:80,),
    //      child: FlatButton(
    //        shape: RoundedRectangleBorder(
    //            borderRadius: BorderRadius.circular(25.0),
    //            side: BorderSide(color: Colors.transparent)
    //        ),
    //        // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
    //        color:Y2,
    //        onPressed: (){
    //          print("warsha add"+widget.namefirstd);
    //          Navigator.push(
    //          context,
    //          MaterialPageRoute(
    //          builder: (context) => datep(workerphoned: widget.workerphoned,namefirstd:widget.namefirstd,namelastd: widget.namelastd,phoneuserd: widget.phoneuserd,fromdate: widget.fromdate,Todate: widget.Todate),),);
    //        },
    //        child: Text(
    //          "?????????? ????????????",
    //          style: TextStyle(
    //            color: Colors.white,
    //            fontWeight: FontWeight.bold,
    //            fontSize: 20.0,
    //            fontFamily: 'Changa',
    //          ),
    //        ),
    //      ),
    //    ),
    // //    FlatButton(
    // //      child: Text("??????????"),
    // //      onPressed: (){
    // // Navigator.push(
    // // context,
    // // MaterialPageRoute(
    // // builder: (context) => datep(workerphone: widget.workerphone),
    // // ),);},
    //
    //
    //
    //
    //    //  color:  Color(0xFF1C1C1C),
    //  Column(
    //      crossAxisAlignment: CrossAxisAlignment.stretch,
    //      mainAxisAlignment: MainAxisAlignment.center,
    //      children: <Widget>[
    //    Expanded(child: Container(
    //      height: 800,
    //      // color:  Color(0xFFF3D657),
    //      margin: EdgeInsets.only(top: 0),
    //      decoration: BoxDecoration(
    //        // color:Color(0xFF1C1C1C),
    //        // borderRadius: BorderRadius.only(
    //        //   topLeft: Radius.circular(50),
    //        //   topRight: Radius.circular(50),
    //        // ),
    //      ),
         child:
         FutureBuilder(
         future: viewreservations(),
         builder: (BuildContext context, AsyncSnapshot snapshot) {
           if(snapshot.hasData){
             print("has data");
             return ListView.builder(
               itemCount: snapshot.data.length,
               itemBuilder: (context, index) {
               print(snapshot.data.length);
                 print(snapshot.data[index]['Fromdate']+"men");
                 ListFromdate.add( snapshot.data[index]['Fromdate']);
                 listTodate.add( snapshot.data[index]['Todate']);
                  if(index==snapshot.data.length-1)
                 return datep (fromdate:ListFromdate,Todate:listTodate,workerphoned: widget.workerphoned,namefirstd: widget.namefirstd,namelastd: widget.namelastd,phoneuserd: widget.phoneuserd,nameofworkd: widget.nameofworkd);
              return  Container (color:Colors.red);
               },
               // return datep (fromdate:ListFromdate,Todate:listTodate,workerphoned: widget.workerphoned,namefirstd: widget.namefirstd,namelastd: widget.namelastd,phoneuserd: widget.phoneuserd,nameofworkd: widget.nameofworkd,);
             );

           }
           return  CircularProgressIndicator ();
         },
       ),
     // ),),],),
     //     ],),
);
  }
  viewreservations() async {
    var url = 'https://' + IP4 + '/DUAA/PHP/seereservations.php';
    print(widget.workerphoned);
    var ressponse = await http.post(url, body: {
      "phone": widget.workerphoned,
    });
    // ignore: deprecated_member_use
    // var responsebody = json.decode(ressponse.body);
    // print(responsebody);
    return json.decode(ressponse.body);
  }
}


class datep extends StatefulWidget {
  List<dynamic>fromdate;
  List<dynamic>Todate;
  bool ifpicked=false;
  //final fromdate;
  //final Todate;
final phoneuserd;
final namefirstd;
final namelastd;
final nameofworkd;
final workerphoned;


 // final nameofwork; final namelast;final namefirst;final phoneuser;final workerphone;
  datep({this.namefirstd,this.namelastd,this.nameofworkd,this.phoneuserd,this.workerphoned,this.fromdate,this.Todate});
  @override
  _datepState createState() => _datepState();
}

class _datepState extends State<datep> {

  @override
  Widget build(BuildContext context) {
  return
    Theme(
      data: Theme.of(context).copyWith(
          accentColor: Colors.green,
          primaryColor: MY_BLACK,
          buttonTheme: ButtonThemeData(
              highlightColor: Colors.indigoAccent,
              buttonColor: Colors.green,
              colorScheme: Theme.of(context).colorScheme.copyWith(
                  secondary: MY_BLACK,
                  background: Colors.black45,
                  primary:MY_BLACK,
                  primaryVariant: Colors.green,
                  //brightness: Brightness.,
                  onBackground: Colors.green),
              textTheme: ButtonTextTheme.accent)),
      child: Builder(
        builder: (context) => RaisedButton(
          color: Color.fromRGBO(212, 20, 15, 1.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
            child: Text(
              "Date Picker",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          onPressed: () async {

            final List<DateTime> picked = await DateRangePicker.showDatePicker(
                context: context,
                initialFirstDate: new DateTime.now(),
                initialLastDate: (new DateTime.now()).add(new Duration(days: 7)),
                firstDate: new DateTime(2021),
                lastDate: new DateTime(DateTime.now().year + 2));
            if (picked != null && picked.length == 2) {
              print(picked);
              print(picked.first);
              _showMyDialog(picked);

            }
            else {
              }
          }),),);
  }

  Future<void> _showMyDialog(final List<DateTime> picked ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('?????? ????????'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('?????? ???????????? :'+picked.toString()),
                Text('?????? ?????? ?????? ???????? ???????????????????? ???????????????? ???????????? ???????? ?????????? '),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('??????????'),
              onPressed: () {
               addlongtimework(picked);
                Navigator.of(context).pop();
              },
            ),
        TextButton(
        child: Text('??????????'),
        onPressed: () {

        Navigator.of(context).pop();
        },),
          ],
        );
      },
    );
  }

  Future<void> addlongtimework(final List<DateTime> picked) async {
    int i = 0;
    print(widget.workerphoned);
    var flag=true;
    //  DateTime fromDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(widget.fromdate);
    if(widget.fromdate ==null||widget.Todate==null){
      print('hi hi hi');
     // print(widget.nameofwork);
      //print(widget.namefirst);
      var url = 'https://' + IP4 + '/DUAA/PHP/reservations.php';
      var ressponse = await http.post(url, body: {
        "nameofwork": widget.nameofworkd,
        "namefirst": widget.namefirstd,
        "namelast": widget.namelastd,
        "phoneuser": widget.phoneuserd,
        "workerphone": widget.workerphoned,
        //"id": widget.id,
        "Fromdate": picked.first.toString(),
        "Todate": picked.last.toString(),
      });
    }
    else{ bool flag=false;
      print("I am checking for overlapping");
      print(widget.fromdate.length-1);
      print(widget.Todate.length-1);
      for(int p=0;p<widget.fromdate.length-1;p++){
    if(flag==true)break;
    DateTime from = DateTime.parse(widget.fromdate[p]);
    print(from);
    DateTime to = DateTime.parse(widget.Todate[p]);
    print(to);
    DateTime start = picked.first;
    DateTime end = picked.last;

    if (start == from || start == to ||(start.isBefore(to) && start.isAfter(from))){
      flag=true;_showMyDialogo();break;

      print("overlap");}
    else
    if (end == from || end == to || (end.isBefore(to) && end.isAfter(from))) {
      print("overlap");flag=true;_showMyDialogo();break;
    }
    }
      if(flag==true) _showMyDialogo();
    if(flag==false) {
      widget.ifpicked=true;
      //print(from); // 2020-01-02 03:04:05.000
      //row["name"].contains(value)
      //if(picked.first [i]>= dt)
      var mesaage;
      print('hi hi hi');
      var url = 'https://' + IP4 + '/DUAA/PHP/reservations.php';
      var ressponse = await http.post(url, body: {
        "nameofwork": widget.nameofworkd,
        "namefirst": widget.namefirstd,
        "namelast": widget.namelastd,
        "phoneuser": widget.phoneuserd,
        "workerphone": widget.workerphoned,
        //"id": widget.id,
        "Fromdate": picked.first.toString(),
        "Todate": picked.last.toString(),
      });

     // mesaage = json.decode(ressponse.body);
    }
    }
  }
  Future<void> _showMyDialogo( ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('?????????? ???? ????????????????'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("???????? ???????? ?????? ???? ?????????????? ??????????????"),
                Text('???????? ?????????? ??????'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('ok'),
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
class user extends StatefulWidget {
  final phone;
  final namefirst;
  final nameLast;
  final phoneuser;
  final nameLast_Me;
  final namefirst_Me;
  user({this.phone,this.phoneuser,this.nameLast,this.namefirst,this.nameLast_Me,this.namefirst_Me});
  @override
  _userState createState() => _userState();
}

class _userState extends State<user> {
  DateTime selectedDate = DateTime.now();
  TextEditingController describe = TextEditingController();
  Future<void> _showMyDialog( String nameofwork ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("?????? ???????? ?????? ???????????????? "),

          content: SingleChildScrollView(
            child: ListBody(

              children: <Widget>[
                TextFormField(
                  controller: describe,
                  decoration: const InputDecoration(

                    hintText: '???????? ???????? ??????????',
                    labelText: '???????? ???????????? ?????????? ???????? ???????? ????????????'+"\n"
                  ),
                ),
                Text( "\n" +'?????? ?????? ?????? ?????????? ?????? ????????????????' )  ,

              ],
            ),
          ),
          actions: <Widget>[

        TextButton(
        child: Text('??????????'),
        onPressed: () {

        Navigator.of(context).pop();
        },

            ),
            TextButton(
              child: Text('??????????'),
              onPressed: () {
                SendOrderDetails(nameofwork );

                Navigator.of(context).pop();
              },),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
appBar: AppBar(
    elevation: 0.0,
    backgroundColor:Colors.black.withOpacity(0.75),
    leading:   IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: (){
   Navigator.pop(context);
}), ),
     body:
     Container(//color: Color(0xFF1C1C1C),
       //color:Colors.transparent,
       height: 700,
      width:600,
      margin: EdgeInsets.only(top:150),
      child: SingleChildScrollView(

        scrollDirection: Axis.horizontal,
        child: Row(

          children: <Widget>[
            Column(

        children: <Widget>[

        Row(

        children: <Widget>[
            RecomendPlantCard(

            // image: "assets/work/najar.jpg",
              title: "???????? ?????? ???????? ",
              press: () async{


               _showMyDialog("???????? ?????? ???????? ");

              },
            ),
            RecomendPlantCard(

            //  image: "assets/work/sapak.jpg",
              title: " ?????????? ????????",
              press: ()async {
                _showMyDialog(" ?????????? ????????");
              },
            ),],),
       Row(

         children: <Widget>[
            RecomendPlantCard(
              //image: "assets/work/electric1.jpg",
              title: "?????????? ?????????? ",
              press: () async{
                _showMyDialog("?????????? ?????????? ");
              },
            ),
            RecomendPlantCard(
              //image: "assets/work/fix.jpg",
              title: "??????",
              press: ()async {
                _showMyDialog("??????");
              },
            ),],),

      //       RecomendPlantCard(
      //         //image: "assets/work/sapaak.jpg",
      //         title: "??????????",
      //         press: () {},
      //       ),
      //       RecomendPlantCard(
      //         //image: "assets/work/dahan.jpg",
      //         title: "??????????",
      //         press: () {},
      //       ),
      //       RecomendPlantCard(
      //         //image: "assets/work/mec.jpg",
      //         title: "??????????????",
      //         press: () {},
      //       ),
      //       RecomendPlantCard(
      //         //image: "assets/work/baleet.jpg",
      //         title: "??????????",
      //         press: () {},
      //       ),
      //       RecomendPlantCard(
      //         //image: "assets/work/repaier.jpg",
      //         title: "??????????",
      //         press: () {},
      //       ),

        ],),
          ],
        ),
       ),
    ),);
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2021, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate){
  //    _showMyDialog(picked);
      setState(() {

        selectedDate = picked;
        print(picked);
      });}
  }

  Future SendOrderDetails(String nameofwork) async{
    var mesaage;
    print('hi hi hi');
    print(describe.text);
    var url = 'https://'+IP4+'/DUAA/PHP/addlongtimerequest.php';
    var ressponse = await http.post(url, body: {
      "nameofwork": nameofwork,
      "namefirst":widget.namefirst_Me,
      "namelast":widget.nameLast_Me,
      "phoneuser": widget.phoneuser,
      "workerphone":widget.phone,
      "describes":describe.text,
    });

   // mesaage= json.decode(ressponse.body);
  }
  }
class sabak extends StatefulWidget {
  final phone;
  final namefirst;
  final nameLast;
  final phoneuser;
  final nameLast_Me;
  final namefirst_Me;
  sabak({this.phone,this.phoneuser,this.nameLast,this.namefirst,this.nameLast_Me,this.namefirst_Me});
  @override
  _sabakState  createState() => _sabakState ();
}

class _sabakState extends State<sabak> {
  DateTime selectedDate = DateTime.now();
  TextEditingController describe = TextEditingController();
  Future<void> _showMyDialog( String nameofwork ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("?????? ???????? ?????? ???????????????? "),

          content: SingleChildScrollView(
            child: ListBody(

              children: <Widget>[
                TextFormField(
                  controller: describe,
                  decoration: const InputDecoration(

                      hintText: '???????? ???????? ??????????',
                      labelText: '???????? ???????????? ?????????? ???????? ???????? ????????????'+"\n"
                  ),
                ),
                Text( "\n" +'?????? ?????? ?????? ?????????? ?????? ????????????????' )  ,

              ],
            ),
          ),
          actions: <Widget>[

            TextButton(
              child: Text('??????????'),
              onPressed: () {

                Navigator.of(context).pop();
              },

            ),
            TextButton(
              child: Text('??????????'),
              onPressed: () {
                SendOrderDetails(nameofwork );

                Navigator.of(context).pop();
              },),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:Colors.black.withOpacity(0.75),
        leading:   IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: (){
          Navigator.pop(context);
        }), ),
      body:
      Container(//color: Color(0xFF1C1C1C),
        //color:Colors.transparent,
        height: 700,
        width:600,
        margin: EdgeInsets.only(top:150),
        child: SingleChildScrollView(

          scrollDirection: Axis.horizontal,
          child: Row(

            children: <Widget>[
              Column(

                children: <Widget>[

                  Row(

                    children: <Widget>[
                      RecomendPlantCard(

                        // image: "assets/work/najar.jpg",
                        title: "?????????????? ?????? ???????? ",
                        press: () async{


                          _showMyDialog("?????????????? ?????? ???????? ");

                        },
                      ),
                      RecomendPlantCard(

                        //  image: "assets/work/sapak.jpg",
                        title: "?????????? ????????",
                        press: ()async {
                          _showMyDialog(" ?????????? ????????");
                        },
                      ),],),
                  Row(

                    children: <Widget>[
                      RecomendPlantCard(
                        //image: "assets/work/electric1.jpg",
                        title: "?????????????? ????????????",
                        press: () async{
                          _showMyDialog("?????????????? ????????????");
                        },
                      ),
                      RecomendPlantCard(
                        //image: "assets/work/fix.jpg",
                        title: "????????",
                        press: ()async {
                          _showMyDialog("????????");
                        },
                      ),],),

                  //       RecomendPlantCard(
                  //         //image: "assets/work/sapaak.jpg",
                  //         title: "??????????",
                  //         press: () {},
                  //       ),
                  //       RecomendPlantCard(
                  //         //image: "assets/work/dahan.jpg",
                  //         title: "??????????",
                  //         press: () {},
                  //       ),
                  //       RecomendPlantCard(
                  //         //image: "assets/work/mec.jpg",
                  //         title: "??????????????",
                  //         press: () {},
                  //       ),
                  //       RecomendPlantCard(
                  //         //image: "assets/work/baleet.jpg",
                  //         title: "??????????",
                  //         press: () {},
                  //       ),
                  //       RecomendPlantCard(
                  //         //image: "assets/work/repaier.jpg",
                  //         title: "??????????",
                  //         press: () {},
                  //       ),

                ],),
            ],
          ),
        ),
      ),);
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2021, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate){
      //    _showMyDialog(picked);
      setState(() {

        selectedDate = picked;
        print(picked);
      });}
  }

  Future SendOrderDetails(String nameofwork) async{
    var mesaage;
    print('hi hi hi');
    print(describe.text);
    var url = 'https://'+IP4+'/DUAA/PHP/addlongtimerequest.php';
    var ressponse = await http.post(url, body: {
      "nameofwork": nameofwork,
      "namefirst":widget.namefirst_Me,
      "namelast":widget.nameLast_Me,
      "phoneuser": widget.phoneuser,
      "workerphone":widget.phone,
      "describes":describe.text,
    });

    // mesaage= json.decode(ressponse.body);
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key key,
    this.image,
    this.title,
    this.press,
  }) : super(key: key);

  final String image, title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //color: Color(0xFF1C1C1C),
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 10,right: 10),
      width: 170,
      height: 200,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: press,
            child: Container(
              height: 130,
              // padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color:Color(0xFF1C1C1C),
                  ),
                ],
              ),
              child: Container(
                child:Stack(
                  children:<Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(29),

                 child: Container(
                      margin: EdgeInsets.only(top: 85),
                      child:Center(
                        child:Text(title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Changa',
                            color: Color(0xFFECCB45),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),),),
                    ), ],),
              ),
            ),
          )
        ],
      ),
    );
  }
}