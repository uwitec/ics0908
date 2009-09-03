
var PageName = 'userhome';
var PageId = 'p9cb4dd6c21c446d58ce0afa52f77fcd4'
var PageUrl = 'userhome.html'
document.title = 'userhome';

if (top.location != self.location)
{
	if (parent.HandleMainFrameChanged) {
		parent.HandleMainFrameChanged();
	}
}

var $OnLoadVariable = '';

var $CSUM;

var hasQuery = false;
var query = window.location.hash.substring(1);
if (query.length > 0) hasQuery = true;
var vars = query.split("&");
for (var i = 0; i < vars.length; i++) {
    var pair = vars[i].split("=");
    if (pair[0].length > 0) eval("$" + pair[0] + " = decodeURIComponent(pair[1]);");
} 

if (hasQuery && $CSUM != 1) {
alert('Prototype Warning: Variable values were truncated.');
}

function GetQuerystring() {
    return '#OnLoadVariable=' + encodeURIComponent($OnLoadVariable) + '&CSUM=1';
}

function PopulateVariables(value) {
  value = value.replace(/\[\[OnLoadVariable\]\]/g, $OnLoadVariable);
  value = value.replace(/\[\[PageName\]\]/g, PageName);
  return value;
}

function OnLoad(e) {

if (true) {

ApplyImageAndTextStyles('s', 'u71', 'u72', sJsonu72, false);
}

}

eval(GetDynamicPanelScript('u83', 6));

eval(GetDynamicPanelScript('u24', 1));

eval(GetDynamicPanelScript('u199', 1));

var u62 = document.getElementById('u62');
gv_vAlignTable['u62'] = 'top';
var u195 = document.getElementById('u195');
gv_vAlignTable['u195'] = 'center';
var u45 = document.getElementById('u45');

var u28 = document.getElementById('u28');
gv_vAlignTable['u28'] = 'center';
var u142 = document.getElementById('u142');

var u180 = document.getElementById('u180');

var u190 = document.getElementById('u190');

var u59 = document.getElementById('u59');
gv_vAlignTable['u59'] = 'top';
var u71 = document.getElementById('u71');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u71ann'), "<div id='u71Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u71', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u71').replace(/\[\[label\]\]/g, "Base Info Item"));

InsertAfterBegin(document.body, "<div id='u71based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u71base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u71based = document.getElementById('u71based');
            
InsertBeforeEnd(u71based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 基本信息菜单项，下有库房、货位等子项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div>");

u71.style.cursor = 'pointer';
if (bIE) u71.attachEvent("onclick", Clicku71);
else u71.addEventListener("click", Clicku71, true);
function Clicku71(e)
{

if (true) {

	SetPanelStateu83("pd0u83");

ApplyImageAndTextStyles('s', 'u71', 'u72', sJsonu72, false);
ApplyImageAndTextStyles('o', 'u73', 'u74', '', false);
ApplyImageAndTextStyles('o', 'u75', 'u76', '', false);
ApplyImageAndTextStyles('o', 'u77', 'u78', '', false);
ApplyImageAndTextStyles('o', 'u81', 'u82', '', false);
}

}

var u104 = document.getElementById('u104');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u104ann'), "<div id='u104Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u104', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u104').replace(/\[\[label\]\]/g, "Stock Out Item"));

InsertAfterBegin(document.body, "<div id='u104based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u104base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u104based = document.getElementById('u104based');
            
InsertBeforeEnd(u104based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 出库单管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u93 = document.getElementById('u93');
gv_vAlignTable['u93'] = 'center';
var u12 = document.getElementById('u12');
gv_vAlignTable['u12'] = 'center';
var u73 = document.getElementById('u73');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u73ann'), "<div id='u73Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u73', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u73').replace(/\[\[label\]\]/g, "Inventory Control Item"));

