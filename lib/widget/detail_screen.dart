import 'package:coffe_shop/model/coffee.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Coffee list;
  const DetailScreen({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      if(constraints.maxWidth > 800) {
        return Detail2(list: list);
      } else {
        return DetailMobile(list:list);
      }
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
                                    styling: 'mobile',
                                  ),
                                  SizeButton(
                                    size: 'Medium',
                                    activeButton: activeButton,
                                    onPressed: () {
                                      setState(() {
                                        activeButton = 'Medium';
                                      });
                                    },
                                    styling: 'mobile',
                                  ),
                                  SizeButton(
                                    size: 'Large',
                                    activeButton: activeButton,
                                    onPressed: () {
                                      setState(() {
                                        activeButton = 'Large';
                                      });
                                    },
                                    styling: 'mobile',
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
  final String styling;

  const SizeButton({
    super.key,
    required this.size,
    required this.activeButton,
    required this.onPressed,
    required this.styling,
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
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((Set<MaterialState> states) {
          if (styling == "web") {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            );
          } else {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // or any other default border radius
            );
          }
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

class Detail2 extends StatefulWidget {
  final Coffee list;

  const Detail2({super.key, required this.list});

  @override
  _Detail2 createState() => _Detail2();
}

class _Detail2 extends State<Detail2> {
  String activeButton = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detail Coffee',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child:
                  Stack(
                    children: [
                      Image.asset(widget.list.image, fit: BoxFit.cover,),
                      Container(
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.all(16),
                        child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: FavoriteButton()
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          margin: const EdgeInsets.all(16),
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
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                const SizedBox(width: 26,),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        // alignment: AlignmentDirectional.,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
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
                              const SizedBox(height: 16,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: SizeButton(
                                      size: 'Small',
                                      activeButton: activeButton,
                                      onPressed: () {
                                        setState(() {
                                          activeButton = 'Small';
                                        });
                                      },
                                      styling: 'web',
                                    ),
                                  ),
                                  const SizedBox(width: 5,),
                                  Expanded(
                                    child: SizeButton(
                                      size: 'Medium',
                                      activeButton: activeButton,
                                      onPressed: () {
                                        setState(() {
                                          activeButton = 'Medium';
                                        });
                                      },
                                      styling: 'web',
                                    ),
                                  ),
                                  const SizedBox(width: 5,),
                                  Expanded(
                                    child: SizeButton(
                                      size: 'Large',
                                      activeButton: activeButton,
                                      onPressed: () {
                                        setState(() {
                                          activeButton = 'Large';
                                        });
                                      },
                                      styling: 'web',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16,),
                              const Text(
                                'Description',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16,),
                              Text(
                                widget.list.description,
                              ),

                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.green)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                            child: Text('Add to Cart | \$ ${widget.list.price}', style: const TextStyle(color: Colors.white),)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}