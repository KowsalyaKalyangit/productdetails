import 'package:product/allpackages.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  ProductController productController = Get.put(ProductController());
  var selectedindex = 0;
  @override
  void initState() {
    productController.productController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        leadingWidth: 15.0.wp,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(
            'assets/list.png',
            color: screenbackground,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 8.0.hp,
        title: Column(
          children: [
            Container(
                height: 3.0.hp,
                child: Image.asset(
                  'assets/cart.png',
                  color: screenbackground,
                )),
            Text(
              'dailefresh',
              style: heading,
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  Icons.qr_code,
                  color: screenbackground,
                  size: 25,
                ),
                SizedBox(
                  width: 2.0.wp,
                ),
                Icon(
                  Icons.store,
                  color: screenbackground,
                  size: 25,
                ),
                SizedBox(
                  width: 2.0.wp,
                ),
                Stack(
                  children: [
                    Container(
                      height: 4.0.hp,
                      width: 8.0.wp,
                    ),
                    Positioned(
                        top: 0.9.hp,
                        child: Icon(
                          Icons.shopping_cart_rounded,
                          color: screenbackground,
                          size: 20,
                        )),
                    Positioned(
                        right: 5,
                        child: CircleAvatar(
                            radius: 6,
                            backgroundColor: discountcolor,
                            child: Text(
                              '7',
                              style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    letterSpacing: 0.2,
                                    fontSize: 5.00.sp,
                                    color: screenbackground,
                                    fontWeight: FontWeight.w500),
                              ),
                            )))
                  ],
                ),
                SizedBox(
                  width: 2.0.wp,
                ),
              ],
            ),
          )
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: <Color>[appcolor, appcolor1]),
          ),
        ),
      ),
      body: Obx(() {
        if (productController.productLoad.value) {
          return Center(child: CircularProgressIndicator());
        } else if (productController.getproductlist.isEmpty) {
          return Center(
            child: Text('No Data Found'),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 2 / 2.9,
              ),
              itemCount: productController.getproductlist[0].data.length,
              itemBuilder: (context, index) {
                var data = productController.getproductlist[0].data[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Image.network(
                              data.productSmallImg.toString(),
                              height: 12.0.hp,
                            )),
                            Text(
                              data.productName.toString(),
                              style: subtitleStyle,
                            ),
                            SizedBox(
                              height: 10.0.hp,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productController.getproductlist[0]
                                      .data[index].priceList.length,
                                  itemBuilder: (context, pricedataindex) {
                                    var pricedata = productController
                                        .getproductlist[0]
                                        .data[index]
                                        .priceList[pricedataindex];
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedindex = index;
                                              });
                                            },
                                            child: Container(
                                              height: 3.0.hp,
                                              width: 15.0.wp,
                                              decoration: BoxDecoration(
                                                  color: selectedindex == index
                                                      ? productcolor
                                                      : screenbackground,
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  border: Border.all(
                                                      color: subtitlecolor)),
                                              child: Center(
                                                  child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Text(
                                                  '${pricedata.productWeight.toString()} ${pricedata.productWeightType.toString()}',
                                                  style: GoogleFonts.jost(
                                                      textStyle: TextStyle(
                                                          letterSpacing: 0.2,
                                                          fontSize: 8.00.sp,
                                                          color: selectedindex ==
                                                                  index
                                                              ? screenbackground
                                                              : subtitlecolor,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                ),
                                              )),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 38.0.wp,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              pricedata.mrpValue.isEmpty
                                                  ? Text('')
                                                  : Text(
                                                      '\u{20B9}${pricedata.mrpValue.toString()}',
                                                      style: amountStyle,
                                                    ),
                                              SmallActionButton(
                                                bordercolor: subtitlecolor,
                                                text: 'ADD',
                                                radiusvalue: 10,
                                                elevationvalue: 2,
                                                press: () {
                                                  print('click');
                                                  //Get.toNamed('/productDetails');

                                                  Get.to(ProductDetailsList(
                                                      image:
                                                          data.productSmallImg,
                                                      name: data.productName,
                                                      amount:
                                                          pricedata.mrpValue,
                                                      desc: data
                                                          .productDescription,
                                                      index: index));
                                                },
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                        Positioned(
                            left: 0,
                            child: data.discountFlag == "1"
                                ? Container(
                                    height: 3.0.hp,
                                    width: 14.0.wp,
                                    decoration: BoxDecoration(
                                      color: discountcolor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text(
                                            '${data.discountValue.toString()}%off',
                                            style: discountstyle,
                                          )),
                                    ))
                                : Container()),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