InsertAfterBegin(document.body, "<div id='u73based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u73base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u73based = document.getElementById('u73based');
            
InsertBeforeEnd(u73based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 库存管理目录项，下有入库项、出库项、盘点等子目录。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div>");

u73.style.cursor = 'pointer';
if (bIE) u73.attachEvent("onclick", Clicku73);
else u73.addEventListener("click", Clicku73, true);
function Clicku73(e)
{

if (true) {

	SetPanelStateu83("pd1u83");

ApplyImageAndTextStyles('s', 'u73', 'u74', sJsonu74, false);
ApplyImageAndTextStyles('o', 'u71', 'u72', '', false);
ApplyImageAndTextStyles('o', 'u75', 'u76', '', false);
ApplyImageAndTextStyles('o', 'u77', 'u78', '', false);
ApplyImageAndTextStyles('o', 'u81', 'u82', '', false);
}

}

var u112 = document.getElementById('u112');

var u128 = document.getElementById('u128');

var u193 = document.getElementById('u193');
gv_vAlignTable['u193'] = 'center';
var u56 = document.getElementById('u56');
gv_vAlignTable['u56'] = 'top';
var u161 = document.getElementById('u161');

var u91 = document.getElementById('u91');
gv_vAlignTable['u91'] = 'center';
var u206 = document.getElementById('u206');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u206ann'), "<div id='u206Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u206', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u206').replace(/\[\[label\]\]/g, "User Info"));

InsertAfterBegin(document.body, "<div id='u206based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u206base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u206based = document.getElementById('u206based');
            
InsertBeforeEnd(u206based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 用户个人简介<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> Proposed<BR><BR></div>");

var u173 = document.getElementById('u173');
gv_vAlignTable['u173'] = 'center';
var u90 = document.getElementById('u90');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u90ann'), "<div id='u90Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u90', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u90').replace(/\[\[label\]\]/g, "Store Hourse Item"));

InsertAfterBegin(document.body, "<div id='u90based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u90base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u90based = document.getElementById('u90based');
            
InsertBeforeEnd(u90based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 库房管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u40 = document.getElementById('u40');
gv_vAlignTable['u40'] = 'top';
var u163 = document.getElementById('u163');
gv_vAlignTable['u163'] = 'center';
var u179 = document.getElementById('u179');
gv_vAlignTable['u179'] = 'center';
var u23 = document.getElementById('u23');
gv_vAlignTable['u23'] = 'center';
var u88 = document.getElementById('u88');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u88ann'), "<div id='u88Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u88', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u88').replace(/\[\[label\]\]/g, "Dpt Job Item"));

InsertAfterBegin(document.body, "<div id='u88based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u88base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u88based = document.getElementById('u88based');
            
InsertBeforeEnd(u88based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 部门及岗位管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

u88.style.cursor = 'pointer';
if (bIE) u88.attachEvent("onclick", Clicku88);
else u88.addEventListener("click", Clicku88, true);
function Clicku88(e)
{

if (true) {

	self.location.href="orgstructure.html" + GetQuerystring();

}

}

var u130 = document.getElementById('u130');

var u108 = document.getElementById('u108');

var u54 = document.getElementById('u54');
gv_vAlignTable['u54'] = 'top';
var u100 = document.getElementById('u100');

var u177 = document.getElementById('u177');
gv_vAlignTable['u177'] = 'center';
var u37 = document.getElementById('u37');
gv_vAlignTable['u37'] = 'top';
var u209 = document.getElementById('u209');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u209ann'), "<div id='u209Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u209', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u209').replace(/\[\[label\]\]/g, "User Dialog Close"));

InsertAfterBegin(document.body, "<div id='u209based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u209base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u209based = document.getElementById('u209based');
            
InsertBeforeEnd(u209based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 单击关闭个人信息对话框<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> Proposed<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> Useful<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> Low<BR><BR></div>");

u209.style.cursor = 'pointer';
if (bIE) u209.attachEvent("onclick", Clicku209);
else u209.addEventListener("click", Clicku209, true);
function Clicku209(e)
{

if (true) {

	SetPanelVisibilityu199("hidden");

}

}

var u3 = document.getElementById('u3');
gv_vAlignTable['u3'] = 'center';
var u105 = document.getElementById('u105');
gv_vAlignTable['u105'] = 'center';
var u68 = document.getElementById('u68');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u68ann'), "<div id='u68Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u68', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u68').replace(/\[\[label\]\]/g, "English Name"));

