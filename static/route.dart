
import 'package:delivery/funcation/middleware.dart';
import 'package:delivery/static/pagename.dart';
import 'package:delivery/view/home/homepage.dart';
import 'package:delivery/view/login.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routs = [
  GetPage(name:"/",page: () =>const Login() ,middlewares: [Middleware()]),
  GetPage(name:Pagename.homepage,page: () =>const Homepage() )
];
