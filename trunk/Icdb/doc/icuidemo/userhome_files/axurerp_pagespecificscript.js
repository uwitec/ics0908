
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

ApplyImageAndTextStyles('s', 'u19', 'u20', sJsonu20, false);
}

}

eval(GetDynamicPanelScript('u29', 5));

eval(GetDynamicPanelScript('u141', 1));

eval(GetDynamicPanelScript('u181', 1));

var u62 = document.getElementById('u62');

var u45 = document.getElementById('u45');
gv_vAlignTable['u45'] = 'center';
var u28 = document.getElementById('u28');
gv_vAlignTable['u28'] = 'center';
var u142 = document.getElementById('u142');

var u180 = document.getElementById('u180');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u180ann'), "<div id='u180Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u180', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u180').replace(/\[\[label\]\]/g, "User Name"));

InsertAfterBegin(document.body, "<div id='u180based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u180base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u180based = document.getElementById('u180based');
            
InsertBeforeEnd(u180based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 单击用户名可以显示详细的用户信息。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 重要的(Important)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

u180.style.cursor = 'pointer';
if (bIE) u180.attachEvent("onclick", Clicku180);
else u180.addEventListener("click", Clicku180, true);
function Clicku180(e)
{

if (true) {

	SetPanelStateu181("pd0u181");

}

}
gv_vAlignTable['u180'] = 'top';
var u190 = document.getElementById('u190');
gv_vAlignTable['u190'] = 'top';
var u59 = document.getElementById('u59');
gv_vAlignTable['u59'] = 'center';
var u71 = document.getElementById('u71');
gv_vAlignTable['u71'] = 'center';
var u104 = document.getElementById('u104');

var u93 = document.getElementById('u93');

var u12 = document.getElementById('u12');
gv_vAlignTable['u12'] = 'center';
var u73 = document.getElementById('u73');

var u112 = document.getElementById('u112');

var u128 = document.getElementById('u128');

var u193 = document.getElementById('u193');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u193ann'), "<div id='u193Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u193', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u193').replace(/\[\[label\]\]/g, "Map Image"));

InsertAfterBegin(document.body, "<div id='u193based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u193base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u193based = document.getElementById('u193based');
            
InsertBeforeEnd(u193based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 一个图片，用来表示该区域是一个按钮，可以点击下拉出菜单。<BR><BR></div>");

var u56 = document.getElementById('u56');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u56ann'), "<div id='u56Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u56', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u56').replace(/\[\[label\]\]/g, "Stock Out Item"));

InsertAfterBegin(document.body, "<div id='u56based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u56base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u56based = document.getElementById('u56based');
            
InsertBeforeEnd(u56based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 出库单管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u161 = document.getElementById('u161');
gv_vAlignTable['u161'] = 'center';
var u91 = document.getElementById('u91');
gv_vAlignTable['u91'] = 'center';
var u173 = document.getElementById('u173');
gv_vAlignTable['u173'] = 'top';
var u90 = document.getElementById('u90');

var u40 = document.getElementById('u40');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u40ann'), "<div id='u40Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u40', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u40').replace(/\[\[label\]\]/g, "Cargo space Item"));

InsertAfterBegin(document.body, "<div id='u40based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u40base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u40based = document.getElementById('u40based');
            
InsertBeforeEnd(u40based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 货位管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u163 = document.getElementById('u163');
gv_vAlignTable['u163'] = 'center';
var u179 = document.getElementById('u179');
gv_vAlignTable['u179'] = 'top';
var u23 = document.getElementById('u23');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u23ann'), "<div id='u23Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u23', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u23').replace(/\[\[label\]\]/g, "Inventory Decision Item"));

