
class ItemPl {
  final String name;
  final String value;

  ItemPl({required this.name, required this.value});

  static List<ItemPl> itemsPl = [
    ItemPl(name:"Solde maximum de votre compte", value:"2.000.000"),
    ItemPl(name:"Cumul mensuel maximum", value:"10.000.000"),
    ItemPl(name:"Cumul février restant autorisé", value:"9.505.705")
  ];
}