InsertAfterBegin(document.body, "<div id='u68based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u68base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u68based = document.getElementById('u68based');
            
InsertBeforeEnd(u68based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 系统英文名<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 重要的(Important)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");
gv_vAlignTable['u68'] = 'top';
var u159 = document.getElementById('u159');
gv_vAlignTable['u159'] = 'center';
var u21 = document.getElementById('u21');
gv_vAlignTable['u21'] = 'center';
var u113 = document.getElementById('u113');
gv_vAlignTable['u113'] = 'center';
var u129 = document.getElementById('u129');
gv_vAlignTable['u129'] = 'center';
var u194 = document.getElementById('u194');

var u156 = document.getElementById('u156');

var u207 = document.getElementById('u207');
gv_vAlignTable['u207'] = 'center';
var u35 = document.getElementById('u35');
gv_vAlignTable['u35'] = 'top';
var u18 = document.getElementById('u18');
gv_vAlignTable['u18'] = 'center';
var u126 = document.getElementById('u126');

var u170 = document.getElementById('u170');

var u185 = document.getElementById('u185');
gv_vAlignTable['u185'] = 'center';
var u197 = document.getElementById('u197');
gv_vAlignTable['u197'] = 'center';
var u49 = document.getElementById('u49');
gv_vAlignTable['u49'] = 'top';
var u131 = document.getElementById('u131');
gv_vAlignTable['u131'] = 'center';
var u109 = document.getElementById('u109');
gv_vAlignTable['u109'] = 'center';
var u97 = document.getElementById('u97');
gv_vAlignTable['u97'] = 'center';
var u63 = document.getElementById('u63');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u63ann'), "<div id='u63Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u63', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u63').replace(/\[\[label\]\]/g, "Map Image"));

InsertAfterBegin(document.body, "<div id='u63based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u63base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u63based = document.getElementById('u63based');
            
InsertBeforeEnd(u63based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 一个图片，用来表示该区域是一个按钮，可以点击下拉出菜单。<BR><BR></div>");

var u84 = document.getElementById('u84');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u84ann'), "<div id='u84Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u84', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u84').replace(/\[\[label\]\]/g, "Base Info Sub Menu"));

InsertAfterBegin(document.body, "<div id='u84based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u84base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u84based = document.getElementById('u84based');
            
InsertBeforeEnd(u84based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 基本信息管理子菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div>");

var u106 = document.getElementById('u106');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u106ann'), "<div id='u106Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u106', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u106').replace(/\[\[label\]\]/g, "Inventory Item"));

InsertAfterBegin(document.body, "<div id='u106based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u106base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u106based = document.getElementById('u106based');
            
InsertBeforeEnd(u106based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 盘点管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u9 = document.getElementById('u9');
gv_vAlignTable['u9'] = 'top';
var u182 = document.getElementById('u182');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u182ann'), "<div id='u182Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u182', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u182').replace(/\[\[label\]\]/g, "Operation Log Item"));

InsertAfterBegin(document.body, "<div id='u182based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u182base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u182based = document.getElementById('u182based');
            
InsertBeforeEnd(u182based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 操作记录菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 有用的(Useful)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u46 = document.getElementById('u46');
gv_vAlignTable['u46'] = 'center';
var u198 = document.getElementById('u198');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u198ann'), "<div id='u198Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u198', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u198').replace(/\[\[label\]\]/g, "User Name"));

