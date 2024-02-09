import 'dart:ffi';

import 'package:product/allpackages.dart';

import '../controller/cart_controller.dart';
import '../utils/commonvariable.dart';

class ProductDetailsList extends StatefulWidget {
   const ProductDetailsList(
      {super.key,   this.index});
   
  final int? index;

  @override
  State<ProductDetailsList> createState() => _ProductDetailsListState();
}

class _ProductDetailsListState extends State<ProductDetailsList> {
  ProductController productController = Get.put(ProductController());
    SharedPreferences ?prefs;
    final CartController cartController = Get.put(CartController());

  var selectedindex = 0;
  int counter = 0;

     _loadCounter() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
    counter = prefs!.getInt('counter') ?? 0;
    });
  }

  _incrementCounter() {
    setState(() {
      counter++;
    });
    prefs!.setInt('counter',  counter);
  }

  _decrementCounter() {
    setState(() {
      counter--;
    });
    prefs!.setInt('counter',  counter);
  }
  @override
  void initState() {
    
    super.initState();
    _loadCounter();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              
              Get.back();
               
            },
            child: Icon(Icons.arrow_back_ios)),
        title: Text('Product Detail'),
        backgroundColor: Colors.transparent,
        toolbarHeight: 8.0.hp,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
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
        }
        else{
        return Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             

              SizedBox(
                height: 3.0.hp,
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                        color: screenbackground,
                        height: 30.0.hp,
                        width: 55.0.wp,
                        child: Image.network(productController.getproductlist[0].data[widget.index!].productSmallImg)),
                  ),
                  Positioned(
                      right: 1.0.wp,
                      child: Row(
                        children: [
                          Container(
                            height: 5.0.hp,
                            width: 8.0.wp,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: subtitlecolor)),
                            child: Icon(
                              Icons.favorite_border_outlined,
                              color: subtitlecolor,
                              size: 20,
                            ),
                          ),
                          SizedBox(
                            width: 2.0.wp,
                          ),
                          Container(
                            height: 5.0.hp,
                            width: 8.0.wp,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: discountcolor)),
                            child: Icon(
                              Icons.edit_calendar_outlined,
                              color: discountcolor,
                              size: 20,
                            ),
                          )
                        ],
                      ))
                ],
              ),
              SizedBox(
                height: 1.5.hp,
              ),
              Text(
                productController.getproductlist[0].data[widget.index!].productName.toString(),
                style: subtitleStyle,
              ),
              SizedBox(
                height: 1.0.hp,
              ),
               
             
              SizedBox(
                height: 5.0.hp,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productController
                        .getproductlist[0].data[widget.index!].priceList.length,
                    itemBuilder: (context, pricedataindex) {
                      var pricedata = productController.getproductlist[0]
                          .data[widget.index!].priceList[pricedataindex];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedindex = widget.index!;
                                });
                              },
                              child: Container(
                                height: 3.0.hp,
                                width: 15.0.wp,
                                decoration: BoxDecoration(
                                    color: selectedindex == widget.index!
                                        ? productcolor
                                        : screenbackground,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: subtitlecolor)),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    '${pricedata.productWeight.toString()} ${pricedata.productWeightType.toString()}',
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            letterSpacing: 0.2,
                                            fontSize: 8.00.sp,
                                            color:
                                                selectedindex == widget.index!
                                                    ? screenbackground
                                                    : subtitlecolor,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                     height: 5.0.hp,
                                                    width: 28.0.wp,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: subtitlecolor),
                                                      borderRadius: BorderRadius.circular(50)
                                                    ),
                    child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                    children: [
                                                                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove,size: 15,color: toptitlecolor,),
                        onPressed: () {
                          cartController.decrement(widget.index!);
                          setState(() {
                            
                          });
                        
                        },
                      ),
                      Text('${cartController.counters[widget.index!].toString()}',style: amountStyle,),
                      IconButton(
                        icon: Icon(Icons.add,size: 15,color: toptitlecolor,),
                        onPressed: () {
                          cartController.increment(widget.index!);
                          setState(() {
                            
                          });
                        },
                      ),
                    ],
                              )
                           
                            ]),
                  ),
                  SizedBox(height: 1.0.hp,),
                Container(
                  height: 4.0.hp,
                  width: 20.0.wp,
                  child: Row(children: [
                     Text("\u{20B9}${productController.getproductlist[0].data[widget.index!].discountValue}",style:discountprice,),
                     SizedBox(width: 2.0.wp,),
                      Text("\u{20B9}${productController.getproductlist[0].data[widget.index!].discountValue. toString()}",style:amountStyle,),
                  ]),
                )
                   
                ],
              ),
           SizedBox(
                height: 1.0.hp,
              ),
              Text(
                'About this Product',
                style: amountStyle,
              ),
              SizedBox(
                height: 1.0.hp,
              ),
              Text(
                productController.getproductlist[0].data[widget.index!].productDescription.toString(),
                style: subtitleStyle,
              ),
              SizedBox(
                height: 1.0.hp,
              ),
         ]) );
  }}),
    );
  }
}