InsertAfterBegin(document.body, "<div id='u23based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u23base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u23based = document.getElementById('u23based');
            
InsertBeforeEnd(u23based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 库存决策菜单项，该功能为以后作扩展，暂不实现。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 有用的(Useful)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 中(Medium)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。<BR><BR></div>");

u23.style.cursor = 'pointer';
if (bIE) u23.attachEvent("onclick", Clicku23);
else u23.addEventListener("click", Clicku23, true);
function Clicku23(e)
{

if (true) {

	SetPanelStateu29("pd2u29");

ApplyImageAndTextStyles('s', 'u23', 'u24', sJsonu24, false);
ApplyImageAndTextStyles('o', 'u19', 'u20', '', false);
ApplyImageAndTextStyles('o', 'u21', 'u22', '', false);
ApplyImageAndTextStyles('o', 'u25', 'u26', '', false);
ApplyImageAndTextStyles('o', 'u27', 'u28', '', false);
}

}

var u88 = document.getElementById('u88');

var u130 = document.getElementById('u130');

var u108 = document.getElementById('u108');

var u54 = document.getElementById('u54');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u54ann'), "<div id='u54Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u54', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u54').replace(/\[\[label\]\]/g, "Stock In Item"));

InsertAfterBegin(document.body, "<div id='u54based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u54base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u54based = document.getElementById('u54based');
            
InsertBeforeEnd(u54based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 入库单管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u100 = document.getElementById('u100');

var u177 = document.getElementById('u177');
gv_vAlignTable['u177'] = 'top';
var u37 = document.getElementById('u37');
gv_vAlignTable['u37'] = 'center';
var u3 = document.getElementById('u3');
gv_vAlignTable['u3'] = 'center';
var u105 = document.getElementById('u105');
gv_vAlignTable['u105'] = 'center';
var u68 = document.getElementById('u68');

var u159 = document.getElementById('u159');
gv_vAlignTable['u159'] = 'top';
var u21 = document.getElementById('u21');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u21ann'), "<div id='u21Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u21', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u21').replace(/\[\[label\]\]/g, "Inventory Control Item"));

InsertAfterBegin(document.body, "<div id='u21based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u21base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u21based = document.getElementById('u21based');
            
InsertBeforeEnd(u21based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 库存管理目录项，下有入库项、出库项、盘点等子目录。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div>");

u21.style.cursor = 'pointer';
if (bIE) u21.attachEvent("onclick", Clicku21);
else u21.addEventListener("click", Clicku21, true);
function Clicku21(e)
{

if (true) {

	SetPanelStateu29("pd1u29");

ApplyImageAndTextStyles('s', 'u21', 'u22', sJsonu22, false);
ApplyImageAndTextStyles('o', 'u19', 'u20', '', false);
ApplyImageAndTextStyles('o', 'u23', 'u24', '', false);
ApplyImageAndTextStyles('o', 'u25', 'u26', '', false);
ApplyImageAndTextStyles('o', 'u27', 'u28', '', false);
}

}

var u113 = document.getElementById('u113');

var u129 = document.getElementById('u129');
gv_vAlignTable['u129'] = 'center';
var u194 = document.getElementById('u194');
gv_vAlignTable['u194'] = 'center';
var u156 = document.getElementById('u156');
gv_vAlignTable['u156'] = 'top';
var u35 = document.getElementById('u35');
gv_vAlignTable['u35'] = 'center';
var u18 = document.getElementById('u18');

var u126 = document.getElementById('u126');

var u170 = document.getElementById('u170');
gv_vAlignTable['u170'] = 'top';
var u185 = document.getElementById('u185');
gv_vAlignTable['u185'] = 'center';
var u49 = document.getElementById('u49');
gv_vAlignTable['u49'] = 'center';
var u131 = document.getElementById('u131');
gv_vAlignTable['u131'] = 'center';
var u109 = document.getElementById('u109');
gv_vAlignTable['u109'] = 'center';
var u97 = document.getElementById('u97');
gv_vAlignTable['u97'] = 'center';
var u63 = document.getElementById('u63');
gv_vAlignTable['u63'] = 'center';
var u84 = document.getElementById('u84');

var u106 = document.getElementById('u106');

var u9 = document.getElementById('u9');
gv_vAlignTable['u9'] = 'top';
var u182 = document.getElementById('u182');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u182ann'), "<div id='u182Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u182', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u182').replace(/\[\[label\]\]/g, "User Info Dialog"));

InsertAfterBegin(document.body, "<div id='u182based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u182base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u182based = document.getElementById('u182based');
            
InsertBeforeEnd(u182based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 个人信息对话框<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> Proposed<BR><BR></div>");

var u46 = document.getElementById('u46');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u46ann'), "<div id='u46Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u46', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u46').replace(/\[\[label\]\]/g, "Account Item"));

