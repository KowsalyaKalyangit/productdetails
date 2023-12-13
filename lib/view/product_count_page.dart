 

import '../allpackages.dart';
import '../utils/textstyle.dart';

class ProductCountPage extends StatefulWidget {
  final String ?amount;
  const ProductCountPage({super.key,this.amount});

  @override
  State<ProductCountPage> createState() => _ProductCountPageState();
}

class _ProductCountPageState extends State<ProductCountPage> {
   int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 5.0.hp,
          width: 30.0.wp,
          decoration: BoxDecoration(
            border: Border.all(color: subtitlecolor),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Row(
            children: [
              IconButton(onPressed: (){
                decrement();
              }, icon: Icon(Icons.remove,size: 20,)),
              Text(count.toString()),
                IconButton(onPressed: (){
                  increment();
                }, icon: Icon(Icons.add,size: 20,))

            ],
          ),
        ),
        
    widget.amount!.isEmpty?Container():    Row(children: [ Text('\u{20B9}${widget.amount.toString()}',style: discountprice,),
        SizedBox(width: 2.0.wp,),
           Text('\u{20B9}${widget.amount.toString()}',style: amountStyle,),],)
      ],
    );
  }
}