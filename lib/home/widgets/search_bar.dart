import 'package:flutter/material.dart';

/// 搜索框状态
enum SearchType { home, normal, homeLight }

class SearchBar extends StatefulWidget {

  final bool enabled;
  final bool hideLeft;
  final SearchType searchType;
  final String? placeholder;
  final String? defaultText;
  final void Function()? leftButtonClick;
  final void Function()? rightButtonClick;
  final void Function()? speakClick;
  final void Function()? inputBoxClick;
  final ValueChanged<String>? onChanged;

  const SearchBar({Key? key, this.enabled = false, this.hideLeft = false, this.searchType = SearchType.home, this.placeholder, this.defaultText,  this.leftButtonClick, this.rightButtonClick, this.speakClick, this.inputBoxClick, this.onChanged}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool showClear = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if(widget.defaultText != null) {
      setState(() {
        _controller.text = widget.defaultText!;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchType == SearchType.normal ? _getNormalSearch() : _getHomeSearch();
  }

  _getNormalSearch() {
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 5, 10, 5),
      child: Row(
        children: [
          _wrapTap(Container(
            child: widget.hideLeft ? null : const Icon(Icons.arrow_back_ios, size: 26, color: Colors.grey),
          ), widget.leftButtonClick),
          Expanded(
            flex: 1,
            child: _inputBox(),
          ),
          _wrapTap(Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: const Text("搜索", style: TextStyle(color: Colors.blue, fontSize: 17)),
          ), widget.rightButtonClick)
        ],
      ),
    );
  }

  _getHomeSearch() {
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 5, 10, 5),
      child: Row(
        children: [
          _wrapTap(Container(
            padding: const EdgeInsets.fromLTRB(6, 5, 5, 5),
            child: Row(
              children: [
                Text("北京", style: TextStyle(color: _homeFontColor(), fontSize: 14)),
                Icon(Icons.expand_more, color: _homeFontColor(), size: 22)
              ],
            ),
          ), widget.leftButtonClick),
          Expanded(
            flex: 1,
            child: _inputBox(),
          ),
          _wrapTap(Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Icon(Icons.message, color: _homeFontColor(), size: 22),
          ), widget.rightButtonClick)
        ],
      ),
    );
  }

  _inputBox() {
    Color inputBoxColor;
    if(widget.searchType == SearchType.home) {
      inputBoxColor = Colors.white;
    } else {
      inputBoxColor = const Color(0xffededed);
    }

    return Container(
      height: 40,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: inputBoxColor,
          borderRadius: BorderRadius.circular(widget.searchType == SearchType.normal ? 5 : 15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search,
              size: 22,
              color: widget.searchType == SearchType.normal ? const Color(0xffa9a9a9) : Colors.blue
          ),
          Expanded(
            flex: 1,
            child: widget.searchType == SearchType.normal ? TextField(
              controller: _controller,
              onChanged: _onChanged,
              autofocus: true,
              style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w300
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                border: const OutlineInputBorder(borderSide: BorderSide.none),//InputBorder.none会导致文字下移，垂直不居中
                hintText: widget.placeholder,
                hintStyle: const TextStyle(fontSize: 15),
              ),
            ) : _wrapTap(Text(widget.defaultText ?? "", style: const TextStyle(fontSize: 13, color: Colors.grey)), widget.inputBoxClick),
          ),
          !showClear ? _wrapTap(Icon(Icons.mic, size: 22, color: widget.searchType == SearchType.normal ? Colors.blue : Colors.grey), widget.speakClick) :
          _wrapTap(const Icon(Icons.clear, size: 22, color: Colors.grey,), () {
            setState(() {
              _controller.clear();
            });
            _onChanged("");
          })
        ],

      ),
    );
  }

  _wrapTap(Widget child, void Function()? callBack) {
    return GestureDetector(
      onTap: (){
        if(callBack != null) {
          //方法回调
          callBack();
        }
      },
      child: child,
    );
  }

  _onChanged(String text) {
    if(text.isEmpty) {
      setState(() {
        showClear = false;
      });
    } else {
      setState(() {
        showClear = true;
      });
    }

    if(widget.onChanged != null) {
      widget.onChanged!(text);
    }
  }

  _homeFontColor() {
    return widget.searchType == SearchType.home ? Colors.white : Colors.black54;
  }
}
