
function fontSizeChanged(size) {
    console.log("font changed size = " + size);
    var pixelSize = size + "px";
    document.documentElement.style.setProperty("font-size", pixelSize);
}

/// 获取时间标签最大Y值
function getSourceTimeMaxY() {
    var e = document.querySelector(".time")
    //clientHeight是time标签自己的高度
    var t = e.offsetTop + e.clientHeight;
    while(e=e.offsetParent){
        t +=e.offsetTop;
    }
    return t
}
