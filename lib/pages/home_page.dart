import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  List _imageUrls = [
    "http://b165.photo.store.qq.com/psb?/V14ADDL81KXrD7/BYEw7pMYjwOKIwt4gReNSNF4hdwdNV4KUgzDxIZ1dhI!/b/dN0eX2KNLwAA&bo=IAMVAkAGKwQBCnA!&rf=viewer_4",
    "http://b168.photo.store.qq.com/psb?/V14ADDL81KXrD7/C1lfS*3LX9mOmpqNEYRaM.MZnIDIafLEjUa95Czvkeg!/b/dGSULWTYFQAA&bo=IAMVAkAGKwQBKlA!&rf=viewer_4",
    "http://b168.photo.store.qq.com/psb?/V14ADDL81KXrD7/OBcukGL*DaFpTp3oVmChVl7GKe4cVbcLq93n6Iw8HgM!/b/dMNyJ2QmFAAA&bo=IAMVAkAGKwQBCnA!&rf=viewer_4",
  ];
  double appBarAlpha=0;

  _onScroll(offset){

//    appBarAlpha
    double alpha = offset/APPBAR_SCROLL_OFFSET;
    if(alpha<0){
      alpha = 0;
    }else if(alpha>1){
      alpha = 1;
    }
    setState(() {
      appBarAlpha=alpha;
    });
    print(appBarAlpha);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
                return;
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Swiper(
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      pagination: SwiperPagination(),
                      itemBuilder: (BuildContext context,int index){
                        return Image.network(
                          _imageUrls[index],
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 800,
                    child: ListTile(title: Text('haha'),),
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                ),

              ),
            ),
          )
        ],
      )
    );
  }
}