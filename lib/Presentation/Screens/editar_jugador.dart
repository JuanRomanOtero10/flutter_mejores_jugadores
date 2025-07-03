import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/Entities/jugador.dart';
import 'package:myapp/Presentation/providers.dart';

class EditarJugador extends ConsumerWidget {
  const EditarJugador({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jugador = ref.watch(jugadorSeleccionadoProvider);
    if (jugador == null) {
      return const Scaffold(
        body: Center(child: Text('No se seleccionó ningún jugador')),
      );
    }

    final goles = TextEditingController(text: jugador.goles.toString());
    final asistencias = TextEditingController(text: jugador.asistencias.toString());
    final fotoUrl = TextEditingController(text: jugador.fotoUrl);
    final descripcion = TextEditingController(text: jugador.descripcion);


    return Scaffold(
      appBar: AppBar(title: Text('Editar ${jugador.nombre}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Foto Url'),
              TextField(
                controller: fotoUrl,
                decoration:InputDecoration(
                  labelText:"FotoUrl",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              ),
              const SizedBox(height: 20),
              Text('Descripción'),
              TextField(
                controller: descripcion,
                decoration: InputDecoration(
                  labelText:"Descripcion",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: goles,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                      labelText:"Goles",
                      filled: true,
                      fillColor: Colors.grey[200],
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),

                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: asistencias,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                      labelText:"Asistencias",
                      filled: true,
                      fillColor: Colors.grey[200],
                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (descripcion.text.isEmpty ||fotoUrl.text.isEmpty ||goles.text.isEmpty ||asistencias.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Campo vacío"),
                        duration: Duration(seconds: 2),
                        backgroundColor: Color.fromARGB(255, 241, 67, 55),
                      ),
                    );
                    return; 
                  }

                  final actualizado = Jugador(
                    id: jugador.id,
                    nombre: jugador.nombre,
                    descripcion: descripcion.text,
                    nacionalidad: jugador.nacionalidad,
                    nacimiento: jugador.nacimiento,
                    goles: int.tryParse(goles.text) ?? 0,
                    asistencias: int.tryParse(asistencias.text) ?? 0,
                    fotoUrl: fotoUrl.text,
                  );

                  final jugadores = ref.read(mejoresJugadoresProvider).toList();
                  final index = jugadores.indexWhere((j) => j.id == jugador.id);
                  if (index != -1) {
                    jugadores[index] = actualizado;
                    ref.read(mejoresJugadoresProvider.notifier).state = jugadores;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Jugador actualizado"),
                      backgroundColor: Color.fromARGB(255, 46, 49, 238),
                      duration: Duration(seconds: 2),
                    ),
                  );

                  context.go('/jugadores');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text("Guardar cambios"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


