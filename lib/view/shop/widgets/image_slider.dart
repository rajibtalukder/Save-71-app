import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/product_details_model.dart';

class ImageSlider extends StatefulWidget {
  final ProductDetailsModel productDetails;

  ImageSlider({required this.productDetails});
  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  List<String> imageList = [];

  @override
  void initState() {
    super.initState();
    // Initialize the imageList
    updateImageList();
  }

  void updateImageList() {
    // Extract image URLs from the productImage list and update imageList
    setState(() {
      imageList = widget.productDetails.productImage
          ?.map((image) => image.productImageUrl)
          .toList() ?? [];
    });
  }


  // List imageList = [
  //   'assets/images/slider1.png',
  //   'assets/images/slider1.png',
  //   'assets/images/slider1.png'
  // ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print(currentIndex);
          },
          child: SizedBox(
            height: 200.h,
            width: 328.w,
            // decoration:
            //     BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
            child: CarouselSlider(
              items: imageList
                  .map(
                    (item) => Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: currentIndex == entry.key ? 17 : 7,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == entry.key
                          ? Colors.white
                          : Colors.white70),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
