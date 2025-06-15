import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/Entities/jugador.dart'; 


final mejoresJugadoresProvider = StateProvider<List<Jugador>>((ref) => mejoresJugadores);
final jugadorSeleccionadoProvider = StateProvider<Jugador?>((ref) => null);