InsertAfterBegin(document.body, "<div id='u46based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u46base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u46based = document.getElementById('u46based');
            
InsertBeforeEnd(u46based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 银行帐号管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u81 = document.getElementById('u81');
gv_vAlignTable['u81'] = 'center';
var u144 = document.getElementById('u144');

var u172 = document.getElementById('u172');
gv_vAlignTable['u172'] = 'top';
var u151 = document.getElementById('u151');
gv_vAlignTable['u151'] = 'top';
var u94 = document.getElementById('u94');

var u30 = document.getElementById('u30');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u30ann'), "<div id='u30Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u30', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u30').replace(/\[\[label\]\]/g, "Base Info Sub Menu"));

InsertAfterBegin(document.body, "<div id='u30based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u30base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u30based = document.getElementById('u30based');
            
InsertBeforeEnd(u30based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 基本信息管理子菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div>");

var u77 = document.getElementById('u77');
gv_vAlignTable['u77'] = 'center';
var u152 = document.getElementById('u152');
gv_vAlignTable['u152'] = 'top';
var u61 = document.getElementById('u61');
gv_vAlignTable['u61'] = 'center';
var u168 = document.getElementById('u168');
gv_vAlignTable['u168'] = 'top';
var u7 = document.getElementById('u7');

var u13 = document.getElementById('u13');
gv_vAlignTable['u13'] = 'top';
var u95 = document.getElementById('u95');
gv_vAlignTable['u95'] = 'center';
var u125 = document.getElementById('u125');
gv_vAlignTable['u125'] = 'center';
var u96 = document.getElementById('u96');

var u137 = document.getElementById('u137');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u137ann'), "<div id='u137Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u137', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u137').replace(/\[\[label\]\]/g, "Chinese Name"));

InsertAfterBegin(document.body, "<div id='u137based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u137base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u137based = document.getElementById('u137based');
            
InsertBeforeEnd(u137based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 系统中文名<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");
gv_vAlignTable['u137'] = 'top';
var u44 = document.getElementById('u44');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u44ann'), "<div id='u44Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u44', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u44').replace(/\[\[label\]\]/g, "Unit Item"));

InsertAfterBegin(document.body, "<div id='u44based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u44base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u44based = document.getElementById('u44based');
            
InsertBeforeEnd(u44based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 计价单位管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u165 = document.getElementById('u165');
gv_vAlignTable['u165'] = 'top';
var u181 = document.getElementById('u181');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u181ann'), "<div id='u181Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u181', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u181').replace(/\[\[label\]\]/g, "User Info Panel"));

InsertAfterBegin(document.body, "<div id='u181based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u181base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u181based = document.getElementById('u181based');
            
InsertBeforeEnd(u181based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 个人信息展示面板，单击用户名可以打开用户详细信息面板，单击上面关闭按钮可以关闭信息框。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 重要的(Important)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u27 = document.getElementById('u27');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u27ann'), "<div id='u27Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u27', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u27').replace(/\[\[label\]\]/g, "System Manager Item"));

InsertAfterBegin(document.body, "<div id='u27based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u27base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u27based = document.getElementById('u27based');
            
InsertBeforeEnd(u27based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 系统管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div>");

u27.style.cursor = 'pointer';
if (bIE) u27.attachEvent("onclick", Clicku27);
else u27.addEventListener("click", Clicku27, true);
function Clicku27(e)
{

if (true) {

	SetPanelStateu29("pd4u29");

ApplyImageAndTextStyles('s', 'u27', 'u28', sJsonu28, false);
ApplyImageAndTextStyles('o', 'u25', 'u26', '', false);
ApplyImageAndTextStyles('o', 'u23', 'u24', '', false);
ApplyImageAndTextStyles('o', 'u21', 'u22', '', false);
ApplyImageAndTextStyles('o', 'u19', 'u20', '', false);
}

}

var u4 = document.getElementById('u4');

var u2 = document.getElementById('u2');

var u75 = document.getElementById('u75');
gv_vAlignTable['u75'] = 'center';
var u132 = document.getElementById('u132');

var u148 = document.getElementById('u148');
gv_vAlignTable['u148'] = 'top';
var u58 = document.getElementById('u58');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u58ann'), "<div id='u58Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u58', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u58').replace(/\[\[label\]\]/g, "Inventory Item"));