InsertAfterBegin(document.body, "<div id='u198based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u198base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u198based = document.getElementById('u198based');
            
InsertBeforeEnd(u198based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 单击用户名可以显示详细的用户信息。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 重要的(Important)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

u198.style.cursor = 'pointer';
if (bIE) u198.attachEvent("onclick", Clicku198);
else u198.addEventListener("click", Clicku198, true);
function Clicku198(e)
{

if (true) {

	SetPanelStateu199("pd0u199");

}

}
gv_vAlignTable['u198'] = 'top';
var u81 = document.getElementById('u81');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u81ann'), "<div id='u81Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u81', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u81').replace(/\[\[label\]\]/g, "System Manager Item"));

InsertAfterBegin(document.body, "<div id='u81based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u81base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u81based = document.getElementById('u81based');
            
InsertBeforeEnd(u81based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 系统管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div>");

u81.style.cursor = 'pointer';
if (bIE) u81.attachEvent("onclick", Clicku81);
else u81.addEventListener("click", Clicku81, true);
function Clicku81(e)
{

if (true) {

	SetPanelStateu83("pd5u83");

ApplyImageAndTextStyles('s', 'u81', 'u82', sJsonu82, false);
ApplyImageAndTextStyles('o', 'u77', 'u78', '', false);
ApplyImageAndTextStyles('o', 'u75', 'u76', '', false);
ApplyImageAndTextStyles('o', 'u73', 'u74', '', false);
ApplyImageAndTextStyles('o', 'u71', 'u72', '', false);
}

}

var u144 = document.getElementById('u144');

var u172 = document.getElementById('u172');

var u151 = document.getElementById('u151');
gv_vAlignTable['u151'] = 'center';
var u94 = document.getElementById('u94');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u94ann'), "<div id='u94Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u94', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u94').replace(/\[\[label\]\]/g, "Account Item"));

InsertAfterBegin(document.body, "<div id='u94based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u94base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u94based = document.getElementById('u94based');
            
InsertBeforeEnd(u94based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 银行帐号管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u30 = document.getElementById('u30');
gv_vAlignTable['u30'] = 'top';
var u77 = document.getElementById('u77');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u77ann'), "<div id='u77Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u77', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u77').replace(/\[\[label\]\]/g, "Report Item"));

InsertAfterBegin(document.body, "<div id='u77based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u77base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u77based = document.getElementById('u77based');
            
InsertBeforeEnd(u77based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 报表功能菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。但其子项由于其需求的不确定性可能会有所变化。<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div>");

u77.style.cursor = 'pointer';
if (bIE) u77.attachEvent("onclick", Clicku77);
else u77.addEventListener("click", Clicku77, true);
function Clicku77(e)
{

if (true) {

	SetPanelStateu83("pd3u83");

ApplyImageAndTextStyles('s', 'u77', 'u78', sJsonu78, false);
ApplyImageAndTextStyles('o', 'u81', 'u82', '', false);
ApplyImageAndTextStyles('o', 'u75', 'u76', '', false);
ApplyImageAndTextStyles('o', 'u73', 'u74', '', false);
ApplyImageAndTextStyles('o', 'u71', 'u72', '', false);
}

}

var u152 = document.getElementById('u152');

var u61 = document.getElementById('u61');
gv_vAlignTable['u61'] = 'top';
var u168 = document.getElementById('u168');

var u7 = document.getElementById('u7');

var u13 = document.getElementById('u13');
gv_vAlignTable['u13'] = 'top';
var u95 = document.getElementById('u95');
gv_vAlignTable['u95'] = 'center';
var u125 = document.getElementById('u125');
gv_vAlignTable['u125'] = 'center';
var u96 = document.getElementById('u96');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u96ann'), "<div id='u96Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u96', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u96').replace(/\[\[label\]\]/g, "Person Item"));

InsertAfterBegin(document.body, "<div id='u96based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u96base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u96based = document.getElementById('u96based');
            
InsertBeforeEnd(u96based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 人员管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 有用的(Useful)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u137 = document.getElementById('u137');
gv_vAlignTable['u137'] = 'center';
var u44 = document.getElementById('u44');
gv_vAlignTable['u44'] = 'center';
var u165 = document.getElementById('u165');
gv_vAlignTable['u165'] = 'center';
var u181 = document.getElementById('u181');

var u27 = document.getElementById('u27');

var u4 = document.getElementById('u4');

var u2 = document.getElementById('u2');

var u75 = document.getElementById('u75');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u75ann'), "<div id='u75Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u75', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u75').replace(/\[\[label\]\]/g, "Inventory Decision Item"));

