import 'package:petcare/widgets/toast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'view_refresh.dart';

abstract class ViewListRefresh<T> extends ViewRefresh<T> {
  static const int pageSize = 10;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;
  int currentPage = 1;

  Future<List<T>> refreshData({bool init = false}) async {
    try {
      currentPage = 1;
      var data = await loadData(pageIndex: currentPage);
      if (data.isEmpty) {
        refreshController.refreshCompleted(resetFooterState: true);
        list.clear();
        setEmpty();
      } else {
        onCompleted(data);
        list.clear();
        list.addAll(data);
        refreshController.refreshCompleted();

        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        Toast.dismiss();
        setIdle();
      }
      return data;
    } catch (e, s) {
      if (init) list.clear();
      refreshController.refreshFailed();
      setError(e, s);
      Toast.dismiss();
      return null;
    }
  }

  Future<List<T>> loadMoreData() async {
    try {
      final pageIndex = currentPage + 1;
      var data = await loadData(pageIndex: pageIndex);
      if (data.isEmpty) {
        refreshController.loadNoData();
      } else {
        currentPage++;
        onCompleted(data);
        list.addAll(data);
        refreshController.refreshCompleted();

        if (data.length < pageSize) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        notifyListeners();
      }
      Toast.dismiss();
      return data;
    } catch (e, s) {
      refreshController.loadFailed();
      Toast.dismiss();
      return null;
    }
  }

  Future<List<T>> loadData({int pageIndex});

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}