InsertAfterBegin(document.body, "<div id='u58based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u58base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u58based = document.getElementById('u58based');
            
InsertBeforeEnd(u58based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 盘点管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u140 = document.getElementById('u140');
gv_vAlignTable['u140'] = 'center';
var u183 = document.getElementById('u183');
gv_vAlignTable['u183'] = 'center';
var u42 = document.getElementById('u42');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u42ann'), "<div id='u42Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u42', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u42').replace(/\[\[label\]\]/g, "Materials Item"));

InsertAfterBegin(document.body, "<div id='u42based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u42base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u42based = document.getElementById('u42based');
            
InsertBeforeEnd(u42based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 物品管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u145 = document.getElementById('u145');
gv_vAlignTable['u145'] = 'center';
var u191 = document.getElementById('u191');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u191ann'), "<div id='u191Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u191', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u191').replace(/\[\[label\]\]/g, "User Dialog Close"));

InsertAfterBegin(document.body, "<div id='u191based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u191base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u191based = document.getElementById('u191based');
            
InsertBeforeEnd(u191based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 单击关闭个人信息对话框<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> Proposed<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> Useful<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> Low<BR><BR></div>");

u191.style.cursor = 'pointer';
if (bIE) u191.attachEvent("onclick", Clicku191);
else u191.addEventListener("click", Clicku191, true);
function Clicku191(e)
{

if (true) {

	SetPanelVisibilityu181("hidden");

}

}

var u103 = document.getElementById('u103');
gv_vAlignTable['u103'] = 'center';
var u25 = document.getElementById('u25');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u25ann'), "<div id='u25Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u25', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u25').replace(/\[\[label\]\]/g, "Report Item"));

InsertAfterBegin(document.body, "<div id='u25based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u25base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u25based = document.getElementById('u25based');
            
InsertBeforeEnd(u25based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 报表功能菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。但其子项由于其需求的不确定性可能会有所变化。<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div>");

u25.style.cursor = 'pointer';
if (bIE) u25.attachEvent("onclick", Clicku25);
else u25.addEventListener("click", Clicku25, true);
function Clicku25(e)
{

if (true) {

	SetPanelStateu29("pd3u29");

ApplyImageAndTextStyles('s', 'u25', 'u26', sJsonu26, false);
ApplyImageAndTextStyles('o', 'u27', 'u28', '', false);
ApplyImageAndTextStyles('o', 'u23', 'u24', '', false);
ApplyImageAndTextStyles('o', 'u21', 'u22', '', false);
ApplyImageAndTextStyles('o', 'u19', 'u20', '', false);
}

}

var u153 = document.getElementById('u153');
gv_vAlignTable['u153'] = 'top';
var u169 = document.getElementById('u169');
gv_vAlignTable['u169'] = 'top';
var u127 = document.getElementById('u127');
gv_vAlignTable['u127'] = 'center';
var u160 = document.getElementById('u160');

var u39 = document.getElementById('u39');
gv_vAlignTable['u39'] = 'center';
var u70 = document.getElementById('u70');

var u120 = document.getElementById('u120');

var u187 = document.getElementById('u187');
gv_vAlignTable['u187'] = 'center';
var u87 = document.getElementById('u87');
gv_vAlignTable['u87'] = 'center';
var u53 = document.getElementById('u53');

var u8 = document.getElementById('u8');
gv_vAlignTable['u8'] = 'center';
var u36 = document.getElementById('u36');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u36ann'), "<div id='u36Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u36', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u36').replace(/\[\[label\]\]/g, "Suppliers Item"));

InsertAfterBegin(document.body, "<div id='u36based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u36base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u36based = document.getElementById('u36based');
            
InsertBeforeEnd(u36based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 供应商基本信息管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u171 = document.getElementById('u171');
gv_vAlignTable['u171'] = 'top';
var u149 = document.getElementById('u149');
gv_vAlignTable['u149'] = 'top';
var u20 = document.getElementById('u20');
gv_vAlignTable['u20'] = 'center';
var u67 = document.getElementById('u67');
gv_vAlignTable['u67'] = 'center';
var u52 = document.getElementById('u52');

var u141 = document.getElementById('u141');

var u6 = document.getElementById('u6');
gv_vAlignTable['u6'] = 'top';
var u184 = document.getElementById('u184');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u184ann'), "<div id='u184Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u184', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u184').replace(/\[\[label\]\]/g, "User photo"));

