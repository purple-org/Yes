// import 'dart:async';
// import 'dart:convert';
// import "dart:io";
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:http/http.dart' as http;
// String IP4="192.168.2.108";
// // var url = "http://maps.google.com/mapfiles/ms/icons/";
// // url + = "blue";
// int count =0;
// List<dynamic>Worker;
// class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }
//
// class MyApp1 extends StatefulWidget {
//   _mState createState() => _mState();
// }
//
// class _mState extends State<MyApp1> {
//
//   Future getMarker()async{
//     print("Yes from getmarker");
//     var url='https://'+IP4+'/testlocalhost/PHP/markers.php';
//     var ressponse=await http.get(url);
//     print(json.decode(ressponse.body));
//     print("vvxbccccccccccccccccccccccc");
//     return json.decode(ressponse.body);
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     print("000000000000000000000000000000000000000");
//     return Scaffold(
//       //appBar: ,
//       body:Column(
//         children:<Widget>[
//           Container(
//             child: Text("Ma ddddddddddddddddddddddddddddddddp"),
//           ),
//           Expanded(
//
//             child:Container(
//               height: 100,
//               child: FutureBuilder(
//                   future: getMarker(),
//                   builder: (BuildContext context, AsyncSnapshot snapshot) {
//                     if (snapshot.hasData) {
//                       print("has data================================================================================================");
//                       //_MyHomePageState c= new _MyHomePageState();
//                       return ListView.builder(
//                         itemCount: 1,
//                         itemBuilder: (context, index) {
//                           var Listr=snapshot.data;
//                           print(Listr[0]['lng']);
//                           return w(Location:Listr,);
//                         },);
//                     }
//                     return Container(child:CircularProgressIndicator(),
//                       //child:Text("hi"),
//                     );
//
//                   }
//               ),
//             ),),],),);
//
//
//   }
// }
// class w extends StatefulWidget {
//   List<dynamic>Location;
//   w({this.Location});
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<w> {
//   PermissionStatus _permissionGranted;
//   bool serviceEnabled;
//   int i=0;
//   var List_Worker=[];
//   List<Marker> markers=[];
//   Completer<GoogleMapController> _controller = Completer();
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//
//   get url => null;
//   @override
//   void initState() {
//     super.initState();
//   }
//   bool S=false;
//   Fetch()async{
//     for(;i<widget.Location.length;i++){
//       await checkLocationServicesInDevice(double.parse(widget.Location[i]['lat']),double.parse(widget.Location[i]['lng']));
//     }
//     setState(() {
//       S=true;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     Fetch();
//     return S?Container(
//       height: 700,
//       child:showgooglemap(markers),):Center(child: CircularProgressIndicator());
//     //  child:FutureBuilder(
//     //    future: checkLocationServicesInDevice(),
//     //      builder: (BuildContext context, AsyncSnapshot <double>snapshot) {
//     //        if (snapshot.hasData) {
//     //          print("================================================111111");
//     //              return Container(child:Text(snapshot.data.toString()),);
//     //        }
//     //        return Center(child: CircularProgressIndicator());
//     //
//     //      }
//     //
//     // ),
//   }
//   // @override
//   Future <double>checkLocationServicesInDevice(double lat1,double lng1) async {
//     print("i am in location");
//     Location location = new Location();
//     LocationData _location ;
//     serviceEnabled = await location.serviceEnabled();
//
//     if(serviceEnabled)
//     {
//
//       _permissionGranted = await location.hasPermission();
//
//       if(_permissionGranted == PermissionStatus.granted)
//       {
//         _location = await location.getLocation();
//         print(_location.latitude.toString() + " " + _location.longitude.toString());
//         double lat=_location.latitude;
//         double log=_location.longitude;
//         Marker m=new Marker(markerId: MarkerId("User Location"),infoWindow: InfoWindow(title:"your current location"), position: LatLng(32.464634
//             ,35.293858));
//         markers.add(m);
//         double d= calculateDistance(lat,log,lat1,lng1);
//         print(lat1);
//         print(lng1);
//         print(d);
//         print("Now you are registered in the system");
//         return d;
//
//
//
// //for more  than one location(continuous taking of the location)
//
//         // location.onLocationChanged.listen((LocationData currentLocation) {
//         //   print(currentLocation.latitude.toString() + " " +
//         //       currentLocation.longitude.toString());
//         // });
//       }else{
//
//         _permissionGranted = await location.requestPermission();
//
//         if(_permissionGranted == PermissionStatus.granted)
//         {
//           _location = await location.getLocation();
//
//           print(_location.latitude.toString() + " " + _location.longitude.toString());
//
//
//           print('user allowed');
//
//         }else{
//
//           SystemNavigator.pop();
//
//         }
//
//       }
//
//     }else{
//
//       serviceEnabled = await location.requestService();
//
//       if(serviceEnabled)
//       {
//
//         _permissionGranted = await location.hasPermission();
//
//         if(_permissionGranted == PermissionStatus.granted)
//         {
//
//           print('user allowed before');
//
//         }else{
//
//           _permissionGranted = await location.requestPermission();
//
//           if(_permissionGranted == PermissionStatus.granted)
//           {
//
//             print('user allowed');
//
//           }else{
//
//             SystemNavigator.pop();
//
//           }
//
//         }
//
//
//       }else{
//
//         SystemNavigator.pop();
//
//       }
//
//     }
//
//   }
//
//   double calculateDistance(lat1, lon1, lat2, lon2){
//     print("distance calculation ");
//     var p = 0.017453292519943295;
//     var c = cos;
//     var a = 0.5 - c((lat2 - lat1) * p)/2 +
//         c(lat1 * p) * c(lat2 * p) *
//             (1 - c((lon2 - lon1) * p))/2;
//     print(12742 * asin(sqrt(a)));
//     double distance=12742 * asin(sqrt(a));
//     if(distance<12000){
//       List_Worker.add(widget.Location[i]);
//       var random = new Random();
//       int id =random.nextInt(100000);
//       Marker m=new Marker(markerId: MarkerId(id.toString()), infoWindow: InfoWindow(title:widget.Location[i]['namefirst']+" "+widget.Location[i]['namelast']+"على بعد "+distance.toString()), position: LatLng(double.parse(widget.Location[i]['lat']),double.parse(widget.Location[i]['lng'])),);
//       markers.add(m);
//       print("marker=================================================");
//     }
//     return distance;
//   }
//   Widget showgooglemap(List<Marker>mark){
//     print(mark.length);print("=========================================================================================================");
//     return Container(
//       height: 700,
//       child:Stack(
//         children: <Widget>[
//           GoogleMap(initialCameraPosition: CameraPosition(target:
//           LatLng(31.9474,35.2272),
//               zoom: 12),
//             markers:markers.toSet(),
//           ),
//         ],
//       ),
//     );
//
//   }
//
// }
//
import 'dart:async';
import 'dart:convert';
import "dart:io";
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import '../Inside_the_app/List_worker_group.dart';
import 'showworkers.dart';
String IP4="192.168.2.8";
bool showmap=false;
// var url = "http://maps.google.com/mapfiles/ms/icons/";
// url + = "blue";
int count =0;
List<dynamic>Worker;
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp1 extends StatefulWidget {
  final work;
  final name_Me;
  final namefirst_Me;
  final nameLast_Me;
  final phone_Me;
  final image_Me;
  final token_Me;
  final location;
  final country;
  MyApp1({this.country,this.token_Me,this.image_Me,this.namefirst_Me,this.nameLast_Me,this.phone_Me,this.work,this.name_Me,this.location});
 // final location;
 //   final work;
 //  final name_Me;
   //MyApp1({this.location,this.work,this.name_Me});
  _mState createState() => _mState();
}

class _mState extends State<MyApp1> {

  Future getMarker()async{
    var url='https://'+IP4+'/DUAA/PHP/markers.php';
    var ressponse=await http.post(url, body: {
      //"phone":list_ [i],
      "work":widget.work,

    });
    return json.decode(ressponse.body);(url);
    print(json.decode(ressponse.body));
    print("vvxbccccccccccccccccccccccc");
    return json.decode(ressponse.body);

  }
  @override
  Widget build(BuildContext context) {
    print("000000000000000000000000000000000000000");
    return Scaffold(
      //appBar: ,
      body:Column(
        children:<Widget>[
          Container(

            child: Text("Map show workers around you"),
          ),
          Expanded(

            child:Container(
              height: 100,
              child: FutureBuilder(
                  future: getMarker(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      print("has data================================================================================================");
                      //_MyHomePageState c= new _MyHomePageState();
                      return ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          var Listr=snapshot.data;
                          print(Listr[0]['lng']);
                          return w(Location:Listr,work:widget.work,name_Me:widget.name_Me,country:widget.country,token_Me:widget.token_Me,image_Me:widget.image_Me,phone_Me:widget.phone_Me,nameLast_Me:widget.nameLast_Me,namefirst_Me:widget.namefirst_Me);
                        },);
                    }
                    return Container(
                      //child:Text("hi"),
                    );

                  }
              ),
            ),),],),);


  }
}
class w extends StatefulWidget {
  List<dynamic>Location;
  final work;
  final name_Me;
  final namefirst_Me;
  final nameLast_Me;
  final phone_Me;
  final image_Me;
  final token_Me;

