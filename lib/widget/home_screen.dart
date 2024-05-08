import 'package:coffe_shop/widget/detail_screen.dart';
import 'package:flutter/material.dart';

import '../model/coffee.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('images/coffee-animation.jpg'),
                    ),
                    const Row(
                      children: [
                        Icon(Icons.place, color: Colors.green,),
                        Text('Indonesia')
                      ],
                    ),
                    const Icon(Icons.notifications, color: Colors.green,)
                  ],
                ),
                SizedBox(height: 18,),
                Container(
                  width: 250,
                  child: Text(
                    'Find the best coffee for you',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.green,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 18,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.search),
                            SizedBox(width: 6,),
                            Text('Search Coffee', style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.green,
                          child: IconButton(
                            icon: Icon(
                              Icons.filter_list_off_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {  },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 18,),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset('images/banner.jpg', fit: BoxFit.cover,))
                ),
                SizedBox(height: 18,),
                Container(
                  child: const Text(
                    'Recommendation',
                    style: TextStyle(
                        // fontSize: 24,
                        // color: Colors.green,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 18,),
                Container(
                  height: 225,
                    child: CoffeeListView()),
                SizedBox(height: 18,),
                Container(
                  child: Text(
                    'All Coffee',
                    style: TextStyle(
                      // fontSize: 24,
                      // color: Colors.green,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 18,),
                Container(
                    height: 225,
                    child: CoffeeListView())
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CoffeeListView extends StatelessWidget {
  const CoffeeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemExtent: 144,
      itemBuilder: (context, index) {
        final Coffee list = coffeeList[index];
        return Container(
          margin: EdgeInsets.only(right: 8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(list: list);
              }));
            },
            child: Container(
              // margin: EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(list.image, height: 118,)
                    ),
                    Text(
                      list.name,
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                    Text(
                      list.subName,
                      style: TextStyle(
                          color: Colors.grey,
                          // fontWeight: FontWeight.bold,
                          fontSize: 11
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '\$',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                            SizedBox(width: 2,),
                            Text(
                              list.price,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                          ],
                        ),
                        // ElevatedButton(onPressed: () {}, child: Icon(Icons.add), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green),),)
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add),
                          tooltip: 'add',
                          style: ButtonStyle(
                              iconColor: MaterialStateProperty.all(Colors.white),
                              backgroundColor: MaterialStateProperty.all(Colors.green),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)
                                  )
                              )
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
    },
      itemCount: coffeeList.length,
    );
  }

}

class CoffeeListGrid extends StatelessWidget {
  final int gridCount;
  const CoffeeListGrid({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: coffeeList.map((coffee) {
        return InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1,1),
                      blurRadius: 4
                  )
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(coffee.image, height: 80, fit: BoxFit.cover,)
                  ),
                  Text(
                    coffee.name,
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                  Text(
                    coffee.subName,
                    style: TextStyle(
                        color: Colors.grey,
                        // fontWeight: FontWeight.bold,
                        fontSize: 11
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '\$',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),
                          ),
                          Text(
                            coffee.price,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),
                          ),
                        ],
                      ),
                      // ElevatedButton(onPressed: () {}, child: Icon(Icons.add), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green),),)
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        tooltip: 'add',
                        style: ButtonStyle(
                            iconColor: MaterialStateProperty.all(Colors.white),
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                )
                            )
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

}

class TourismPlaceGrid extends StatelessWidget {
  final int gridCount;
  const TourismPlaceGrid({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        children: coffeeList.map((place) {
          return InkWell(
            onTap: () {
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      place.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      place.name,
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(
                        place.subName
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}