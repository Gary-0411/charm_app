import 'package:charm_app/model/main/main_page.dart';
import 'package:flutter/material.dart';

const String homeRoute = '/';
const String biliPhotoDetailRoute = '/biliPhotoDetail';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  homeRoute: (BuildContext context) => MainPage(),
};
