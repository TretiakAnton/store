import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/models/product.dart';

import '../../core/constants.dart';

class ProductElement extends StatefulWidget {
  const ProductElement({required this.product, Key? key}) : super(key: key);
  final Product product;

  @override
  State<ProductElement> createState() => _ProductElementState();
}

class _ProductElementState extends State<ProductElement> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(smallVerticalPadding * .5),
        child: GestureDetector(
          onTap: () {
            //TODO: go to details screen
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 3.0,
                  spreadRadius: 2.0,
                  offset: const Offset(0, 2),
                ),
              ],
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(smallVerticalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: CachedNetworkImage(
                      imageUrl: widget.product.image,
                      height: verticalPadding * 5,
                      width: verticalPadding * 5,
                    ),
                  ),
                  SizedBox(
                    height: smallVerticalPadding * .5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.product.title,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  widget.product.rating != null
                      ? _rating(widget.product.rating!.rate)
                      : Container(),
                  SizedBox(
                    height: smallVerticalPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${widget.product.price.toStringAsFixed(2)}',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: SvgPicture.asset(
                          isSelected
                              ? 'assets/svg/like_filled.svg'
                              : 'assets/svg/like_empty.svg',
                          height: verticalPadding,
                          width: verticalPadding,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _rating(double rating) {
    const double radius = 5;
    const double padding = 3;
    return SizedBox(
      height: radius,
      width: (padding + radius) * 5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          double percentageFill = 1;
          if (rating.ceil() > index + 1) {
            percentageFill = 1;
          } else if (rating.ceil() < index + 1) {
            percentageFill = 0;
          } else {
            percentageFill = rating - index;
          }
          return Padding(
            padding: const EdgeInsets.only(right: padding),
            child: Container(
              height: radius,
              width: radius,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey,
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: percentageFill,
                child: Container(
                  height: radius,
                  width: radius,
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
