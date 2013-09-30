GisUtil = function(gisFunction, mainFrame, gisFrame) {
	this.gisFunction = gisFunction;
	this.mainFrame = mainFrame;
	this.gisFrame = gisFrame;
};
GisUtil.prototype.showMain = function() {
	$(this.mainFrame).show();
	$(this.gisFrame).hide();
};
GisUtil.prototype.showGis = function() {
	$(this.mainFrame).hide();
	$(this.gisFrame).show();
};
GisUtil.prototype.toggle = function() {
	$(this.mainFrame).toggle();
	$(this.gisFrame).toggle();
};
GisUtil.prototype.addPoint = function(dwdm, wxyid, wxytype, remark) {
	this.showGis();
	var obj = this.getGisMapObject(dwdm, wxyid, wxytype, remark, '', '');
	this.gisFunction('无坐标打点', null, null, obj, null, null, null);
};
GisUtil.prototype.showPoint = function(dwdm, wxyid, wxytype, remark) {
	this.showGis();
	var obj = this.getGisMapObject(dwdm, wxyid, wxytype, remark, '', '');
	this.gisFunction('定位', null, null, obj, null, null, null);
};
GisUtil.prototype.invoke = function() {
	this.showGis();
	this.gisFunction.apply(this,arguments);
};
GisUtil.prototype.getGisMapObject = function(dwdm, wxyid, wxytype, remark, x, y) {
	var gisMapObject = {};
	gisMapObject.dwdm = dwdm;
    gisMapObject.wxyid = wxyid;
    gisMapObject.wxytype = wxytype;
    gisMapObject.remark = remark;
    gisMapObject.x = x;
    gisMapObject.y = y;
    return gisMapObject;
};
