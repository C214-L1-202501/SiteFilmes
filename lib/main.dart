import 'package:flutter/material.dart';
import 'package:projeto_c214/widgets/movie_card.dart';
import 'package:projeto_c214/widgets/search_field.dart';
import 'package:projeto_c214/pages/cadastro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Análise de Filmes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Análise de Filmes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> movies = List.generate(16, (_) => MovieCard());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Cor roxa escura no topo
        backgroundColor: const Color(0xFF4A148C),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white, // Texto branco
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // Ícones brancos
      ),

      // MENU LATERAL (DRAWER)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF4A148C),
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Filmes'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('Cadastro'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CadastroPage()),
                );
              },
            ),
          ],
        ),
      ),

      // COR DE FUNDO DO BODY
      backgroundColor: const Color(0xFFF3E5F5), // Roxo bem clarinho

      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchField(
              labelText: 'Pesquisar',
              hintText: 'Digite o que quer pesquisar',
              helperText: 'O resultado aparecerá na Snackbar',
              onSearch: (input) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Foi digitado $input na barra de pesquisa'),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(10),
              children: movies,
            ),
          ),
        ],
      ),
    );
  }
}
