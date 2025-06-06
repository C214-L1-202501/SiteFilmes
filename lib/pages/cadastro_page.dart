import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _dataNascimentoController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _dataNascimentoController.dispose();
    _loginController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _dataNascimentoController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _cadastrar() {
    if (_formKey.currentState!.validate()) {
      final nome = _nomeController.text;
      final dataNascimento = _dataNascimentoController.text;
      final login = _loginController.text;
      final senha = _senhaController.text;

      // Aqui você pode adicionar o salvamento dos dados ou enviar para um backend
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cadastro de $nome realizado com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: const Color(0xFF4A148C),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) => value!.isEmpty ? 'Digite seu nome' : null,
              ),
              TextFormField(
                controller: _dataNascimentoController,
                decoration: const InputDecoration(labelText: 'Data de nascimento'),
                readOnly: true,
                onTap: () => _selecionarData(context),
                validator: (value) => value!.isEmpty ? 'Selecione a data de nascimento' : null,
              ),
              TextFormField(
                controller: _loginController,
                decoration: const InputDecoration(labelText: 'Login'),
                validator: (value) => value!.isEmpty ? 'Digite o login' : null,
              ),
              TextFormField(
                controller: _senhaController,
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Digite a senha' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _cadastrar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A148C),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