  final country;
  w({this.country,this.token_Me,this.image_Me,this.namefirst_Me,this.nameLast_Me,this.phone_Me,this.work,this.name_Me,this.Location});
  //w({this.Location,this.work});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<w> {
  PermissionStatus _permissionGranted;
  bool serviceEnabled;
  int i=0;
  var List_Worker=[];
  var list_=[];
  List<Marker> markers=[];
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  get url => null;
  @override
  void initState() {
    super.initState();
  }
  bool S=false;
  Fetch()async{
    for(;i<widget.Location.length;i++){
      await checkLocationServicesInDevice(double.parse(widget.Location[i]['lat']),double.parse(widget.Location[i]['lng']));
    }
    setState(() {
      S=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    Fetch();
    return S?Container(
      height: 700,
      child:showgooglemap(markers),):Center(child: CircularProgressIndicator() ,

   );
    //  child:FutureBuilder(
    //    future: checkLocationServicesInDevice(),
    //      builder: (BuildContext context, AsyncSnapshot <double>snapshot) {
    //        if (snapshot.hasData) {
    //          print("================================================111111");
    //              return Container(child:Text(snapshot.data.toString()),);
    //        }
    //        return Center(child: CircularProgressIndicator());
    //
    //      }
    //
    // ),
  }
  // @override
  Future <double>checkLocationServicesInDevice(double lat1,double lng1) async {
    print("i am in location");
    Location location = new Location();
    LocationData _location ;
    serviceEnabled = await location.serviceEnabled();

    if(serviceEnabled)
    {

      _permissionGranted = await location.hasPermission();

      if(_permissionGranted == PermissionStatus.granted)
      {
        _location = await location.getLocation();
        print(_location.latitude.toString() + " " + _location.longitude.toString());
        double lat=_location.latitude;
        double log=_location.longitude;
        Marker m=new Marker(markerId: MarkerId("User Location"),infoWindow: InfoWindow(title:"your current location"), position: LatLng(32.464634
            ,35.293858),icon: BitmapDescriptor.defaultMarkerWithHue
          (BitmapDescriptor.hueCyan),
        );
        markers.add(m);
        double d= calculateDistance(32.464634,35.293858,lat1,lng1);
        print(lat1);
        print(lng1);
        print(d);
        print("Now you are registered in the system");
        return d;



//for more  than one location(continuous taking of the location)

        // location.onLocationChanged.listen((LocationData currentLocation) {
        //   print(currentLocation.latitude.toString() + " " +
        //       currentLocation.longitude.toString());
        // });
      }else{

        _permissionGranted = await location.requestPermission();

        if(_permissionGranted == PermissionStatus.granted)
        {
          _location = await location.getLocation();

          print(_location.latitude.toString() + " " + _location.longitude.toString());


          print('user allowed');

        }else{

          SystemNavigator.pop();

        }

      }

    }else{

      serviceEnabled = await location.requestService();

      if(serviceEnabled)
      {

        _permissionGranted = await location.hasPermission();

        if(_permissionGranted == PermissionStatus.granted)
        {

          print('user allowed before');

        }else{

          _permissionGranted = await location.requestPermission();

          if(_permissionGranted == PermissionStatus.granted)
          {

            print('user allowed');

          }else{

            SystemNavigator.pop();

          }

        }


      }else{

        SystemNavigator.pop();

      }

    }

  }

  double calculateDistance(lat1, lon1, lat2, lon2){
    print("distance calculation ");
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    print(12742 * asin(sqrt(a)));
    double distance=12742 * asin(sqrt(a));
    if(distance<12000){
      list_.add(widget.Location[i]['phoneworker']);
      print("Duaa");
      print( list_.toString());
     // print(list_[1]);
      List_Worker.add(widget.Location[i]);
      var random = new Random();
      int id =random.nextInt(100000);
      Marker m=new Marker(markerId: MarkerId(id.toString()), infoWindow: InfoWindow(title:widget.Location[i]['namefirst']+" "+widget.Location[i]['namelast']+"على بعد "+distance.toString()), position: LatLng(double.parse(widget.Location[i]['lat']),double.parse(widget.Location[i]['lng'])),);
      markers.add(m);
      print("marker=================================================");
    }
    return distance;
  }
  Widget showgooglemap(List<Marker>mark){
    print(mark.length);print("=========================================================================================================");
    return Container(
      height: 700,
      child:Stack(
        children: <Widget>[
         showmap==true?  Container(
        height: 500,
        width: 500,
        // color:  Color(0xFFF3D657),
        margin: EdgeInsets.only(top:150),
        //padding:EdgeInsets.only(right:25,left: 25),
        decoration: BoxDecoration(
          // color:Color(0xFF1C1C1C),
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(50),
          //   topRight: Radius.circular(50),
          // ),
        ),
        child:FutureBuilder(
          future: getWorkers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount:snapshot.data.length,
                itemBuilder: (context, index) {
                  var Listslot=snapshot.data;
                  double Rate;
                  print(snapshot.data.length);
                  print(snapshot.data[index]['name']);
                  if(snapshot.data[index]['name']==null && snapshot.data[index]['namefirst']==null && snapshot.data[index]['namelast']==null && snapshot.data[index]['phone']==null && snapshot.data[index]['image']==null && snapshot.data[index]['Work']==null && snapshot.data[index]['Experiance']==null && snapshot.data[index]['Information']==null && snapshot.data[index]['token']==null)
                  {return Container();}
                  if(snapshot.data[index]['AVG']==null){Rate=0.0;}
                  else{ Rate =roundDouble(double.parse(snapshot.data[index]['AVG']),1);}
                  if (list_.any((item) => snapshot.data[index]['phone'].contains(item))) {
                    return Group(namefirst_Me:widget.namefirst_Me,nameLast_Me:widget.nameLast_Me,phone_Me:widget.phone_Me,image_Me:widget.image_Me,Rate:Rate,name_Me:widget.name_Me,name:snapshot.data[index]['name'],namefirst:snapshot.data[index]['namefirst'],namelast:snapshot.data[index]['namelast'],phone:snapshot.data[index]['phone'],image:snapshot.data[index]['image'],Work:snapshot.data[index]['Work'],Experiance:snapshot.data[index]['Experiance'],Information:snapshot.data[index]['Information'],token:snapshot.data[index]['token']);
                    return Container(child: Text('bggngn'),);
                  }
                  return Center(child:Text("No data"));
                },
              );
            }

            // Lists have at least one common element

            else {
              // Li

              return Center(child: CircularProgressIndicator());
            }
          },
        ),):
          GoogleMap(initialCameraPosition: CameraPosition(target:
          LatLng(31.9474,35.2272),
              zoom: 12),
            markers:markers.toSet(),
          ),

          IconButton(
            icon: Icon(Icons.add_location_rounded),
            onPressed: (){
             // showmap=true;
              print(showmap);
              setState(() {
            showmap=!showmap;
         });
          },
            ),
        ],
      ),

    );

  }

  double roundDouble(double value, int places){
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  getWorkers( )async{


    var url = 'https://'+IP4+'/DUAA/PHP/w.php';
   // for(int i=0;i<list_.length;i++){
    var ressponse = await http.post(url, body: {
      //"phone":list_ [i],
      "work":widget.work,

    });
    return json.decode(ressponse.body);

  }
//}



  getshowWorkers( ) {
    Container(
        height: 100,
        child: FutureBuilder(
        future: getWorkers(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
    print("HasData");
    //_MyHomePageState c= new _MyHomePageState();
    return ListView.builder(
    itemCount: 1,
    //itemBuilder: (context, index) {
    itemBuilder: (context, index) {
    //=snapshot.data[index]['name'];



   // print(Listr[0]['lng']);
    return show(name:snapshot.data[index]['name'],namefirst:snapshot.data[index]['namefirst'],namelast:snapshot.data[index]['namelast'],phone:snapshot.data[index]['phone'],image:snapshot.data[index]['image'],Work:snapshot.data[index]['Work'],Experiance:snapshot.data[index]['Experiance'],Information:snapshot.data[index]['Information'],token:snapshot.data[index]['token']);
    },);
    }
    return Container(
    //child:Text("hi"),
    );


  }),);

}}

