import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_study_demo/main/loading_container.dart';
import 'package:flutter_study_demo/main/web_page.dart';
import 'package:flutter_study_demo/travel/model/travel_model.dart';
import 'package:flutter_study_demo/travel/request/travel_dao.dart';

const travelNormalUrl =
    'https://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031014111431397988&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5';
const pageSize = 10;

class TravelTabPage extends StatefulWidget {
  final String? travelUrl;
  final String? groupChannelCode;

  const TravelTabPage({Key? key, this.travelUrl, this.groupChannelCode}) : super(key: key);

  @override
  _TravelTabPageState createState() => _TravelTabPageState();
}

class _TravelTabPageState extends State<TravelTabPage> with AutomaticKeepAliveClientMixin {
  List<TravelItem>? travelItems;
  int pageIndex = 1;
  late bool _loading = true;
  final ScrollController _controller = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadData();
    _controller.addListener(() {
      if(_controller.position.pixels == _controller.position.maxScrollExtent) {
        _loadData(loadMore: true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _loadData({bool loadMore = false}) {
    if(loadMore) {
      pageIndex++;
    } else {
      pageIndex = 1;
      travelItems = null;
    }
    TravelDao.fetch(widget.travelUrl ?? travelNormalUrl, widget.groupChannelCode ?? "",  pageIndex, pageSize).then((TravelModel model){
      setState(() {
        _loading = false;
        List<TravelItem> items = _filterItems(model.resultList);
        if(travelItems != null) {
          travelItems!.addAll(items);
        } else {
          travelItems = items;
        }
      });
    }).catchError((error){
      setState(() {
        _loading = false;
      });
    });
  }

  List<TravelItem> _filterItems(List<TravelItem>? resultList) {
    if(resultList == null){
      return [];
    }
    List<TravelItem> filterItems = [];
    for(TravelItem item in resultList) {
      if(item.article != null) {
        filterItems.add(item);
      }
    }

    return filterItems;
  }

  Future<void> _onRefresh() async {
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: LoadingContainer(
            isLoading: _loading,
            child: RefreshIndicator(
              onRefresh: _onRefresh,
              child: MediaQuery.removePadding(context: context,
                removeTop: true,
                child: StaggeredGridView.countBuilder(
                  controller: _controller,
                  crossAxisCount: 4,
                  itemCount: travelItems?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) => TravelItemCell(index: index, item: travelItems?[index]),
                  staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                ),
              ),
            )
        )
    );
  }
}

class TravelItemCell extends StatelessWidget {
  final int index;
  final TravelItem? item;

  const TravelItemCell({Key? key, required this.index, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(item?.article?.urls != null && (item?.article?.urls ?? []).isNotEmpty){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return WebViewPage(url: item!.article!.urls![0].h5Url, title: "详情");
          }));
        }
      },
      child: Card(
        child: PhysicalModel(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _itemImage(),
              Container(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    item?.article?.articleTitle ?? "",
                    style: const TextStyle(color: Colors.black87, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  )
              ),
              _infoText()
            ],
          ),
        ),
      ),
    );
  }

  _itemImage() {
    return Stack(
      children: [
        Image.network(item?.article?.images?[0].dynamicUrl ?? ""),
        //定位标签在左下角
        Positioned(
          bottom: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 3),
                  child: Icon(Icons.location_on, size: 12, color: Colors.white),
                ),
                LimitedBox(
                  maxWidth: 130,
                  child: Text(
                    _poiName(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )
              ],
            ),

          ),
        )
      ],
    );
  }

  String _poiName() {
    if(item?.article?.pois == null || (item?.article?.pois ?? []).isEmpty){
      return "未知";
    }
    return item?.article?.pois?[0].poiName ?? "未知";
  }

  _infoText() {
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 0, 6, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              PhysicalModel(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
                clipBehavior: Clip.antiAlias,
                child: Image.network(item?.article?.author?.coverImage?.dynamicUrl ?? "", width: 30, height: 30),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                width: 90,
                child: Text(
                  item?.article?.author?.nickName ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
          Row(
            children: [
              const Icon(Icons.thumb_up, size: 14, color: Colors.black),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  item?.article?.likeCount.toString() ?? "",
                  style: const TextStyle(fontSize: 10),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}


