import 'view_state_model.dart';

abstract class ViewRefresh<T> extends ViewStateModel {
  List<T> list = [];

  initDatas() async {
    setBusy();
    await refreshData(init: true);
  }

  refreshData({bool init = false}) async {
    try {
      List<T> datas = await loadData();
      if (datas.isEmpty) {
        list.clear();
        setEmpty();
      } else {
        onCompleted(datas);
        list.clear();
        list.addAll(datas);
        setIdle();
      }
    } catch (e, s) {
      if (init) list.clear();
      setError(e, s);
    }
  }

  Future<List<T>> loadData();

  onCompleted(List<T> data) {}
}
