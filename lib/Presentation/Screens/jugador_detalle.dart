// jugador_detalle.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/Presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JugadorDetalle extends ConsumerWidget {
  const JugadorDetalle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jugador = ref.watch(jugadorSeleccionadoProvider);
    if (jugador == null) {
      return const Scaffold(
        body: Center(child: Text('No se seleccionó ningún jugador')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(jugador.nombre)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detalles de ${jugador.nombre}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              jugador.descripcion,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),
            Text(
              'Nacionalidad: ${jugador.nacionalidad}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Nacimiento: ${jugador.nacimiento}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Goles: ${jugador.goles}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Asistencias: ${jugador.asistencias}',
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        context.push('/editar');
                      },
                      child: const Text(
                        'Editar',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 35,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        final borrar =
                            ref.read(mejoresJugadoresProvider).toList();
                        borrar.remove(jugador);
                        ref.read(mejoresJugadoresProvider.notifier).state =
                            borrar;
                        context.go('/jugadores');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                      ),
                      icon: const Icon(Icons.delete),
                      label: const Text(
                        'Borrar',
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
