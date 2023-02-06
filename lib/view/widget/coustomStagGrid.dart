import 'package:flutter/material.dart';

class CustomStagGrid extends StatelessWidget {
  final String label;
  final String image;
  final String description;
  final String price;
  final void Function()? onTap , onPress;


  const CustomStagGrid(
      {Key? key,
      required this.label,
      required this.image,
      required this.description,
      required this.price,  this.onTap, this.onPress,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Container(
               margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                 Image.asset(
                    image,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 5,top: 5),
                    child: Text(label,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 5,top: 5),
                    child: Text(description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13, color: Colors.grey,),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Text("\$"+ price,
                            style: const TextStyle(fontSize: 15,color: Colors.black54),
                          ),
                          const Spacer(flex: 1),

                           IconButton(icon:const Icon( Icons.shopping_cart, size: 20),onPressed:onPress),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
    );

  }
}
