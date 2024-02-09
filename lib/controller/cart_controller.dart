import 'package:get_storage/get_storage.dart';

import '../allpackages.dart';

class CartController extends GetxController {
  RxList counters = List.generate(10, (index) => 0).obs;
  var countlist=[];
 var isLoading = true.obs;
 Function? disposeListen;

  increment(int index) {
    counters[index]++;
 
    _saveToLocalStorage();
  }

  decrement(int index) {
    if (counters[index] > 0) {
      counters[index]--;
      _saveToLocalStorage();
    }
  }

  _saveToLocalStorage() {
    GetStorage().write('counters', counters);
  }
_totalcount(){
  countlist.add(counters);
  GetStorage().write('totalcount', countlist);
}
  loadFromLocalStorage() {
     isLoading(true);
    var savedCounters = GetStorage().read<List<dynamic>>('counters');
    var savedCounterslist = GetStorage().read<List<dynamic>>('totalcount');
    if (savedCounters != null) {
      isLoading(false);
      counters = savedCounters.obs;
        
    }
    update();
      
    
  }

  @override
  void onInit() {
    loadFromLocalStorage();
    super.onInit();
  }
}
