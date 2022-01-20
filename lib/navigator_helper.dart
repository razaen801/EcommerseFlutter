// import 'package:flutter/widgets.dart';
// class NavigatorWithId extends Navigator {
//   const NavigatorWithId(
//       {Key key,
//         @required this.id,
//         String initialRoute,
//         @required RouteFactory onGenerateRoute,
//         RouteFactory onUnknownRoute,
//         List<NavigatorObserver> observers = const <NavigatorObserver>[]})
//       : assert(onGenerateRoute != null),
//         assert(id != null),
//         super(
//         key: key,
//         initialRoute: initialRoute,
//         onGenerateRoute: onGenerateRoute,
//         onUnknownRoute: onUnknownRoute,
//         observers: observers,
//       );
//
//   // when id is null, the `of` function returns top most navigator
//   final int id;
//
//   static NavigatorState of(BuildContext context, {int id, ValueKey<String> key}) {
//     final NavigatorState state = Navigator.of(
//       context,
//       rootNavigator: id == null,
//     );
//     if (state.widget is NavigatorWithId) {
//       // ignore: avoid_as
//       if ((state.widget as NavigatorWithId).id == id) {
//         return state;
//       } else {
//         return of(state.context, id: id);
//       }
//     }
//
//     return state;
//   }
// }