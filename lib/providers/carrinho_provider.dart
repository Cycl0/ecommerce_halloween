import 'package:flutter/material.dart';
import '../models/produto.dart';

class CartProvider with ChangeNotifier {
  final Map<Produto, int> _items = {};

  Map<Produto, int> get items => _items;

  double get totalDaCompra => _items.entries.fold(
    0.0,
    (sum, entry) => sum + entry.key.preco * entry.value,
  );

  void adicionarAoCarrinho(Produto produto, [int quantidade = 1]) {
    _items.update(
      produto,
      (qtd) => qtd + quantidade,
      ifAbsent: () => quantidade,
    );
    notifyListeners();
  }

  void removerUmaUnidade(Produto produto) {
    if (!_items.containsKey(produto)) return;
    if (_items[produto]! > 1) {
      _items[produto] = _items[produto]! - 1;
    } else {
      _items.remove(produto);
    }
    notifyListeners();
  }

  void removerItem(Produto produto) {
    _items.remove(produto);
    notifyListeners();
  }

  void limparCarrinho() {
    _items.clear();
    notifyListeners();
  }
}
