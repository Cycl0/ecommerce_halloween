import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../screens/detalhes_screen.dart';

class ProdutoItem extends StatelessWidget {
  final Produto produto;
  const ProdutoItem({Key? key, required this.produto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(produto.emoji, style: const TextStyle(fontSize: 28)),
      title: Text(produto.nome),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => DetalhesScreen(produtoId: produto.id),
          ),
        );
      },
    );
  }
}
