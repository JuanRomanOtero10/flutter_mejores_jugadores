import 'package:go_router/go_router.dart';
import 'package:myapp/Presentation/Screens/add_jugador.dart';
import 'package:myapp/Presentation/Screens/editar_jugador.dart';
import 'package:myapp/Presentation/Screens/jugador_detalle.dart';
import 'package:myapp/Presentation/Screens/login_screen.dart';
import 'package:myapp/Presentation/Screens/jugadores_screen.dart';



final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path:'/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/jugadores',
      builder: (context, state) => JugadoresScreen(),
      ),
    GoRoute(
      path: '/detalle',
      builder: (context, state) => JugadorDetalle(),
      ),
    GoRoute(
      path: '/add',
      builder: (context, state) => AddJugador(),
      ),
      GoRoute(
      path:'/editar',
      builder: (context, state) => EditarJugador(),
    )
  ]
);