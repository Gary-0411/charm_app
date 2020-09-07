import 'package:flutter/cupertino.dart';

class GanMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GanMainState();
  }
}

class GanMainState extends State<GanMainPage> {
  @override
  Widget build(BuildContext context) {
    // print("GanMainState");
    return Text("GanMainPage");
  }

  @override
  void initState() {
    super.initState();
    // print("initState");
  }

  // @override
  // void didChangeDependencies() {
  //   print("didChangeDependencies");
  // }
  //
  // @override
  // void deactivate() {
  //   print("deactivate");
  // }
  //
  // @override
  // void reassemble() {
  //   print("reassemble");
  // }
  //
  // @override
  // void didUpdateWidget(GanMainPage oldWidget) {
  //   print("didUpdateWidget");
  // }
}
