// ignore_for_file: unused_element, constant_identifier_names, depend_on_referenced_packages, prefer_const_constructors
import 'package:artisan/pages/login_page.dart';
import 'package:get/get.dart';

const String login = "/lgin_screen";


List<GetPage> getPages = [
  GetPage(name: login, page: () => LoginPage()),
];