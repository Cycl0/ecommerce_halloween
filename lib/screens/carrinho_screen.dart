import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/carrinho_provider.dart';

class CarrinhoScreen extends StatelessWidget {
  const CarrinhoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        final produtos = cart.items.keys.toList();
        return Column(
          children: [
            Expanded(
              child:
                  cart.items.isEmpty
                      ? const Center(child: Text('Seu carrinho está vazio.'))
                      : ListView.builder(
                        itemCount: produtos.length,
                        itemBuilder: (context, index) {
                          final produto = produtos[index];
                          final qtd = cart.items[produto]!;
                          return ListTile(
                            leading: Text(
                              produto.emoji,
                              style: const TextStyle(fontSize: 24),
                            ),
                            title: Text(produto.nome),
                            subtitle: Text('Quantidade: $qtd'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed:
                                      () => cart.removerUmaUnidade(produto),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed:
                                      () =>
                                          cart.adicionarAoCarrinho(produto, 1),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () => cart.removerItem(produto),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'R\$ ${cart.totalDaCompra.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed:
                        cart.items.isEmpty
                            ? null
                            : () {
                              cart.limparCarrinho();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Compra realizada com sucesso!',
                                  ),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle_outline),
                        SizedBox(width: 8),
                        Text('Finalizar Compra'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
