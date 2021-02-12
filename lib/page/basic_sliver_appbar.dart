import 'package:flutter/material.dart';
import 'package:sliver_appbar_ii_example/widget/image_widget.dart';

class BasicSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.red,
              expandedHeight: 200,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://source.unsplash.com/random?monochromatic+dark',
                  fit: BoxFit.cover,
                ),
                title: Text('Flexible Title'),
                centerTitle: true,
              ),
              //title: Text('My App Bar'),
              leading: Icon(Icons.arrow_back),
              actions: [
                Icon(Icons.settings),
                SizedBox(width: 12),
              ],
            ),
            buildImages(),
          ],
        ),
      );

  Widget buildImages() => SliverToBoxAdapter(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          primary: false,
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) => ImageWidget(index: index),
        ),
      );
}
