import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/Entities/jugador.dart';
import 'package:myapp/Presentation/providers.dart';

class AddJugador extends ConsumerWidget {
  const AddJugador({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    TextEditingController nombre = TextEditingController();
    TextEditingController nacionalidad = TextEditingController();
    TextEditingController goles = TextEditingController();
    TextEditingController asistencias = TextEditingController();
    TextEditingController nacimiento = TextEditingController();
    TextEditingController fotoUrl = TextEditingController();
    TextEditingController descripcion = TextEditingController();


    return Scaffold(
      appBar: AppBar(title: const Text("Agregar Jugador")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: nombre,
                      decoration: InputDecoration(
                        hintText: "Nombre completo",
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: nacionalidad,
                      decoration: InputDecoration(
                        hintText: "Nacionalidad",
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: nacimiento,
                      decoration: InputDecoration(
                        hintText: "Año Nacimiento",
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: goles,
                      decoration: InputDecoration(
                        hintText: "Goles",
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: asistencias,
                      decoration: InputDecoration(
                        hintText: "Asistencias",
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: fotoUrl,
                      decoration: InputDecoration(
                        hintText: "Foto URL",
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: descripcion,
                      decoration: InputDecoration(
                        hintText: "Descripción",
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (nombre.text.isEmpty ||
                      descripcion.text.isEmpty ||
                      fotoUrl.text.isEmpty ||
                      nacimiento.text.isEmpty ||
                      goles.text.isEmpty ||
                      asistencias.text.isEmpty ||
                      nacionalidad.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Campo vacío"),
                        duration: Duration(seconds: 2),
                        backgroundColor: Color.fromARGB(255, 241, 67, 55),
                      ),
                    );
                    return;
                  }

                  final nuevoJugador = Jugador(
                    id: ref.read(mejoresJugadoresProvider.notifier).state.length + 1,
                    nombre: nombre.text,
                    descripcion: descripcion.text,
                    nacionalidad: nacionalidad.text,
                    nacimiento: int.tryParse(nacimiento.text) ?? 0,
                    goles: int.tryParse(goles.text) ?? 0,
                    asistencias: int.tryParse(asistencias.text) ?? 0,
                    fotoUrl: fotoUrl.text,
                  );

                  final copia = ref.read(mejoresJugadoresProvider).toList();
                  copia.add(nuevoJugador);
                  ref.read(mejoresJugadoresProvider.notifier).state = copia;

                  nombre.clear();
                  nacionalidad.clear();
                  nacimiento.clear();
                  goles.clear();
                  asistencias.clear();
                  fotoUrl.clear();
                  descripcion.clear();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Jugador Agregado"),
                      backgroundColor: Color.fromARGB(255, 46, 49, 238),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  context.go('/jugadores');
                },
                child: const Text("Agregar jugador"),
              ),
            ],
          ),
        ),
      ),
    );
    }
}