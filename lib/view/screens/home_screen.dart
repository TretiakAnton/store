import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/core/constants.dart';
import 'package:store/logic/store_bloc/store_cubit.dart';
import 'package:store/view/widgets/product_element.dart';
import 'package:store/view/widgets/side_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<StoreCubit>();
    if (bloc.products?.isEmpty ?? true) {
      bloc.getProducts();
    }
    return SafeArea(
      child: Scaffold(
        drawer: const SideMenu(),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Padding(
                padding: EdgeInsets.all(smallVerticalPadding * 1.5),
                child: SvgPicture.asset(
                  'assets/svg/drawer_icon.svg',
                  height: verticalPadding,
                  width: verticalPadding,
                ),
              ),
            );
          }),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Expanded(
                child: Container(
                  height: largeVerticalPadding,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(238, 238, 238, 1),
                    borderRadius: BorderRadius.circular(21.4),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: smallHorizontalPadding),
                      child: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: BlocBuilder<StoreCubit, StoreState>(
                builder: (context, state) {
                  if (state is StoreCompleted) {
                    final products = bloc.products;
                    if (products?.isNotEmpty ?? false) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: smallVerticalPadding,
                          ),
                          Text(
                            'Special offers',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'The best prices',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: smallVerticalPadding * 1.5,
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: (products!.length / 2).ceil(),
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    ProductElement(
                                        product: products[index * 2]),
                                    index != products.length
                                        ? ProductElement(
                                            product: products[index * 2 + 1])
                                        : Expanded(child: Container()),
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: smallVerticalPadding,
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  } else if (state is StoreFailed) {
                    bloc.getProducts();
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: verticalPadding * 2),
                child: SvgPicture.asset(
                  'assets/svg/shop_icon.svg',
                  height: largeHorizontalPadding * 2,
                  width: largeHorizontalPadding * 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
