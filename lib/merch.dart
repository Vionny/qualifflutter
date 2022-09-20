
import 'package:qualifflutter/comments.dart';

class Merch{
    String name;
    String image;
    int price;
    List<Comment> comments=[];
    Merch({required this.name,required this.image,required this.price, comments});
}

var merchs=[
    Merch(name: "Hu Tao Ghost Lamp", image: 'assets/m1.png', price: 200000),
    Merch(name: "Klee Bouncing Mug", image: 'assets/m2.png', price: 750000),
    Merch(name: "Solo Leveling Mug", image: 'assets/m7.png', price: 150000),
    Merch(name: "Hibari Kyoya Figurine", image: 'assets/m4.png', price: 1250000),
    Merch(name: "Sandalphone Hikkake Figure", image: 'assets/m5.png', price: 350000),
    Merch(name: "Xiao Acrylic Lamp", image: 'assets/m6.png', price: 450000),
    Merch(name: "Kimetsu No Yaiba Figurine", image: 'assets/m3.png', price: 950000),
];

