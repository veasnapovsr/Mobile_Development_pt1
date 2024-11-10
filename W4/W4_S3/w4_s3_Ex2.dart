


//NOTE: code is not finished, to be continued...


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Favorite Cards"),
        ),
        body: CardList(), // to display the list of cards
      ),
    );
  }

}


//Difficulty: HARD

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState(); //createState=method creates instance of _CardListState
}

class _CardListState extends State<CardList> {
  List<bool> favorites = [false, false, false]; // Initialize fav_states for each card

  void toggleFavorite(int index) {
    setState(() {
      favorites[index] = !favorites[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return FavoriteCard(
          title: "Title $index",
          description: "Description for card $index",
          isFavorite: favorites[index],
          onFavoriteToggle: () => toggleFavorite(index),
        );
      },
    );
  }
}

//To complete...

class FavoriteCard extends StatelessWidget {

//final
//favCard
//required

  //Decoration

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!, width: 1),
        ),
      ),

      child: Row(

        children: [

          Expanded(

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(

                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),

                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],

            ),

          ),

          IconButton(

            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: onFavoriteToggle,

          ),

        ],
      ),
    );

  }
}
      