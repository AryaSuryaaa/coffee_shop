class Coffee {
  String name;
  String subName;
  String description;
  String price;
  String rating;
  String image;

  Coffee({
    required this.name,
    required this.subName,
    required this.description,
    required this.price,
    required this.rating,
    required this.image,
  });
}


var coffeeList = [
  Coffee(
    name: "Cappucino",
    description: "Cappuccino is a classic Italian coffee drink that is beloved worldwide. It's traditionally made with equal parts double espresso, steamed milk, and milk foam. The rich espresso is complemented by the creamy texture of the milk and the frothy foam on top. Cappuccino is known for its balanced flavor profile and velvety mouthfeel.",
    image: 'images/cappucino.jpg',
    price: '2.1',
    rating: '4.8',
    subName: 'With milk',
  ),
  Coffee(
    name: "Americano",
    description: "Americano is a popular coffee drink that originated in America but has become a staple in cafes worldwide. It's prepared by diluting a shot of espresso with hot water, resulting in a coffee that is similar in strength to traditional brewed coffee but with a different flavor profile. Americano has a bold and robust flavor, with a smooth finish.",
    image: 'images/americanno.jpg',
    price: '3.0',
    rating: '4.9',
    subName: 'Super black coffee',
  ),
  Coffee(
    name: "Espresso",
    description: "Espresso is a concentrated form of coffee that is the foundation for many other coffee drinks. It's made by forcing hot water through finely-ground coffee beans, resulting in a small, strong shot of coffee with a rich and intense flavor. Espresso is known for its bold flavor profile and velvety crema on top.",
    image: 'images/espresso.jpg',
    price: '2.4',
    rating: '4.8',
    subName: 'With milk foam',
  ),
  Coffee(
    name: "Latte",
    description: "Latte is a popular coffee drink made with espresso and steamed milk. It has a smooth and creamy texture, with the espresso providing a rich and bold flavor that is balanced by the sweetness of the steamed milk. Latte is often topped with a small amount of milk foam or latte art, adding to its visual appeal.",
    image: 'images/latte.jpg',
    price: '2.1',
    rating: '4.9',
    subName: 'With milk',
  ),
  Coffee(
    name: "Macchiato",
    description: "Macchiato is an espresso coffee drink with a small amount of milk, usually foamed. The word macchiato means 'stained' or 'spotted' in Italian, referring to the way the milk 'stains' the espresso. Macchiato has a strong and bold flavor, with the milk adding a touch of sweetness and creaminess to the drink.",
    image: 'images/Macchiato.jpg',
    price: '2.8',
    rating: '4.0',
    subName: 'With milk',
  ),
];


