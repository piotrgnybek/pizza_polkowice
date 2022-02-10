import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var restaurantName = '';
  var pizzaName = '';
  var rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę restauracji',
            ),
            onChanged: (newValue) {
              setState(
                () {
                  restaurantName = newValue;
                },
              );
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę pizzy',
            ),
            onChanged: (newValue) {
              setState(
                () {
                  pizzaName = newValue;
                },
              );
            },
          ),
          Slider(
            value: rating,
            min: 1.0,
            max: 6.0,
            divisions: 10,
            label: rating.toString(),
            onChanged: (newValue) {
              setState(() {
                rating = newValue;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('restaurants').add({
                'name': restaurantName,
                'pizza': pizzaName,
                'rating': rating,
              });
            },
            child: const Text('Dodaj'),
          )
        ],
      ),
    );
  }
}
