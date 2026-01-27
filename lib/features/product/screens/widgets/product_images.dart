import 'dart:async';
import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatefulWidget {
  final List<String> images;

  const ProductImages({super.key, required this.images});

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (widget.images.isEmpty) return;
      setState(() {
        currentIndex = (currentIndex + 1) % widget.images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  ImageProvider _imageProvider(String img) {
    return img.startsWith('http')
        ? NetworkImage(img)
        : AssetImage(img) as ImageProvider;
  }

  void _openSlider(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            ImageSliderViewer(images: widget.images, initialIndex: index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _openSlider(currentIndex),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Container(
              key: ValueKey<int>(currentIndex),
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: _imageProvider(widget.images[currentIndex]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 15),
        //slider
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.images.length, (i) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: currentIndex == i ? 30 : 15,
              height: 7,
              decoration: BoxDecoration(
                color: currentIndex == i
                    ? AppColor.mainColor
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5),
              ),
            );
          }),
        ),

        const SizedBox(height: 15),

        // images
        // SizedBox(
        //   height: 65,
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: widget.images.length,
        //     itemBuilder: (context, i) {
        //       return GestureDetector(
        //         onTap: () {
        //           setState(() => currentIndex = i);
        //           _openSlider(i);
        //         },
        //         child: Container(
        //           height: 65,
        //           width: 84,
        //           margin: const EdgeInsets.only(right: 8),
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(4),
        //             border: Border.all(
        //               width: 2,
        //               color: i == currentIndex
        //                   ? Colors.grey.shade100
        //                   : Colors.white,
        //             ),
        //             image: DecorationImage(
        //               image: _imageProvider(widget.images[i]),
        //               fit: BoxFit.cover,
        //             ),
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ),
        SizedBox(height: 10),
      ],
    );
  }
}

class ImageSliderViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const ImageSliderViewer({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<ImageSliderViewer> createState() => _ImageSliderViewerState();
}

class _ImageSliderViewerState extends State<ImageSliderViewer> {
  late PageController _controller;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _controller = PageController(initialPage: currentIndex);
  }

  ImageProvider _imageProvider(String img) {
    return img.startsWith('http')
        ? NetworkImage(img)
        : AssetImage(img) as ImageProvider;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          '${currentIndex + 1}/${widget.images.length}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: PageView.builder(
        controller: _controller,
        itemCount: widget.images.length,
        onPageChanged: (i) => setState(() => currentIndex = i),
        itemBuilder: (context, i) {
          return InteractiveViewer(
            child: Center(
              child: Image(
                image: _imageProvider(widget.images[i]),
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}
