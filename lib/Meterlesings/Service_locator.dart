
import 'dart:async';
import 'package:get_it/get_it.dart';
import 'html.dart';

final sl = GetIt.instance;

void setupServiceLocator()  
{
  sl.registerSingleton<UsersHtml>(UsersHtml());

}