InsertAfterBegin(document.body, "<div id='u75based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u75base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u75based = document.getElementById('u75based');
            
InsertBeforeEnd(u75based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 库存决策菜单项，该功能为以后作扩展，暂不实现。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 有用的(Useful)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 中(Medium)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。<BR><BR></div>");

u75.style.cursor = 'pointer';
if (bIE) u75.attachEvent("onclick", Clicku75);
else u75.addEventListener("click", Clicku75, true);
function Clicku75(e)
{

if (true) {

	SetPanelStateu83("pd2u83");

ApplyImageAndTextStyles('s', 'u75', 'u76', sJsonu76, false);
ApplyImageAndTextStyles('o', 'u71', 'u72', '', false);
ApplyImageAndTextStyles('o', 'u73', 'u74', '', false);
ApplyImageAndTextStyles('o', 'u77', 'u78', '', false);
ApplyImageAndTextStyles('o', 'u81', 'u82', '', false);
}

}

var u132 = document.getElementById('u132');

var u148 = document.getElementById('u148');

var u58 = document.getElementById('u58');
gv_vAlignTable['u58'] = 'top';
var u140 = document.getElementById('u140');

var u183 = document.getElementById('u183');
gv_vAlignTable['u183'] = 'center';
var u199 = document.getElementById('u199');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u199ann'), "<div id='u199Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u199', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u199').replace(/\[\[label\]\]/g, "User Info Panel"));

InsertAfterBegin(document.body, "<div id='u199based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u199base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u199based = document.getElementById('u199based');
            
InsertBeforeEnd(u199based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 个人信息展示面板，单击用户名可以打开用户详细信息面板，单击上面关闭按钮可以关闭信息框。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 重要的(Important)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u42 = document.getElementById('u42');
gv_vAlignTable['u42'] = 'top';
var u145 = document.getElementById('u145');
gv_vAlignTable['u145'] = 'center';
var u191 = document.getElementById('u191');
gv_vAlignTable['u191'] = 'center';
var u103 = document.getElementById('u103');
gv_vAlignTable['u103'] = 'center';
var u25 = document.getElementById('u25');

var u153 = document.getElementById('u153');
gv_vAlignTable['u153'] = 'center';
var u169 = document.getElementById('u169');
gv_vAlignTable['u169'] = 'center';
var u196 = document.getElementById('u196');

var u201 = document.getElementById('u201');
gv_vAlignTable['u201'] = 'center';
var u127 = document.getElementById('u127');
gv_vAlignTable['u127'] = 'center';
var u160 = document.getElementById('u160');

var u39 = document.getElementById('u39');
gv_vAlignTable['u39'] = 'top';
var u70 = document.getElementById('u70');

var u120 = document.getElementById('u120');

var u187 = document.getElementById('u187');
gv_vAlignTable['u187'] = 'center';
var u87 = document.getElementById('u87');

var u53 = document.getElementById('u53');
gv_vAlignTable['u53'] = 'top';
var u8 = document.getElementById('u8');
gv_vAlignTable['u8'] = 'center';
var u36 = document.getElementById('u36');
gv_vAlignTable['u36'] = 'top';
var u171 = document.getElementById('u171');
gv_vAlignTable['u171'] = 'center';
var u149 = document.getElementById('u149');
gv_vAlignTable['u149'] = 'center';
var u20 = document.getElementById('u20');

var u67 = document.getElementById('u67');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u67ann'), "<div id='u67Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u67', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u67').replace(/\[\[label\]\]/g, "Chinese Name"));