InsertAfterBegin(document.body, "<div id='u184based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u184base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u184based = document.getElementById('u184based');
            
InsertBeforeEnd(u184based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 用户头像<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> Proposed<BR><BR></div>");

var u85 = document.getElementById('u85');
gv_vAlignTable['u85'] = 'center';
var u146 = document.getElementById('u146');
gv_vAlignTable['u146'] = 'top';
var u34 = document.getElementById('u34');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u34ann'), "<div id='u34Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u34', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u34').replace(/\[\[label\]\]/g, "Dpt Job Item"));

InsertAfterBegin(document.body, "<div id='u34based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u34base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u34based = document.getElementById('u34based');
            
InsertBeforeEnd(u34based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 部门及岗位管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u154 = document.getElementById('u154');
gv_vAlignTable['u154'] = 'top';
var u99 = document.getElementById('u99');
gv_vAlignTable['u99'] = 'center';
var u17 = document.getElementById('u17');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u17ann'), "<div id='u17Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u17', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u17').replace(/\[\[label\]\]/g, "Menu"));

InsertAfterBegin(document.body, "<div id='u17based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u17base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u17based = document.getElementById('u17based');
            
InsertBeforeEnd(u17based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 主目录面板。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div>");

var u1 = document.getElementById('u1');
gv_vAlignTable['u1'] = 'center';
var u65 = document.getElementById('u65');
gv_vAlignTable['u65'] = 'center';
var u48 = document.getElementById('u48');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u48ann'), "<div id='u48Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u48', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u48').replace(/\[\[label\]\]/g, "Person Item"));

InsertAfterBegin(document.body, "<div id='u48based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u48base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u48based = document.getElementById('u48based');
            
InsertBeforeEnd(u48based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 人员管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 有用的(Useful)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u121 = document.getElementById('u121');
gv_vAlignTable['u121'] = 'center';
var u167 = document.getElementById('u167');
gv_vAlignTable['u167'] = 'top';
var u79 = document.getElementById('u79');
gv_vAlignTable['u79'] = 'center';
var u188 = document.getElementById('u188');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u188ann'), "<div id='u188Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u188', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u188').replace(/\[\[label\]\]/g, "User Info"));

InsertAfterBegin(document.body, "<div id='u188based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u188base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u188based = document.getElementById('u188based');
            
InsertBeforeEnd(u188based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 用户个人简介<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> Proposed<BR><BR></div>");

var u32 = document.getElementById('u32');

var u80 = document.getElementById('u80');

var u134 = document.getElementById('u134');
gv_vAlignTable['u134'] = 'center';
var u51 = document.getElementById('u51');
gv_vAlignTable['u51'] = 'center';
var u143 = document.getElementById('u143');
gv_vAlignTable['u143'] = 'top';
var u76 = document.getElementById('u76');

var u155 = document.getElementById('u155');
gv_vAlignTable['u155'] = 'top';
var u158 = document.getElementById('u158');
gv_vAlignTable['u158'] = 'top';
var u101 = document.getElementById('u101');
gv_vAlignTable['u101'] = 'center';
var u147 = document.getElementById('u147');
gv_vAlignTable['u147'] = 'top';
var u60 = document.getElementById('u60');

var u117 = document.getElementById('u117');
gv_vAlignTable['u117'] = 'center';
var u150 = document.getElementById('u150');
gv_vAlignTable['u150'] = 'top';
var u43 = document.getElementById('u43');
gv_vAlignTable['u43'] = 'center';
var u114 = document.getElementById('u114');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u114ann'), "<div id='u114Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u114', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u114').replace(/\[\[label\]\]/g, "Operation Log Item"));

