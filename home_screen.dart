import 'dart:convert';
import 'package:flutter/material.dart';
import 'models/food_recipes.dart';

/// given JSON data
const String jsonData = '''
{
  "recipes": [
    {
      "title": "Pasta Carbonara",
      "description": "Creamy pasta dish with bacon and cheese.",
      "ingredients": ["spaghetti", "bacon", "egg", "cheese"]
    },
    {
      "title": "Caprese Salad",
      "description": "Simple and refreshing salad with tomatoes, mozzarella, and basil.",
      "ingredients": ["tomatoes", "mozzarella", "basil"]
    },
    {
      "title": "Banana Smoothie",
      "description": "Healthy and creamy smoothie with bananas and milk.",
      "ingredients": ["bananas", "milk"]
    },
    {
      "title": "Chicken Stir-Fry",
      "description": "Quick and flavorful stir-fried chicken with vegetables.",
      "ingredients": ["chicken breast", "broccoli", "carrot", "soy sauce"]
    },
    {
      "title": "Grilled Salmon",
      "description": "Delicious grilled salmon with lemon and herbs.",
      "ingredients": ["salmon fillet", "lemon", "olive oil", "dill"]
    },
    {
      "title": "Vegetable Curry",
      "description": "Spicy and aromatic vegetable curry.",
      "ingredients": ["mixed vegetables", "coconut milk", "curry powder"]
    },
    {
      "title": "Berry Parfait",
      "description": "Layered dessert with fresh berries and yogurt.",
      "ingredients": ["berries", "yogurt", "granola"]
    }
  ]
}
''';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Recipe> recipes = (jsonDecode(jsonData)['recipes'] as List).map((data) => Recipe.fromJson(data)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Food Recipes",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepOrangeAccent[100],
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.restaurant),
              title: Text(recipes[index].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              subtitle: Text(recipes[index].description),
            );
          },
          separatorBuilder: (context,index){
            return Divider(
              indent: 20,
            );
          },
        ),
      ),
    );
  }
}
