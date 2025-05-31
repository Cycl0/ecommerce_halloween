import 'package:flutter/material.dart';
import '../models/carrinho.dart';

class CarrinhoItemWidget extends StatelessWidget {
  final CarrinhoItem item;
  const CarrinhoItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(item.produto.emoji, style: const TextStyle(fontSize: 28)),
      title: Text(item.produto.nome),
      subtitle: Text('Quantidade: ${item.quantidade}'),
      trailing: Text(
        'R\$ ${(item.produto.preco * item.quantidade).toStringAsFixed(2)}',
      ),
    );
  }
}
