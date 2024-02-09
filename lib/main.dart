 
 

 

import 'package:get_storage/get_storage.dart';

import 'allpackages.dart';
import 'view/travel_page.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       debugShowCheckedModeBanner: false,
        getPages: Routes.routes,
         
      home: TravelPage(),
    );
  }
}

 
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:product/controller/cart_controller.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Increment Decrement Example',
//       home: CounterScreen(),
//     );
//   }
// }

 

// class CounterScreen extends StatefulWidget {
//   @override
//   State<CounterScreen> createState() => _CounterScreenState();
// }

// class _CounterScreenState extends State<CounterScreen> {
//   final CartController controller = Get.put(CartController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Increment Decrement Example'),
//       ),
//       body: ListView.builder(
//         itemCount: controller.items.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text('Item $index'),
//             //subtitle: Text('Count: ${controller.items[index]}'),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.remove),
//                   onPressed: () {
//                     controller.decrement(index);
//                     setState(() {
                      
//                     });
                    
//                   },
//                 ),
//                 Text('${controller.items[index]}'),
//                 IconButton(
//                   icon: Icon(Icons.add),
//                   onPressed: () {
//                     controller.increment(index);
//                     setState(() {
                      
//                     });
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
 

 