InsertAfterBegin(document.body, "<div id='u114based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u114base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u114based = document.getElementById('u114based');
            
InsertBeforeEnd(u114based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 操作记录菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 有用的(Useful)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u89 = document.getElementById('u89');
gv_vAlignTable['u89'] = 'center';
var u174 = document.getElementById('u174');
gv_vAlignTable['u174'] = 'top';
var u26 = document.getElementById('u26');
gv_vAlignTable['u26'] = 'center';
var u124 = document.getElementById('u124');

var u74 = document.getElementById('u74');

var u122 = document.getElementById('u122');

var u138 = document.getElementById('u138');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u138ann'), "<div id='u138Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u138', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u138').replace(/\[\[label\]\]/g, "English Name"));

InsertAfterBegin(document.body, "<div id='u138based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u138base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u138based = document.getElementById('u138based');
            
InsertBeforeEnd(u138based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 系统英文名<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 重要的(Important)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");
gv_vAlignTable['u138'] = 'top';
var u136 = document.getElementById('u136');
gv_vAlignTable['u136'] = 'center';
var u10 = document.getElementById('u10');
gv_vAlignTable['u10'] = 'top';
var u57 = document.getElementById('u57');
gv_vAlignTable['u57'] = 'center';
var u92 = document.getElementById('u92');

var u5 = document.getElementById('u5');
gv_vAlignTable['u5'] = 'center';
var u189 = document.getElementById('u189');
gv_vAlignTable['u189'] = 'center';
var u41 = document.getElementById('u41');
gv_vAlignTable['u41'] = 'center';
var u135 = document.getElementById('u135');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u135ann'), "<div id='u135Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u135', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u135').replace(/\[\[label\]\]/g, "Logo"));

InsertAfterBegin(document.body, "<div id='u135based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u135base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u135based = document.getElementById('u135based');
            
InsertBeforeEnd(u135based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 公司LOGO<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u24 = document.getElementById('u24');
gv_vAlignTable['u24'] = 'center';
var u72 = document.getElementById('u72');

var u102 = document.getElementById('u102');

var u118 = document.getElementById('u118');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u118ann'), "<div id='u118Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u118', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u118').replace(/\[\[label\]\]/g, "System Log Item"));

InsertAfterBegin(document.body, "<div id='u118based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u118base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u118based = document.getElementById('u118based');
            
InsertBeforeEnd(u118based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 系统日志菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 有用的(Useful)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u0 = document.getElementById('u0');

var u55 = document.getElementById('u55');
gv_vAlignTable['u55'] = 'center';
var u38 = document.getElementById('u38');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u38ann'), "<div id='u38Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u38', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u38').replace(/\[\[label\]\]/g, "Store Hourse Item"));

InsertAfterBegin(document.body, "<div id='u38based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u38base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u38based = document.getElementById('u38based');
            
InsertBeforeEnd(u38based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 库房管理菜单项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u83 = document.getElementById('u83');
gv_vAlignTable['u83'] = 'center';
var u110 = document.getElementById('u110');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u110ann'), "<div id='u110Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u110', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u110').replace(/\[\[label\]\]/g, "System Sub Item"));

InsertAfterBegin(document.body, "<div id='u110based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u110base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u110based = document.getElementById('u110based');
            
InsertBeforeEnd(u110based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 系统管理子菜单面板。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u86 = document.getElementById('u86');

var u115 = document.getElementById('u115');
gv_vAlignTable['u115'] = 'center';
var u69 = document.getElementById('u69');
gv_vAlignTable['u69'] = 'center';
var u22 = document.getElementById('u22');
gv_vAlignTable['u22'] = 'center';
var u123 = document.getElementById('u123');
gv_vAlignTable['u123'] = 'center';
var u139 = document.getElementById('u139');

u139.style.cursor = 'pointer';
if (bIE) u139.attachEvent("onclick", Clicku139);
else u139.addEventListener("click", Clicku139, true);
function Clicku139(e)
{

if (true) {

	var obj1 = document.getElementById("u141");
	if (obj1.style.visibility == "" || obj1.style.visibility == "visible") { SetPanelVisibilityu141("hidden"); }
	else {SetPanelVisibilityu141("");}

}

}

var u186 = document.getElementById('u186');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u186ann'), "<div id='u186Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u186', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u186').replace(/\[\[label\]\]/g, "User name"));

