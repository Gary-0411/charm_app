import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ImagePreviewPage extends StatefulWidget {
  final List<String> list;
  final int index;

  ImagePreviewPage({@required this.list, @required this.index});

  @override
  State<StatefulWidget> createState() {
    return ImagePreviewState();
  }
}

class ImagePreviewState extends State<ImagePreviewPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ExtendedImageGesturePageView.builder(
        itemBuilder: (BuildContext context, int index) {
          var item = widget.list[index];
          Widget image = ExtendedImage.network(
            item,
            fit: BoxFit.contain,
            mode: ExtendedImageMode.gesture,
            initGestureConfigHandler: (state) => GestureConfig(
                inPageView: true,
                initialScale: 1.0,
                //you can cache gesture state even though page view page change.
                //remember call clearGestureDetailsCache() method at the right time.(for example,this page dispose)
                cacheGesture: false),
          );
          image = Container(
            child: image,
            padding: EdgeInsets.all(5.0),
          );
          if (index == currentIndex) {
            return Hero(
              tag: item + index.toString(),
              child: image,
            );
          } else {
            return image;
          }
        },
        itemCount: widget.list.length,
        onPageChanged: (int index) {
          currentIndex = index;
          // rebuild.add(index);
        },
        controller: PageController(
          initialPage: currentIndex,
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
