import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class RxDartPage extends StatelessWidget {
  const RxDartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("rxdart"),
      ),
      body: RxdartBody(

      ),
    );
  }
}


class RxdartBody extends StatefulWidget {
  RxdartBody({Key key}) : super(key: key);

  _RxdartBodyState createState() => _RxdartBodyState();
}

class _RxdartBodyState extends State<RxdartBody> {
  @override
  void initState() {
    super.initState();
    // Observable<String> _observable = 
    //   // Observable.fromIterable(["today","is","a","lucky","day"]);
    //   // Observable.fromFuture(Future.value("hello"));
    //   // Observable(Stream.fromIterable(["hello","world"]));
    //   // Observable.just("hello world");
    //   Observable.periodic(Duration(seconds:1),(repeatCount)=>repeatCount.toString());
    // _observable.listen(print);

    PublishSubject<String> _subject = PublishSubject<String>();
    _subject.listen((data)=>print(data));
    _subject.add("hello");
    _subject.listen((data)=>print("I have received a message:$data"));
    _subject.add("you look like a good guy");
  }


  @override
  Widget build(BuildContext context) {
    return Container(
       
    );
  }
}