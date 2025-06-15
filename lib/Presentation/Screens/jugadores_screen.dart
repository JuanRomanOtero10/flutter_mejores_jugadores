import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/Presentation/providers.dart';



class JugadoresScreen extends ConsumerWidget {
  const JugadoresScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
  final jugadorList = ref.watch(mejoresJugadoresProvider);
    jugadorList.sort((a, b) => a.posicion.compareTo(b.posicion));
    return Scaffold(
      appBar: AppBar(title: const Text("Mejores Jugadores de la Historia")),
      body: ListView.builder(
        itemCount: jugadorList.length,
        itemBuilder: (context, index) {
          final jugador = jugadorList[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: Image.network(
                jugador.fotoUrl ,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              title: Text(jugador.nombre),
              subtitle: Text(
                '${jugador.nacionalidad} · Nacido en ${jugador.nacimiento}\n'
                'Goles: ${jugador.goles} · Asistencias: ${jugador.asistencias}',
              ),
              onTap: () {
                ref.read(jugadorSeleccionadoProvider.notifier).state = jugador; 
                context.push('/detalle');
              },
            ),
          );
        },
      ),
      floatingActionButton: 
      FloatingActionButton(
        onPressed: () {
          context.push('/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
