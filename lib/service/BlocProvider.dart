import "package:flutter/material.dart";
import "package:recap2019/service/BottomNavBloc.dart";

class BlocProvider extends InheritedWidget {

  get bottomNavBloc => BottomNavBloc();

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static BottomNavBloc of(BuildContext context) => 
    (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bottomNavBloc;

}