InsertAfterBegin(document.body, "<div id='u67based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u67base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u67based = document.getElementById('u67based');
            
InsertBeforeEnd(u67based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 系统中文名<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");
gv_vAlignTable['u67'] = 'top';
var u52 = document.getElementById('u52');
gv_vAlignTable['u52'] = 'top';
var u141 = document.getElementById('u141');

var u6 = document.getElementById('u6');
gv_vAlignTable['u6'] = 'top';
var u184 = document.getElementById('u184');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u184ann'), "<div id='u184Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u184', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u184').replace(/\[\[label\]\]/g, "Online User Item"));

InsertAfterBegin(document.body, "<div id='u184based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u184base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u184based = document.getElementById('u184based');
            
InsertBeforeEnd(u184based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 在线用户管理菜单。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 有用的(Useful)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u85 = document.getElementById('u85');
gv_vAlignTable['u85'] = 'center';
var u146 = document.getElementById('u146');

var u34 = document.getElementById('u34');
gv_vAlignTable['u34'] = 'top';
var u154 = document.getElementById('u154');

var u99 = document.getElementById('u99');
gv_vAlignTable['u99'] = 'center';
var u202 = document.getElementById('u202');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u202ann'), "<div id='u202Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u202', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u202').replace(/\[\[label\]\]/g, "User photo"));

InsertAfterBegin(document.body, "<div id='u202based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u202base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u202based = document.getElementById('u202based');
            
InsertBeforeEnd(u202based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 用户头像<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> Proposed<BR><BR></div>");

var u17 = document.getElementById('u17');

var u1 = document.getElementById('u1');
gv_vAlignTable['u1'] = 'center';
var u65 = document.getElementById('u65');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u65ann'), "<div id='u65Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u65', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u65').replace(/\[\[label\]\]/g, "Logo"));

InsertAfterBegin(document.body, "<div id='u65based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u65base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u65based = document.getElementById('u65based');
            
InsertBeforeEnd(u65based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 公司LOGO<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u48 = document.getElementById('u48');
gv_vAlignTable['u48'] = 'top';
var u121 = document.getElementById('u121');

var u210 = document.getElementById('u210');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u210ann'), "<div id='u210Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u210', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u210').replace(/\[\[label\]\]/g, "User Info Line"));

InsertAfterBegin(document.body, "<div id='u210based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u210base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u210based = document.getElementById('u210based');
            
InsertBeforeEnd(u210based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 个人信息框中的分隔线<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> Proposed<BR><BR></div>");

var u167 = document.getElementById('u167');
gv_vAlignTable['u167'] = 'center';
var u203 = document.getElementById('u203');
gv_vAlignTable['u203'] = 'center';
var u79 = document.getElementById('u79');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u79ann'), "<div id='u79Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u79', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u79').replace(/\[\[label\]\]/g, "Approval Process Item"));

InsertAfterBegin(document.body, "<div id='u79based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u79base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u79based = document.getElementById('u79based');
            
InsertBeforeEnd(u79based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 领导审批菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div>");

var u188 = document.getElementById('u188');

var u32 = document.getElementById('u32');
gv_vAlignTable['u32'] = 'top';
var u80 = document.getElementById('u80');
gv_vAlignTable['u80'] = 'center';
var u134 = document.getElementById('u134');

var u51 = document.getElementById('u51');
gv_vAlignTable['u51'] = 'top';
var u143 = document.getElementById('u143');
gv_vAlignTable['u143'] = 'center';
var u76 = document.getElementById('u76');
gv_vAlignTable['u76'] = 'center';
var u155 = document.getElementById('u155');
gv_vAlignTable['u155'] = 'center';
var u158 = document.getElementById('u158');

var u101 = document.getElementById('u101');

var u204 = document.getElementById('u204');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u204ann'), "<div id='u204Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u204', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u204').replace(/\[\[label\]\]/g, "User name"));

