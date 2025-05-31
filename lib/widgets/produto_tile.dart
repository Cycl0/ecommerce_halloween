import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../screens/detalhes_screen.dart';

class ProdutoTile extends StatelessWidget {
  final Produto produto;
  const ProdutoTile({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(produto.emoji, style: const TextStyle(fontSize: 24)),
      title: Text(produto.nome),
      subtitle: Text('R\$ ${produto.preco.toStringAsFixed(2)}'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalhesScreen(produto: produto),
          ),
        );
      },
    );
  }
}
