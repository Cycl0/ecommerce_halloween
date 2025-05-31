class Produto {
  final int id;
  final String nome;
  final String emoji;
  final String descricao;
  final double preco;

  Produto({
    required this.id,
    required this.nome,
    required this.emoji,
    required this.descricao,
    required this.preco,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'],
      nome: json['nome'],
      emoji: json['emoji'],
      descricao: json['descricao'],
      preco: (json['preco'] as num).toDouble(),
    );
  }
}
