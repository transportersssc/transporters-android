import 'package:flutter/material.dart';

class MyGridView extends StatefulWidget {
  @override
  _MyGridViewState createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  // Set an int with value -1 since no card has been selected
  int selectedCard = -1;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: false,
      scrollDirection: Axis.vertical,
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 3),
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              // Ontap of each card, set the defined int to the grid view index
              selectedCard = index;
            });
          },
          child: Card(
            // Check if the index is equal to the selected Card integer
            color: selectedCard == index ? Colors.blue : Colors.amber,
            child: Container(
              height: 100,
              width: 70,
              child: Center(
                child: Text(
                  '$index',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
