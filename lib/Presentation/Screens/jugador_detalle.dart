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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                jugador.fotoUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'jugador.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  );
                },
              ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 30),
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
                        showDialog(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                title: const Text("Eliminar"),
                                content: Text(
                                  "¿Estás seguro que querés eliminar a ${jugador.nombre}?",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("Cancelar"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      final borrar =ref.read(mejoresJugadoresProvider).toList(); 
                                      borrar.remove(jugador);
                                      ref.read(mejoresJugadoresProvider.notifier,).state = borrar;
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("${jugador.nombre} ha sido eliminado."),
                                          backgroundColor: const Color.fromARGB(255, 46, 49, 238),
                                          duration: const Duration(seconds: 2),
                                        ),
                                      );
                                      context.go('/jugadores');
                                    },
                                    child: const Text(
                                      "Borrar",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                        );
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
