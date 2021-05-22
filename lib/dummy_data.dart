import 'package:flutter/material.dart';

import './models/community.dart';
import './models/post.dart';

const DUMMY_CATEGORIES = const [
  Category(
    id: 'c1',
    title: 'Foodie',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Anime',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Gaming',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'Tech',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Artificial Intelligence',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Vedic Maths',
    color: Colors.green,
  ),
  Category(
    id: 'c7',
    title: 'Music',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c8',
    title: 'Dance',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c9',
    title: 'Astronomy',
    color: Colors.pink,
  ),
  Category(
    id: 'c10',
    title: 'Sports',
    color: Colors.teal,
  ),
];

const DUMMY_MEALS = const [
  Meal(
    id: 'm1',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Post.01',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,

    // imageUrl: Image.asset("images/profile.jpg"),
    imageUrl:
    'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    // imageUrl:
    //     AssetImage("assets/story_Writing.jpg"),
    duration: 20,
    ingredients: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    steps: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm2',
    categories: [
      'c2',
    ],
    title: 'Post.02',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    duration: 10,
    ingredients: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    steps: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm3',
    categories: [
      'c2',
      'c3',
    ],
    title: 'Post.03',
    affordability: Affordability.Pricey,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
    duration: 45,
    ingredients: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    steps: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm4',
    categories: [
      'c4',
    ],
    title: 'Post.04',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Challenging,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
    duration: 60,
    ingredients: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    steps: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm5',
    categories: [
      'c2'
          'c5',
      'c10',
    ],
    title: 'Post.05',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
    duration: 15,
    ingredients: [
     'Lorem Ipsum is simply dummy text of the printing and typesetting'
     'Lorem Ipsum is simply dummy text of the printing and typesetting'
     'Lorem Ipsum is simply dummy text of the printing and typesetting'
     'Lorem Ipsum is simply dummy text of the printing and typesetting'
     'Lorem Ipsum is simply dummy text of the printing and typesetting'
     'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    steps: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm6',
    categories: [
      'c6',
      'c10',
    ],
    title: 'Post.06',
    affordability: Affordability.Affordable,
    complexity: Complexity.Hard,
    imageUrl:
        'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
    duration: 240,
    ingredients: [
     'Lorem Ipsum is simply dummy text of the printing and typesetting'
     'Lorem Ipsum is simply dummy text of the printing and typesetting'
     'Lorem Ipsum is simply dummy text of the printing and typesetting'
     'Lorem Ipsum is simply dummy text of the printing and typesetting'
     'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    steps: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm7',
    categories: [
      'c7',
    ],
    title: 'POst.07',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
    duration: 20,
    ingredients: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    steps: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
          ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm8',
    categories: [
      'c8',
    ],
    title: 'Post.08',
    affordability: Affordability.Pricey,
    complexity: Complexity.Challenging,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
    duration: 35,
    ingredients: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    steps: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm9',
    categories: [
      'c9',
    ],
    title: 'Post.09',
    affordability: Affordability.Affordable,
    complexity: Complexity.Hard,
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
    duration: 45,
    ingredients: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    steps: [
  'Lorem Ipsum is simply dummy text of the printing and typesetting'
  'Lorem Ipsum is simply dummy text of the printing and typesetting'
  'Lorem Ipsum is simply dummy text of the printing and typesetting'
  'Lorem Ipsum is simply dummy text of the printing and typesetting'
  'Lorem Ipsum is simply dummy text of the printing and typesetting'
  'Lorem Ipsum is simply dummy text of the printing and typesetting'
  'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm10',
    categories: [
      'c2',
      'c5',
      'c10',
    ],
    title: 'Post.10',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
    duration: 30,
    ingredients: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    steps: [
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
];
