import 'package:flicker_api_app/features/photoes/presentation/pages/photoes_page.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  //Routes
  static const String mainPath = '/';
  static const String locationPath = '/photos';

  static final router = GoRouter(
    initialLocation: locationPath,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: "/photos",
        builder: (context, state) {
          return const PhotosPage();
        },
      ),
    ],
  );
}