InsertAfterBegin(document.body, "<div id='u204based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u204base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u204based = document.getElementById('u204based');
            
InsertBeforeEnd(u204based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 显示用户姓名、职称等<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> Proposed<BR><BR></div>");

var u147 = document.getElementById('u147');
gv_vAlignTable['u147'] = 'center';
var u60 = document.getElementById('u60');
gv_vAlignTable['u60'] = 'top';
var u117 = document.getElementById('u117');
gv_vAlignTable['u117'] = 'center';
var u150 = document.getElementById('u150');

var u43 = document.getElementById('u43');

var u114 = document.getElementById('u114');

var u89 = document.getElementById('u89');
gv_vAlignTable['u89'] = 'center';
var u174 = document.getElementById('u174');

var u26 = document.getElementById('u26');
gv_vAlignTable['u26'] = 'top';
var u124 = document.getElementById('u124');

var u74 = document.getElementById('u74');
gv_vAlignTable['u74'] = 'center';
var u122 = document.getElementById('u122');

var u138 = document.getElementById('u138');

var u136 = document.getElementById('u136');

var u10 = document.getElementById('u10');
gv_vAlignTable['u10'] = 'top';
var u57 = document.getElementById('u57');
gv_vAlignTable['u57'] = 'top';
var u92 = document.getElementById('u92');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u92ann'), "<div id='u92Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u92', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u92').replace(/\[\[label\]\]/g, "Materials Item"));

InsertAfterBegin(document.body, "<div id='u92based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u92base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u92based = document.getElementById('u92based');
            
InsertBeforeEnd(u92based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 物品管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u5 = document.getElementById('u5');
gv_vAlignTable['u5'] = 'center';
var u189 = document.getElementById('u189');
gv_vAlignTable['u189'] = 'center';
var u41 = document.getElementById('u41');
gv_vAlignTable['u41'] = 'top';
var u135 = document.getElementById('u135');
gv_vAlignTable['u135'] = 'center';
var u24 = document.getElementById('u24');

var u72 = document.getElementById('u72');
gv_vAlignTable['u72'] = 'center';
var u102 = document.getElementById('u102');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u102ann'), "<div id='u102Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u102', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u102').replace(/\[\[label\]\]/g, "Stock In Item"));

InsertAfterBegin(document.body, "<div id='u102based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u102base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u102based = document.getElementById('u102based');
            
InsertBeforeEnd(u102based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 入库单管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u118 = document.getElementById('u118');

var u0 = document.getElementById('u0');

var u55 = document.getElementById('u55');
gv_vAlignTable['u55'] = 'top';
var u38 = document.getElementById('u38');
gv_vAlignTable['u38'] = 'top';
var u83 = document.getElementById('u83');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u83ann'), "<div id='u83Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u83', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u83').replace(/\[\[label\]\]/g, "Menu Panel"));

InsertAfterBegin(document.body, "<div id='u83based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u83base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u83based = document.getElementById('u83based');
            
InsertBeforeEnd(u83based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 二级目录面板。该区域用来显示不同的二级目录。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div>");

var u110 = document.getElementById('u110');

var u86 = document.getElementById('u86');

var u115 = document.getElementById('u115');
gv_vAlignTable['u115'] = 'center';
var u69 = document.getElementById('u69');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u69ann'), "<div id='u69Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u69', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u69').replace(/\[\[label\]\]/g, "Menu"));

InsertAfterBegin(document.body, "<div id='u69based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u69base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u69based = document.getElementById('u69based');
            
InsertBeforeEnd(u69based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 主目录面板。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div>");

var u22 = document.getElementById('u22');

u22.style.cursor = 'pointer';
if (bIE) u22.attachEvent("onclick", Clicku22);
else u22.addEventListener("click", Clicku22, true);
function Clicku22(e)
{

if (true) {

	var obj1 = document.getElementById("u24");
	if (obj1.style.visibility == "" || obj1.style.visibility == "visible") { SetPanelVisibilityu24("hidden"); }
	else {SetPanelVisibilityu24("");}

}

}

var u123 = document.getElementById('u123');
gv_vAlignTable['u123'] = 'center';
var u139 = document.getElementById('u139');
gv_vAlignTable['u139'] = 'center';
var u186 = document.getElementById('u186');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u186ann'), "<div id='u186Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u186', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u186').replace(/\[\[label\]\]/g, "System Log Item"));

