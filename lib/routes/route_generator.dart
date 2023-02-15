import 'package:flutter/material.dart';
import 'package:vistaar_assignment_app/model/movie_data.dart';
import 'package:vistaar_assignment_app/routes/route_name.dart';
import 'package:vistaar_assignment_app/screen/home_screen.dart';
import 'package:vistaar_assignment_app/screen/username_screen.dart';

import '../screen/details_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const UserNameScreen());
      case RouteName.homeScreen:
        return MaterialPageRoute<Widget>(
          builder: (_) => const HomeScreen(),
        );
      case RouteName.detailScreen:
        MovieData arguments = settings.arguments as MovieData;
        return MaterialPageRoute<Widget>(
          builder: (_) => DetailsScreen(
            movieData: arguments,
          ),
        );
      default:
        return MaterialPageRoute<Widget>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
