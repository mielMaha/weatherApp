import 'package:flutter/material.dart';

import '../sheard/data/Sqflite_Helper.dart';

class CityList extends StatelessWidget {
  const CityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://p0.pikist.com/photos/742/864/mountain-stars-sky-milky-way-galaxy-reflection-tranquil-peaceful-mountain-range.jpg'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: futuerListTask(),
        ),
      ),
    );
  }
}

class futuerListTask extends StatelessWidget {
  const futuerListTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Sqflite_Helper().loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) => cityItem(
                  city: snapshot.data![i],
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

class cityItem extends StatelessWidget {
  const cityItem({
    super.key,
    required this.city,
  });

  final Map city;

  @override
  Widget build(BuildContext context) {
    var MediumText = Theme.of(context).textTheme.bodyMedium!;
    var largeText = Theme.of(context).textTheme.displayLarge;
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (DismissDirection Direction) {
        Sqflite_Helper().delete(city['id']);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Stack(
          children: [
            Image(
              image: NetworkImage(
                  'https://i.postimg.cc/bJV9pBT3/66q-NMQP-Imgur.png'),
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' ${city['aver']}°',
                          style: MediumText.copyWith(fontSize: 55)),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text('H-${city['Max']}°    ' 'L-${city['min']}°',
                              style: MediumText.copyWith(
                                  color: Colors.grey, fontSize: 20)),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${city['city']}',
                        style: largeText!.copyWith(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 10,
              child: SizedBox(
                width: 150,
                height: 150,
                child: Image(
                  width: 150,
                  height: 150,
                  image: NetworkImage('https:${city['image']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 15,
              child: Text('${city['condition']}', style: MediumText),
            ),
          ],
        ),
      ),
    );
  }
}
