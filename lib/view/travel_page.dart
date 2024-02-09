 
import 'package:get_storage/get_storage.dart';
import 'package:product/allpackages.dart';
import 'package:product/controller/proposal_stop_open_controller.dart';

import '../controller/travel_controller.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  @override
  void initState() {
   getfunc();
    super.initState();
  }

  getfunc(){
    proposalTravelController.proposalTravelController().then((value) {
    setState(() {
      proposalTravelController.getproposalTravel[0].data[0].travelid;
    });
   });
   proposalStopOpenController.proposalStopController().then((value) {
    setState(() {
       proposalStopOpenController.getproposalStop[0].data[0].stopid;
    });
   });
    proposalStopOpenController.proposalOpenController().then((value) {
    setState(() {
       proposalStopOpenController.getproposalOpen[0].data[0].openingid;
    });
   });

  }
  ProposalTravelController proposalTravelController=Get.put(ProposalTravelController());
  ProposalStopOpenController proposalStopOpenController=Get.put(ProposalStopOpenController());
  var travel;
  var proposalstop;
  var proposalopen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.purpleAccent[400],
    ),
    body: Obx((){
      if(proposalTravelController.isproposaltravelLoad.value
      ||proposalStopOpenController.isproposalStopLoad.value||
      proposalStopOpenController.isproposalOpenLoad.value
      ){
        return Center(child: CircularProgressIndicator(),);
      }
      else if(proposalTravelController.getproposalTravel.isEmpty
      ||proposalStopOpenController.getproposalStop.isEmpty
      ||proposalStopOpenController.getproposalOpen.isEmpty
      ){
        return Center(child: Text('No data Found'),);
      }
      else{
  return Column(
        children: [
       Text(
                      'Travel*',
                      
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(children: [
                      Container(
                          height: 7.00.hp,
                          width: 90.00.wp,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: const Color(0xFFECE9E9),
                              width: MediaQuery.of(context).size.height * 0.001,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: travel,
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 10.00.sp,
                                     
                                      fontWeight: FontWeight.w500)),
                              hint: Text('Travel',
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 10.00.sp,
                                         
                                          fontWeight: FontWeight.w500))),
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    setState(() {
                                      travel = newValue.toString();
                                      print('newwvalue');
                                      print(newValue.toString());
                                      print('clickkkk');
                                     
                                      proposalTravelController
                                          .proposaltravelAmtController(
                                              travelid: travel,
                                              specid: 1,
                                              total: 1000
                                                  .toString(),
                                              subtotal: 1000
                                                  .toString());
                                      // travelcon=true;
                                    });
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: const Color(0xFF737070),
                              ),
                              items: proposalTravelController
                                      .getproposalTravel[0].data.isEmpty
                                  ? []
                                  : proposalTravelController
                                      .getproposalTravel[0].data
                                      .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value.travelid.toString(),
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 0, right: 4),
                                            child: Text(value.name.toString(),
                                            
                                                style: GoogleFonts.jost(
                                                    textStyle: TextStyle(
                                                        fontSize: 10.00.sp,
                                                        color: Colors.black,
                                                        
                                                        fontWeight:
                                                            FontWeight.w500)))),
                                      );
                                    }).toList(),
                            ),
                          )),
                    ]),
                     SizedBox(
                                height: 2.0.hp,
                              ),

                    Container(
                          height: 10.0.hp,
                          width: 100.0.wp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: const Color(0xFFECE9E9))),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 2.0.wp,
                                  ),
                                  Container(
                                    // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                    height: 2.00.hp,
                                    width: 45.00.wp,
                                    child: Text(
                                      'Stop*',
                                     
                                    ),
                                  ),
                                  Container(
                                    // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                    height: 2.00.hp,
                                    width: 25.00.wp,
                                    child: Text(
                                      'Opening*',
                                      
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.0.hp,
                              ),
                              Row(children: [
                                Row(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 1.0.wp,
                                      ),
                                      Container(
                                          height: 5.00.hp,
                                          width: 40.00.wp,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          decoration: BoxDecoration(
                                           
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            border: Border.all(
                                              color: const Color(0xFFECE9E9),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.001,
                                            ),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: proposalstop,
                                              style: GoogleFonts.jost(
                                                  textStyle: TextStyle(
                                                      fontSize: 10.00.sp,
                                                     
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              hint: Text('stop'),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  if (newValue != null) {
                                                    setState(() {
                                                      proposalstop =
                                                          newValue.toString();
                                                      print('newwvalue');
                                                      print(
                                                          newValue.toString());
                                                      print('clickkkk');
                                                    });
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                size: 20,
                                                color: const Color(0xFF737070),
                                              ),
                                              items: proposalStopOpenController
                                                      .getproposalStop[0]
                                                      .data
                                                      .isEmpty
                                                  ? []
                                                  : proposalStopOpenController
                                                      .getproposalStop[0].data
                                                      .map<
                                                          DropdownMenuItem<
                                                              String>>((value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value.stopid
                                                            .toString(),
                                                        child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 0,
                                                                    right: 4),
                                                            child:  Text(
                                                                    value.name,
                                                                    style: GoogleFonts.jost(
                                                                        textStyle: TextStyle(
                                                                            fontSize: 10.00
                                                                                .sp,
                                                                           color: Colors.black,
                                                                            fontWeight:
                                                                                FontWeight.w500)))
                                                             
                                                            
                                                      ));
                                                    }).toList(),
                                            ),
                                          )),
                                    ],
                                  ),
                                ]),
                                SizedBox(
                                  width: 5.0.wp,
                                ),
                                Row(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: 5.00.hp,
                                          width: 40.00.wp,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          decoration: BoxDecoration(
                                            
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            border: Border.all(
                                              color: const Color(0xFFECE9E9),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.001,
                                            ),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: proposalopen,
                                              style: GoogleFonts.jost(
                                                  textStyle: TextStyle(
                                                      fontSize: 10.00.sp,
                                                      
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              hint: Text('Opening'),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  if (newValue != null) {
                                                    setState(() {
                                                      proposalopen =
                                                          newValue.toString();
                                                      print('newwvalue');
                                                      print(
                                                          newValue.toString());
                                                      print('clickkkk');
                                                     
                                                    });
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                size: 20,
                                                color: const Color(0xFF737070),
                                              ),
                                              items: proposalStopOpenController
                                                      .getproposalOpen[0]
                                                      .data
                                                      .isEmpty
                                                  ? []
                                                  : proposalStopOpenController
                                                      .getproposalOpen[0].data
                                                      .map<
                                                          DropdownMenuItem<
                                                              String>>((value) {
                                                      return DropdownMenuItem<
                                                              String>(
                                                          value: value.openingid
                                                              .toString(),
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 0,
                                                                    right: 4),
                                                            child:   Text(
                                                                   value.name,
                                                                    style: GoogleFonts.jost(
                                                                        textStyle: TextStyle(
                                                                            fontSize: 10.00
                                                                                .sp,
                                                                                color: Colors.black,
                                                                           
                                                                            fontWeight:
                                                                                FontWeight.w500)))
                                                             
                                                           
                                                          ));
                                                    }).toList(),
                                            ),
                                          )),
                                    ],
                                  ),
                                ]),
                              ]),
                            ],
                          ),
                        )
        ],
        );
   }} ),
    );
  }
}