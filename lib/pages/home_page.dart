import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
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
            )
          ],
        ),
      ),
    );
  }
}