InsertAfterBegin(document.body, "<div id='u186based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u186base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u186based = document.getElementById('u186based');
            
InsertBeforeEnd(u186based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 系统日志菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 有用的(Useful)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u166 = document.getElementById('u166');

var u66 = document.getElementById('u66');
gv_vAlignTable['u66'] = 'center';
var u133 = document.getElementById('u133');
gv_vAlignTable['u133'] = 'center';
var u19 = document.getElementById('u19');

var u50 = document.getElementById('u50');
gv_vAlignTable['u50'] = 'top';
var u157 = document.getElementById('u157');
gv_vAlignTable['u157'] = 'center';
var u15 = document.getElementById('u15');
gv_vAlignTable['u15'] = 'top';
var u33 = document.getElementById('u33');
gv_vAlignTable['u33'] = 'top';
var u107 = document.getElementById('u107');
gv_vAlignTable['u107'] = 'center';
var u98 = document.getElementById('u98');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u98ann'), "<div id='u98Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u98', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u98').replace(/\[\[label\]\]/g, "Store Manage Sub Menu"));

InsertAfterBegin(document.body, "<div id='u98based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u98base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u98based = document.getElementById('u98based');
            
InsertBeforeEnd(u98based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 库存管理二级菜单面板。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u16 = document.getElementById('u16');

u16.style.cursor = 'pointer';
if (bIE) u16.attachEvent("onclick", Clicku16);
else u16.addEventListener("click", Clicku16, true);
function Clicku16(e)
{

if (true) {

	self.location.href="login.html" + GetQuerystring();

}

}
gv_vAlignTable['u16'] = 'top';
var u119 = document.getElementById('u119');
gv_vAlignTable['u119'] = 'center';
var u208 = document.getElementById('u208');
gv_vAlignTable['u208'] = 'top';
var u64 = document.getElementById('u64');
gv_vAlignTable['u64'] = 'center';
var u164 = document.getElementById('u164');

var u111 = document.getElementById('u111');
gv_vAlignTable['u111'] = 'center';
var u200 = document.getElementById('u200');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u200ann'), "<div id='u200Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u200', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u200').replace(/\[\[label\]\]/g, "User Info Dialog"));

InsertAfterBegin(document.body, "<div id='u200based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u200base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u200based = document.getElementById('u200based');
            
InsertBeforeEnd(u200based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 个人信息对话框<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> Proposed<BR><BR></div>");

var u192 = document.getElementById('u192');

var u176 = document.getElementById('u176');

var u47 = document.getElementById('u47');
gv_vAlignTable['u47'] = 'top';
var u175 = document.getElementById('u175');
gv_vAlignTable['u175'] = 'center';
var u82 = document.getElementById('u82');
gv_vAlignTable['u82'] = 'center';
var u116 = document.getElementById('u116');

var u205 = document.getElementById('u205');
gv_vAlignTable['u205'] = 'center';
var u78 = document.getElementById('u78');
gv_vAlignTable['u78'] = 'center';
var u31 = document.getElementById('u31');
gv_vAlignTable['u31'] = 'top';
var u11 = document.getElementById('u11');

var u162 = document.getElementById('u162');

var u29 = document.getElementById('u29');
gv_vAlignTable['u29'] = 'top';
var u178 = document.getElementById('u178');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u178ann'), "<div id='u178Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u178', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u178').replace(/\[\[label\]\]/g, "System Sub Item"));

InsertAfterBegin(document.body, "<div id='u178based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u178base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u178based = document.getElementById('u178based');
            
InsertBeforeEnd(u178based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 系统管理子菜单面板。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u14 = document.getElementById('u14');
gv_vAlignTable['u14'] = 'top';
if (window.OnLoad) OnLoad();
