
import 'package:flutter/material.dart';


class CartFull extends StatefulWidget {
  final namelast;final namefirst;final describes;final nameofwork;
  CartFull({this.namelast,this.namefirst,this.describes,this.nameofwork});
  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    //final themeChange = Provider.of<DarkThemeProvider>(context);
       return  Directionality( textDirection: TextDirection.rtl,
    child:Container(
      height: 250,
      width: 200,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: const Radius.circular(16.0),
          topRight: const Radius.circular(16.0),
        ),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'تفاصيل الطلب',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32.0),
                          // splashColor: ,
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('اسم العميل:'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.namefirst+"  "+widget.namelast,
                        style:
                            TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('نوع الورشة :'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.nameofwork,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: 
                            // themeChange.darkTheme
                            //     ? Colors.brown.shade900
                                //:
                                 Theme.of(context).accentColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      // Text(
                      //   widget.describes,
                      //   style: TextStyle(
                      //       color:
                      //       // themeChange.darkTheme
                      //           // ? Colors.brown.shade900
                      //           // :
                      //           Theme.of(context).accentColor),
                      // ),
                      Spacer(),

                       Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4.0),
                          // splashColor: ,
                          onTap: () {},
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.add,
                                color: Colors.green,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),);
  }
}
