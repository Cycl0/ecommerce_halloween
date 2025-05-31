import 'package:flutter/material.dart';
import '../widgets/produto_tile.dart';
import 'carrinho_screen.dart';
import '../data/produtos_data.dart';
import 'dart:convert';
import '../models/produto.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = jsonDecode(jsonData);
    final List<Produto> produtos =
        (data['produtos_halloween'] as List)
            .map((item) => Produto.fromJson(item))
            .toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mercado Halloween - Lucas & Herick'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.shopping_cart), text: 'Carrinho'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: produtos.length,
              itemBuilder:
                  (context, index) => ProdutoTile(produto: produtos[index]),
            ),
            const CarrinhoScreen(),
          ],
        ),
      ),
    );
  }
}
