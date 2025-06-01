import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../data/produtos_data.dart';

class ProdutosProvider with ChangeNotifier {
  late final List<Produto> _produtos;

  ProdutosProvider() {
    final Map<String, dynamic> data = json.decode(jsonData);
    final List<dynamic> produtosJson = data['produtos_halloween'];
    _produtos = produtosJson.map((json) => Produto.fromJson(json)).toList();
  }

  List<Produto> get produtos => [..._produtos];

  Produto findById(int id) => _produtos.firstWhere((prod) => prod.id == id);
}
