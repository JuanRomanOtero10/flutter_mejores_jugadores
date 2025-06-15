import 'package:flutter/material.dart';
import 'package:myapp/Entities/Usuarios.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  

  String inputNombre = "";
  String inputContrasena = "";
  bool ocultar = true;
  TextEditingController usuario = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [     
              
              SizedBox(                               //USUARIO
                width:200,
                child: TextField(
                  controller: usuario,
                  decoration: InputDecoration(
                    hintText: "Correo Electronico",
                    filled: true,
                    fillColor: Colors.grey[200], 
                  ),
                  )
                ),
              const SizedBox(height: 20),

              SizedBox(                             //CONTRASEÑA
                width: 200,
                child: Stack(
                  alignment: Alignment.centerRight,  
                  children: [
                    TextField(
                      controller: password,
                      obscureText: ocultar,
                      decoration: InputDecoration(
                        hintText: "Contraseña",
                        filled: true,
                        fillColor: Colors.grey[200], 
                        contentPadding: const EdgeInsets.only(right: 40), 
                      ),
                    ),

                    Positioned(
                      right: 0, 
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            ocultar = !ocultar;
                          });
                        },
                        icon: Icon(
                          ocultar ? Icons.visibility : Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Builder(                                        //BOTON
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    setState(() {
                      inputNombre = usuario.text;
                      inputContrasena = password.text;
                      if (inputNombre.isEmpty || inputContrasena.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Campo vacio"),
                            duration: Duration(seconds: 2),
                            backgroundColor: Color.fromARGB(255, 241, 67, 55),
                          ),
                        );
                      }
                      else {
                        final usuarioEncontrado= Usuarios.firstWhere(
                          (user)=>user.gmail== inputNombre,
                          orElse: () => Usuario(gmail: '', contrasena: ''),
                        ) ;

                        if (usuarioEncontrado.gmail == '') {
                           ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Usuario incorrecto"),
                              backgroundColor: Color.fromARGB(255, 241, 67, 55),
                              duration: Duration(seconds: 2),
                               ),
                          );
                        }
                        else if(usuarioEncontrado.contrasena!= inputContrasena){
                          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Contraseña incorrecta"),
                            duration: Duration(seconds: 2),
                            backgroundColor: Color.fromARGB(255, 241, 67, 55),
                          ),
                          );
                        }
                        else{
                          context.go('/jugadores');
                        }
                        
                      } 
                    });
                  },
                  child: const Text('INICIAR SESIÓN'),
                  ),
                ),
            ]
          ),
        ),
      );
  }
}