InsertAfterBegin(document.body, "<div id='u186based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u186base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u186based = document.getElementById('u186based');
            
InsertBeforeEnd(u186based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 显示用户姓名、职称等<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> Proposed<BR><BR></div>");

var u166 = document.getElementById('u166');
gv_vAlignTable['u166'] = 'top';
var u66 = document.getElementById('u66');

var u133 = document.getElementById('u133');

var u19 = document.getElementById('u19');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u19ann'), "<div id='u19Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u19', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u19').replace(/\[\[label\]\]/g, "Base Info Item"));

InsertAfterBegin(document.body, "<div id='u19based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u19base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u19based = document.getElementById('u19based');
            
InsertBeforeEnd(u19based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 基本信息菜单项，下有库房、货位等子项。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div>");

u19.style.cursor = 'pointer';
if (bIE) u19.attachEvent("onclick", Clicku19);
else u19.addEventListener("click", Clicku19, true);
function Clicku19(e)
{

if (true) {

	SetPanelStateu29("pd0u29");

ApplyImageAndTextStyles('s', 'u19', 'u20', sJsonu20, false);
ApplyImageAndTextStyles('o', 'u21', 'u22', '', false);
ApplyImageAndTextStyles('o', 'u23', 'u24', '', false);
ApplyImageAndTextStyles('o', 'u25', 'u26', '', false);
ApplyImageAndTextStyles('o', 'u27', 'u28', '', false);
}

}

var u50 = document.getElementById('u50');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u50ann'), "<div id='u50Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u50', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u50').replace(/\[\[label\]\]/g, "Store Manage Sub Menu"));

InsertAfterBegin(document.body, "<div id='u50based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u50base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u50based = document.getElementById('u50based');
            
InsertBeforeEnd(u50based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 库存管理二级菜单面板。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u157 = document.getElementById('u157');
gv_vAlignTable['u157'] = 'top';
var u15 = document.getElementById('u15');
gv_vAlignTable['u15'] = 'top';
var u33 = document.getElementById('u33');

var u107 = document.getElementById('u107');
gv_vAlignTable['u107'] = 'center';
var u98 = document.getElementById('u98');

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
var u64 = document.getElementById('u64');

var u164 = document.getElementById('u164');
gv_vAlignTable['u164'] = 'top';
var u111 = document.getElementById('u111');
gv_vAlignTable['u111'] = 'center';
var u192 = document.getElementById('u192');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u192ann'), "<div id='u192Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u192', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u192').replace(/\[\[label\]\]/g, "User Info Line"));

InsertAfterBegin(document.body, "<div id='u192based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u192base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u192based = document.getElementById('u192based');
            
InsertBeforeEnd(u192based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 个人信息框中的分隔线<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> Proposed<BR><BR></div>");

var u176 = document.getElementById('u176');
gv_vAlignTable['u176'] = 'top';
var u47 = document.getElementById('u47');
gv_vAlignTable['u47'] = 'center';
var u175 = document.getElementById('u175');
gv_vAlignTable['u175'] = 'top';
var u82 = document.getElementById('u82');

var u116 = document.getElementById('u116');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u116ann'), "<div id='u116Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u116', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u116').replace(/\[\[label\]\]/g, "Online User Item"));

InsertAfterBegin(document.body, "<div id='u116based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u116base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u116based = document.getElementById('u116based');
            
InsertBeforeEnd(u116based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 在线用户管理菜单。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 有用的(Useful)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u78 = document.getElementById('u78');

var u31 = document.getElementById('u31');
gv_vAlignTable['u31'] = 'center';
var u11 = document.getElementById('u11');

var u162 = document.getElementById('u162');

var u29 = document.getElementById('u29');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u29ann'), "<div id='u29Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u29', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u29').replace(/\[\[label\]\]/g, "Menu Panel"));

InsertAfterBegin(document.body, "<div id='u29based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u29base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u29based = document.getElementById('u29based');
            
InsertBeforeEnd(u29based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 二级目录面板。该区域用来显示不同的二级目录。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>稳定性(Stability):</span> 在定稿后一般不会改变。<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div>");

var u178 = document.getElementById('u178');
gv_vAlignTable['u178'] = 'top';
var u14 = document.getElementById('u14');
gv_vAlignTable['u14'] = 'top';
if (window.OnLoad) OnLoad();
