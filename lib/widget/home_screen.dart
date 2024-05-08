import 'package:coffe_shop/widget/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/coffee.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const MobileSC();
          } else if (constraints.maxWidth <= 1200) {
            return const MobileSC2();
          } else {
            return const MobileSC3();
          }
        },
      ),
    );
  }
}

class MobileSC extends StatelessWidget {
  const MobileSC({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('images/coffee-animation.jpg'),
                  ),
                  Row(
                    children: [
                      Icon(Icons.place, color: Colors.green,),
                      Text('Indonesia')
                    ],
                  ),
                  Icon(Icons.notifications, color: Colors.green,)
                ],
              ),
              const SizedBox(height: 18,),
              const SizedBox(
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
              const SizedBox(height: 18,),
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
                      const Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 6,),
                          Text('Search Coffee', style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        child: IconButton(
                          icon: const Icon(
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
              const SizedBox(height: 18,),
              ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset('images/banner.jpg', fit: BoxFit.cover,)),
              const SizedBox(height: 18,),
              const Text(
                'Recommendation',
                style: TextStyle(
                  // fontSize: 24,
                  // color: Colors.green,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 18,),
              const SizedBox(
                  height: 225,
                  child: CoffeeListView()),
              const SizedBox(height: 18,),
              const Text(
                'All Coffee',
                style: TextStyle(
                  // fontSize: 24,
                  // color: Colors.green,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 18,),
              const SizedBox(
                  height: 225,
                  child: CoffeeListView())
            ],
          ),
        ),
      ),
    );
  }

}

class MobileSC2 extends StatelessWidget {
  const MobileSC2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.green
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Coffee Shop',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Icon(Icons.place, color: Colors.green,),
                    //     Text('Indonesia')
                    //   ],
                    // ),
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('images/coffee-animation.jpg'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18,),
                  const SizedBox(
                    // width: 250,
                    child: Text(
                      'Find the best coffee for you',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.green,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(height: 18,),
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
                          const Row(
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 6,),
                              Text('Search Coffee', style: TextStyle(color: Colors.grey),)
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            child: IconButton(
                              icon: const Icon(
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
                  const SizedBox(height: 18,),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset('images/banner.jpg', fit: BoxFit.cover,)),
                  const SizedBox(height: 18,),
                  const Text(
                    'Recommendation',
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(height: 18,),
                  const SizedBox(
                      height: 225,
                      child: CoffeeListView()),
                  const SizedBox(height: 18,),
                  const Text(
                    'All Coffee',
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 18,),
                  const SizedBox(
                      height: 225,
                      child: CoffeeListView())
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

}

class MobileSC3 extends StatelessWidget {
  const MobileSC3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.green
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Coffee Shop',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Icon(Icons.place, color: Colors.green,),
                    //     Text('Indonesia')
                    //   ],
                    // ),
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('images/coffee-animation.jpg'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18,),
                  const SizedBox(
                    // width: 250,
                    child: Text(
                      'Find the best coffee for you',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.green,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(height: 18,),
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
                          const Row(
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 6,),
                              Text('Search Coffee', style: TextStyle(color: Colors.grey),)
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            child: IconButton(
                              icon: const Icon(
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
                  const SizedBox(height: 18,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset('images/banner.jpg', fit: BoxFit.cover,)),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset('images/banner.jpg', fit: BoxFit.cover,)),
                            SizedBox(height: 8,),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset('images/banner.jpg', fit: BoxFit.cover,)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18,),
                  const Text(
                    'Recommendation',
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  const SizedBox(height: 18,),
                  const SizedBox(
                      height: 225,
                      child: CoffeeListView()),
                  const SizedBox(height: 18,),
                  const Text(
                    'All Coffee',
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 18,),
                  const SizedBox(
                      height: 225,
                      child: CoffeeListView())
                ],
              ),
            )

          ],
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
          margin: const EdgeInsets.only(right: 8.0),
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
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                    Text(
                      list.subName,
                      style: const TextStyle(
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
                            const Text(
                              '\$',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                            const SizedBox(width: 2,),
                            Text(
                              list.price,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                          ],
                        ),
                        // ElevatedButton(onPressed: () {}, child: Icon(Icons.add), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green),),)
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
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

