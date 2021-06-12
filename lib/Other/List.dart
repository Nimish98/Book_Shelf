import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Popular{
  Popular({
    this.about,
    this.price,
    this.rating,
    this.tittle,
  });
  
  int price;
  double rating;
  String tittle;
  String about;
}

List<Popular> popularlist = <Popular>[
  Popular(price: 220,tittle: "Compiler Designing",about: "This Book is mainly about the the different techniques",rating: 3.4),
  Popular(price: 340,tittle: "Basic Electronics",about: "This Book is mainly about the the different techniques",rating: 4.4),
  Popular(price: 290,tittle: "Operating Systems",about: "",rating: 4.3),
  Popular(price: 420,tittle: "Physics",about: "This Book is mainly about the the different techniques",rating: 4.1),
  Popular(price: 520,tittle: "Objective C",about: "",rating: 4.2),
  Popular(price: 150,tittle: "Python",about: "This Book is mainly about the the different techniques",rating: 4.6),
  Popular(price: 220,tittle: "Java",about: "",rating: 4.8),
  Popular(price: 193,tittle: "Digital Electronics",about: "This Book is mainly about the the different techniques",rating: 5),
  Popular(price: 221,tittle: "Engineering Mathematics",about: "",rating: 2.8),
  Popular(price: 260,tittle: "COI",about: "This Book is mainly about the the different techniques",rating: 3.9),
];


class Recommended{
  Recommended({
    this.about,
    this.price,
    this.rating,
    this.tittle,

  });
  int price;
  String about;
  double rating;
  String tittle;
}
List<Recommended>Recommendedlist = <Recommended>[
  Recommended(price: 720,tittle: "Recommended 1",about: "This Book is a Recommended one",rating: 4.4),
  Recommended(price: 240,tittle: "Recommended 2",about: "This Book is a Recommended one",rating: 3.4),
  Recommended(price: 290,tittle: "Recommended 3",about: "This Book is a Recommended one",rating: 3.4),
  Recommended(price: 620,tittle: "Recommended 4",about: "This Book is a Recommended one",rating: 3.4),
  Recommended(price: 580,tittle: "Recommended 5",about: "This Book is a Recommended one",rating: 3.4),
  Recommended(price: 150,tittle: "Recommended 6",about: "This Book is a Recommended one",rating: 3.4),
  Recommended(price: 220,tittle: "Recommended 7",about: "This Book is a Recommended one",rating: 3.4),
  Recommended(price: 393,tittle: "Recommended 8",about: "This Book is a Recommended one",rating: 3.4),
  Recommended(price: 221,tittle: "Recommended 9",about: "This Book is a Recommended one",rating: 3.4),
  Recommended(price: 260,tittle: "Recommended 10",about: "This Book is a Recommended one",rating: 3.4),
];
class NewReleases{
  NewReleases({
    this.about,
    this.price,
    this.rating,
    this.tittle,
  });
  int price;
  String about;
  double rating;
  String tittle;
}
List<NewReleases>NewReleaseslist = <NewReleases>[
  NewReleases(price: 220,tittle: "New Release 1",about: "This Book is mainly about the the different techniques",rating: 3.4),
  NewReleases(price: 340,tittle: "New Release 2",about: "This Book is mainly about the the different techniques",rating: 3.4),
  NewReleases(price: 290,tittle: "New Release 3",about: "This Book is mainly about the the different techniques",rating: 3.4),
  NewReleases(price: 420,tittle: "New Release 4",about: "This Book is mainly about the the different techniques",rating: 3.4),
  NewReleases(price: 520,tittle: "New Release 5",about: "This Book is mainly about the the different techniques",rating: 3.4),
  NewReleases(price: 150,tittle: "New Release 6",about: "This Book is mainly about the the different techniques",rating: 3.4),
  NewReleases(price: 220,tittle: "New Release 7",about: "This Book is mainly about the the different techniques",rating: 3.4),
  NewReleases(price: 193,tittle: "New Release 8",about: "This Book is mainly about the the different techniques",rating: 3.4),
  NewReleases(price: 221,tittle: "New Release 9",about: "This Book is mainly about the the different techniques",rating: 3.4),
  NewReleases(price: 260,tittle: "New Release 10",about: "This Book is mainly about the the different techniques",rating: 3.4),
];

class Section{
  IconData icon;
  String s;
  Section({this.icon,this.s});
}

List<Section>verticalList=<Section>[
  Section(
    icon: Icons.school,
    s: "Education"
  ),
  Section(
    icon: Icons.book,
    s: "Literature",
  ),
  Section(
    icon: Icons.wb_sunny_rounded,
    s: "Science",
  ),
  Section(
    icon: Icons.book_outlined,
    s: "Fiction",
  ),
];
// class Book{
//   Book({this.about,
//   this.price,
//   this.rating,
//   this.tittle,
// });
// int price;
// String about;
// double rating;
// String tittle;
// }

