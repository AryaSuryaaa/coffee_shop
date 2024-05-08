import 'package:coffe_shop/model/coffee.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Coffee list;
  const DetailScreen({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return DetailMobile(list:list);
    });
  }
}

class DetailMobile extends StatefulWidget {
  final Coffee list;

  const DetailMobile({super.key, required this.list});

  @override
  _DetailMobileState createState() => _DetailMobileState();
}

class _DetailMobileState extends State<DetailMobile> {
  String activeButton = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(children: [
                    Image.asset(widget.list.image),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: const Icon(
                                    Icons.arrow_back
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: FavoriteButton()
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        transform: Matrix4.translationValues(0.0, -140.0, 0.0),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.list.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.list.subName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(height: 16,),
                                Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    borderRadius: BorderRadiusDirectional.circular(20)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(Icons.star, color: Colors.yellow,),
                                        Text(
                                          widget.list.rating,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ))
                      ),
                      Container(
                        transform: Matrix4.translationValues(0.0, -120.0, 0.0),
                        alignment: AlignmentDirectional.topStart,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Cup Size',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizeButton(
                                    size: 'Small',
                                    activeButton: activeButton,
                                    onPressed: () {
                                      setState(() {
                                        activeButton = 'Small';
                                      });
                                    },
                                  ),
                                  SizeButton(
                                    size: 'Medium',
                                    activeButton: activeButton,
                                    onPressed: () {
                                      setState(() {
                                        activeButton = 'Medium';
                                      });
                                    },
                                  ),
                                  SizeButton(
                                    size: 'Large',
                                    activeButton: activeButton,
                                    onPressed: () {
                                      setState(() {
                                        activeButton = 'Large';
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8,),
                              const Text(
                                'Description',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Text(
                                widget.list.description,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      '|',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '\$  ${widget.list.price}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class SizeButton extends StatelessWidget {
  final String size;
  final String activeButton;
  final VoidCallback onPressed;

  const SizeButton({
    super.key,
    required this.size,
    required this.activeButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: activeButton == size ? null : onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 30)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (activeButton == size) {
            return Colors.green;
          } else if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          return Colors.grey.shade300;
        }),
      ),
      child: Text(
        size,
        style: TextStyle(
          color: activeButton == size ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey ,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}