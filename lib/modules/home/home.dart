import 'package:ecommerce/shared/controllers/firebasecontroller.dart';
import 'package:ecommerce/shared/models/productmodel.dart';
import 'package:ecommerce/shared/objects/homeItemIcon.dart';
import 'package:ecommerce/shared/objects/searchbox.dart';
import 'package:ecommerce/shared/theme/appcolors.dart';
import 'package:ecommerce/shared/theme/appimages.dart';
import 'package:flutter/material.dart';

TextEditingController searchTextController = TextEditingController();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseController firebase = FirebaseController();
    return FutureBuilder<List<Product>>(
        future: firebase.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.black,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                  backgroundColor: Colors.black,
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            var _webData = snapshot.data;

            return Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.primary,
                  shadowColor: Colors.transparent,
                  centerTitle: true,
                  title: CustomTextField(
                    hint: "BUSCAR",
                    obscure: false,
                    controller: searchTextController,
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search_sharp))
                  ],
                  leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                    child: const Icon(Icons.shopping_cart_checkout_rounded),
                    backgroundColor: AppColors.primary,
                    onPressed: () => Navigator.pushNamed(context, "/cart")),
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                    child: Column(
                  children: [buildImage(context), buildList(context, _webData)],
                )));
          }

          return const SizedBox();
        });
  }
}

Widget buildImage(context) {
  return Image.asset(
    AppImages.titleImage,
    fit: BoxFit.fill,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.25,
  );
}

Widget buildList(context, webData) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.6,
    child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: webData!.length,
        itemBuilder: (context, index) {
          return HomeIconItem(
              label: webData[index].name.toUpperCase(),
              imageURL: webData[index].imgURL,
              select: webData[index]);
        }),
  );
}
