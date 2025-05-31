import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/produto.dart';
import '../providers/carrinho_provider.dart';

class DetalhesScreen extends StatefulWidget {
  final Produto produto;
  const DetalhesScreen({super.key, required this.produto});

  @override
  State<DetalhesScreen> createState() => _DetalhesScreenState();
}

class _DetalhesScreenState extends State<DetalhesScreen> {
  int quantidade = 1;

  @override
  Widget build(BuildContext context) {
    final produto = widget.produto;
    final total = context.watch<CartProvider>().totalDaCompra;
    final totalProduto = quantidade * produto.preco;
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(produto.emoji, style: const TextStyle(fontSize: 80)),
            const SizedBox(height: 16),
            Text(
              produto.nome,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              produto.descricao,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Preço: R\$ ${produto.preco.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed:
                      quantidade > 1
                          ? () => setState(() => quantidade--)
                          : null,
                ),
                Text('$quantidade', style: const TextStyle(fontSize: 18)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => setState(() => quantidade++),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Subtotal:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'R\$ ${totalProduto.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total no carrinho:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'R\$ ${total.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(
                  context,
                  listen: false,
                ).adicionarAoCarrinho(produto, quantidade);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${quantidade}x ${produto.nome} adicionado(s) ao carrinho!',
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_shopping_cart),
                  SizedBox(width: 8),
                  Text('Adicionar ao Carrinho'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
