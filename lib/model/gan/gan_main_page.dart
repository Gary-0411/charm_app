import 'package:charm_app/model/gan/dio_util.dart';
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
    DioUtil.get(
        "Photo/list?category=cos&type=hot&page_num=0&page_size=20",
       );
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
