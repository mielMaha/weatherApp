import 'package:flutter/material.dart';
import 'package:weatherapp/Widget/searchBar.dart';

class WelCome extends StatelessWidget {
  WelCome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://p0.pikist.com/photos/742/864/mountain-stars-sky-milky-way-galaxy-reflection-tranquil-peaceful-mountain-range.jpg'),
            fit: BoxFit.cover),
      ),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Searchbar(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: SizedBox(
                  width: 350, // Set the desired width
                  height: 300, // Set the desired height
                  child: Image.network(
                    'https://i.postimg.cc/tCqpLvcL/C1z1rp1-Imgur.png',
                    fit: BoxFit
                        .cover, // This will ensure the image fits within the size without being cropped
                  ),
                ),
              ),
              Text(
                "no weather please search 🥰🔍to get info",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
