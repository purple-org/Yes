import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'longtimework.dart';
import '../Inside_the_app/user_order.dart';
class choose extends StatefulWidget {
  final image_Me;
  final phone_Me;
  final phone;

  final nameLast;
  final Rate;
  final work;
  final namefirst;
  final namefirst_Me;
  final nameLast_Me;

  final name_Me;

   choose({this.phone,this.image_Me,this.phone_Me,this.work,this.name_Me,this.namefirst_Me,this.nameLast_Me,this.namefirst,this.Rate,this.nameLast});
  @override
  _chooseState createState() => _chooseState();
}

class _chooseState extends State<choose> {
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
    // return Directionality(
    //   textDirection: TextDirection.rtl,

      Stack(
          children: [
  // Container(
  //  // margin: EdgeInsets.only(top:0,),
  //
  //   color:Colors.black.withOpacity(0.75),
  //      child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: (){
  //       Navigator.pop(context);
  //     }), ),

      Container(
          margin: EdgeInsets.only(top:0,),
      decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.3),
      image: new DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
        ColorFilter.mode(Colors.blue.withOpacity(0.3),
            BlendMode.dstATop),
        image: new AssetImage(
          'assets/work/choice.jpg',
        ),
      ),
    )),
    // return  Container(
    //     width: 300,
    //     height: 60,
    //     margin: EdgeInsets.only(top:10,),
    //     child: FlatButton(
    //       shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(25.0),
    //           side: BorderSide(color: Colors.transparent)
    //       ),
    //       // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
    //       color:Colors.white,
    //       onPressed: (){
    //
    //       },
    //       child: Text(
    //         "ورشات عمل ",
    //         style: TextStyle(
    //           color: Colors.black,
    //           fontWeight: FontWeight.bold,
    //           fontSize: 17.0,
    //           fontFamily: 'Changa',
    //         ),
    //       ),
    //     ),
    //
    // );
  //}
//}
    Scaffold(
        backgroundColor: Colors.transparent,
        //backgroundColor:Colors.white,
        body: Form(
        child: SingleChildScrollView(

        child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

        //Image.asset('assets/icons/ho.jpg',fit: BoxFit.cover,) ,
        GestureDetector(
        // onTap: () {
        //   setState(() {
        //     login = true;
        //   });
        // },
        child:Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(top: 0),
    child: Center(
    child: SingleChildScrollView(
    child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    child:Column(
    children: [
    Container(
    margin: EdgeInsets.only(top: 100,),
    height: 100,
    decoration: BoxDecoration(
    color:Colors.transparent,
    image: DecorationImage(
    colorFilter:
    ColorFilter.mode(Colors.transparent,
    BlendMode.colorBurn),
    image: new AssetImage(
    'assets/work/house-reforms.png',
    ),
    ),

    ),
    ),
    Container(
    child:Text('الخدمة التي تريدها ',
    style: TextStyle(
    fontSize: 55,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: 'vibes',
    //fontStyle: FontStyle.italic,
    ),)
    ),
    Container(
    width: 400,
    height: 100,
    margin: EdgeInsets.only(top:80,),
    child: FlatButton(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.0),
    side: BorderSide(color: Colors.transparent)
    ),
    // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
    color:Y2,
    onPressed: (){
            print("inside user choose "+widget.namefirst_Me+widget.nameLast_Me);
            if(widget.work=="نجار")
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => user(phoneuser:widget.phone_Me,phone:widget.phone,namefirst_Me: widget.namefirst_Me,nameLast_Me: widget.nameLast_Me,namefirst:widget.namefirst,nameLast:widget.nameLast)));
         else  if(widget.work=="كهربائي")
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => sabak(phoneuser:widget.phone_Me,phone:widget.phone,namefirst_Me: widget.namefirst_Me,nameLast_Me: widget.nameLast_Me,namefirst:widget.namefirst,nameLast:widget.nameLast)));

    },
    child: Text(
    "ورشات عمل",
    style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
    fontFamily: 'Changa',
    ),
    ),
    ),
    ),
    Container(
    width: 400,
    height: 100,
    margin: EdgeInsets.only(top:10,),
    child: FlatButton(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.0),
    side: BorderSide(color: Colors.transparent)
    ),
    // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
    color:Colors.white,
    onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => user_order(phone:widget.phone)));

    },
    child: Text(
    "طقة خفيفة",
    style: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
    fontFamily: 'Changa',
    ),
    ),
    ),
    ), Container(
        // child:IconButton(
        //
        // ),
      )
    ],
    ),
    ),
    ),
    )
        ),
        ),
        ],

        ),),
        ),),],),);
  }
}
