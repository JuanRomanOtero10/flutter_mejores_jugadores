class Jugador {
  int id;
  int posicion;
  String nombre;
  String descripcion;
  String fotoUrl;
  int nacimiento;
  String nacionalidad;
  int goles;
  int asistencias;

  Jugador({
    required this.id,
    required this.posicion,
    required this.nombre,
    required this.descripcion,
    required this.fotoUrl,
    required this.nacimiento,
    required this.nacionalidad,
    required this.goles,
    required this.asistencias,
  });
}

final List<Jugador> mejoresJugadores = [
  Jugador(
    id: 1,
    posicion: 1,
    nombre: "Lionel Messi",
    descripcion: "Máximo goleador histórico del Barcelona y Argentina, también líder en asistencias.",
    fotoUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToy7GioTB1TJavzWw1BiSCF9yh7V1AXwkK3Q&s",
    nacimiento: 1987,
    nacionalidad: "Argentina",
    goles: 863,
    asistencias: 381,
  ),
  Jugador(
    id: 2,
    posicion: 2,
    nombre: "Pelé",
    descripcion: "Uno de los máximos goleadores de todos los tiempos, tricampeón mundial con Brasil.",
    fotoUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAqWMza90kWtJKy521_FFJVyp8YPNFXSDUBw&s",
    nacimiento: 1940,
    nacionalidad: "Brasil",
    goles: 760,
    asistencias: 230,
  ),
  Jugador(
    id: 3,
    posicion: 3,
    nombre: "Diego Maradona",
    descripcion: "Genio argentino, famoso por su talento y liderazgo en la Copa del Mundo de 1986.",
    fotoUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Maradona-Mundial_86_con_la_copa.JPG/1200px-Maradona-Mundial_86_con_la_copa.JPG",
    nacimiento: 1960,
    nacionalidad: "Argentina",
    goles: 350,
    asistencias: 160,
  ),
  Jugador(
    id: 4,
    posicion: 4,
    nombre: "Cristiano Ronaldo",
    descripcion: "Goleador histórico en varias ligas europeas y la selección portuguesa.",
    fotoUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh8dI2LtDgWLW5X6_FqV1CcsfgrypvcmC5Yg&s",
    nacimiento: 1985,
    nacionalidad: "Portugal",
    goles: 936,
    asistencias: 257,
  ),
  Jugador(
    id: 5,
    posicion: 5,
    nombre: "Johan Cruyff",
    descripcion: "Revolucionó el fútbol con su estilo y visión en el juego total.",
    fotoUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Johan_Cruyff_1974c.jpg/1200px-Johan_Cruyff_1974c.jpg",
    nacimiento: 1947,
    nacionalidad: "Países Bajos",
    goles: 400,
    asistencias: 150,
  ),
  Jugador(
    id: 6,
    posicion: 6,
    nombre: "Ronaldo Nazario",
    descripcion: "Delantero brasileño, considerado uno de los mejores goleadores de la historia.",
    fotoUrl: "https://static.abc.es/media/deportes/2018/06/12/ronaldo-mundial-kYb--1248x698@abc.jpg",
    nacimiento: 1976,
    nacionalidad: "Brasil",
    goles: 350,
    asistencias: 100,
  ),
  Jugador(
    id: 7,
    posicion: 7,
    nombre: "Zinedine Zidane",
    descripcion: "Mediocampista con gran técnica, artífice de grandes títulos para Francia y Real Madrid.",
    fotoUrl: "https://www.espn.com.ar/2003/photos2013/1119/g_zidane98_300x400.jpg",
    nacimiento: 1972,
    nacionalidad: "Francia",
    goles: 125,
    asistencias: 90,
  ),
  Jugador(
    id: 8,
    posicion: 8,
    nombre: "Franz Beckenbauer",
    descripcion: "Ícono del fútbol alemán, creador del rol de líbero moderno.",
    fotoUrl: "https://a3.espncdn.com/combiner/i?img=%2Fphoto%2F2020%2F0417%2Fr690190_1296x729_16%2D9.jpg",
    nacimiento: 1945,
    nacionalidad: "Alemania",
    goles: 120,
    asistencias: 80,
  ),
  Jugador(
    id: 9,
    posicion: 9,
    nombre: "Ronaldinho",
    descripcion: "Mágico brasileño que combinaba goles y asistencias con un talento único.",
    fotoUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsd-9tdhRChHMXX0E5pzAfefKP1yCzDgnG8g&s",
    nacimiento: 1980,
    nacionalidad: "Brasil",
    goles: 280,
    asistencias: 180,
  ),
  Jugador(
    id: 10,
    posicion: 10,
    nombre: "Alfredo Di Stéfano",
    descripcion: "Figura legendaria en el Real Madrid, símbolo de eficacia y clase.",
    fotoUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCN1wwKbner6VdEuvXfQtdydRH3t10jqcjsw&s",
    nacimiento: 1926,
    nacionalidad: "Argentina",
    goles: 380,
    asistencias: 140,
  ),
];
