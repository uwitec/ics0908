
var PageName = 'login';
var PageId = 'p068e70fe7a5c468caaa28cc16a4e6e39'
var PageUrl = 'login.html'
document.title = 'login';

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

}

eval(GetDynamicPanelScript('u26', 1));

eval(GetDynamicPanelScript('u8', 2));

var u16 = document.getElementById('u16');

var u7 = document.getElementById('u7');

var u28 = document.getElementById('u28');
gv_vAlignTable['u28'] = 'center';
var u30 = document.getElementById('u30');
gv_vAlignTable['u30'] = 'center';
var u15 = document.getElementById('u15');

var u2 = document.getElementById('u2');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u2ann'), "<div id='u2Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u2', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u2').replace(/\[\[label\]\]/g, "CopyRight Logo Name"));

InsertAfterBegin(document.body, "<div id='u2based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u2base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u2based = document.getElementById('u2based');
            
InsertBeforeEnd(u2based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 脚注，版权公司名称和标志<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 有用的(Useful)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");
gv_vAlignTable['u2'] = 'top';
var u19 = document.getElementById('u19');
gv_vAlignTable['u19'] = 'top';
var u13 = document.getElementById('u13');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u13ann'), "<div id='u13Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u13', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u13').replace(/\[\[label\]\]/g, "User Login Button"));

InsertAfterBegin(document.body, "<div id='u13based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u13base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u13based = document.getElementById('u13based');
            
InsertBeforeEnd(u13based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 登录按钮，当用户名为：demo，密码为：demo时点击登录按钮系统进入用户首页，否则在登录框下文会出现错误信息。<BR><BR></div>");

u13.style.cursor = 'pointer';
if (bIE) u13.attachEvent("onclick", Clicku13);
else u13.addEventListener("click", Clicku13, true);
function Clicku13(e)
{

if (((GetWidgetFormText('u15')) == (PopulateVariables('demo'))) && ((GetWidgetFormText('u16')) == (PopulateVariables('demo')))) {

	self.location.href="userhome.html" + GetQuerystring();

}
else
if (true) {

	SetPanelVisibilityu26("");

}

}

var u31 = document.getElementById('u31');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u31ann'), "<div id='u31Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u31', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u31').replace(/\[\[label\]\]/g, "Chinese Name"));

InsertAfterBegin(document.body, "<div id='u31based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u31base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u31based = document.getElementById('u31based');
            
InsertBeforeEnd(u31based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 系统中文名<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");
gv_vAlignTable['u31'] = 'top';
var u22 = document.getElementById('u22');

var u12 = document.getElementById('u12');
gv_vAlignTable['u12'] = 'top';
var u5 = document.getElementById('u5');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u5ann'), "<div id='u5Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u5', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u5').replace(/\[\[label\]\]/g, "User Login Tab"));

InsertAfterBegin(document.body, "<div id='u5based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u5base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u5based = document.getElementById('u5based');
            
InsertBeforeEnd(u5based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 用户登录标签页，用户单击该标签系统打开普通用户的登录页面，单击管理员标签则打开管理员登录页面。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

u5.style.cursor = 'pointer';
if (bIE) u5.attachEvent("onclick", Clicku5);
else u5.addEventListener("click", Clicku5, true);
function Clicku5(e)
{

if (true) {

	SetPanelStateu8("pd0u8");

}

}

var u8 = document.getElementById('u8');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u8ann'), "<div id='u8Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u8', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u8').replace(/\[\[label\]\]/g, "Login Panel"));

InsertAfterBegin(document.body, "<div id='u8based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u8base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u8based = document.getElementById('u8based');
            
InsertBeforeEnd(u8based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 登录面板，用来切换普通用户登录和管理员登录界面。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u10 = document.getElementById('u10');
gv_vAlignTable['u10'] = 'center';
var u32 = document.getElementById('u32');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u32ann'), "<div id='u32Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u32', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u32').replace(/\[\[label\]\]/g, "English Name"));

InsertAfterBegin(document.body, "<div id='u32based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u32base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u32based = document.getElementById('u32based');
            
InsertBeforeEnd(u32based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 系统英文名<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 重要的(Important)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");
gv_vAlignTable['u32'] = 'top';
var u0 = document.getElementById('u0');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u0ann'), "<div id='u0Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u0', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u0').replace(/\[\[label\]\]/g, "Page Background"));

InsertAfterBegin(document.body, "<div id='u0based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u0base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u0based = document.getElementById('u0based');
            
InsertBeforeEnd(u0based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 登录页面背景图片<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 有用的(Useful)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u26 = document.getElementById('u26');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u26ann'), "<div id='u26Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u26', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u26').replace(/\[\[label\]\]/g, "Login Error Panel"));

InsertAfterBegin(document.body, "<div id='u26based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u26base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u26based = document.getElementById('u26based');
            
InsertBeforeEnd(u26based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 错误信息提示面板<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 重要的(Important)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u25 = document.getElementById('u25');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u25ann'), "<div id='u25Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u25', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u25').replace(/\[\[label\]\]/g, "Introduce Text"));

InsertAfterBegin(document.body, "<div id='u25based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u25base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u25based = document.getElementById('u25based');
            
InsertBeforeEnd(u25based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 软件简介<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 有用的(Useful)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");
gv_vAlignTable['u25'] = 'top';
var u21 = document.getElementById('u21');

var u17 = document.getElementById('u17');

var u3 = document.getElementById('u3');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u3ann'), "<div id='u3Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u3', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u3').replace(/\[\[label\]\]/g, "Manager Login Tab"));

InsertAfterBegin(document.body, "<div id='u3based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u3base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u3based = document.getElementById('u3based');
            
InsertBeforeEnd(u3based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 管理员登录标签，用户点击此标签可打开管理员登录页面。<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

u3.style.cursor = 'pointer';
if (bIE) u3.attachEvent("onclick", Clicku3);
else u3.addEventListener("click", Clicku3, true);
function Clicku3(e)
{

if (true) {

	SetPanelStateu8("pd1u8");

}

}

var u29 = document.getElementById('u29');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u29ann'), "<div id='u29Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u29', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u29').replace(/\[\[label\]\]/g, "Logo"));

InsertAfterBegin(document.body, "<div id='u29based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u29base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u29based = document.getElementById('u29based');
            
InsertBeforeEnd(u29based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 公司LOGO<BR><BR></div><div class='anncontent'><span class='annfieldname'>设计状态(State):</span> 建议的(Proposed)<BR><BR></div><div class='anncontent'><span class='annfieldname'>重要度(Benefit):</span> 必要的(Critical)<BR><BR></div><div class='anncontent'><span class='annfieldname'>风险(Risk):</span> 低(Low)<BR><BR></div><div class='anncontent'><span class='annfieldname'>目标版本(Target Release):</span> 0.1<BR><BR></div><div class='anncontent'><span class='annfieldname'>分配给(Assigned To):</span> Zhong Lizhi<BR><BR></div>");

var u23 = document.getElementById('u23');

var u14 = document.getElementById('u14');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u14ann'), "<div id='u14Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u14', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u14').replace(/\[\[label\]\]/g, "User Reset Button"));

InsertAfterBegin(document.body, "<div id='u14based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u14base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u14based = document.getElementById('u14based');
            
InsertBeforeEnd(u14based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 清空输入框中的内容<BR><BR></div>");

u14.style.cursor = 'pointer';
if (bIE) u14.attachEvent("onclick", Clicku14);
else u14.addEventListener("click", Clicku14, true);
function Clicku14(e)
{

if (true) {

SetWidgetFormText('u15', PopulateVariables(''));

SetWidgetFormText('u16', PopulateVariables(''));

	SetPanelVisibilityu26("hidden");

}

}

var u6 = document.getElementById('u6');
gv_vAlignTable['u6'] = 'center';
var u9 = document.getElementById('u9');

var u20 = document.getElementById('u20');
gv_vAlignTable['u20'] = 'top';
var u1 = document.getElementById('u1');
gv_vAlignTable['u1'] = 'top';
var u11 = document.getElementById('u11');
gv_vAlignTable['u11'] = 'top';
var u18 = document.getElementById('u18');
gv_vAlignTable['u18'] = 'center';
var u24 = document.getElementById('u24');

var u4 = document.getElementById('u4');
gv_vAlignTable['u4'] = 'center';
var u27 = document.getElementById('u27');

x = 0;
y = 0;
InsertAfterBegin(document.getElementById('u27ann'), "<div id='u27Note' class='annnoteimage' style='left:" + x + ";top:" + y + "' onclick=\"ToggleWorkflow(event, 'u27', 300, 300, false)\"></div>");

eval(annwindow.replace(/\[\[id\]\]/g, 'u27').replace(/\[\[label\]\]/g, "Login Error Div"));

InsertAfterBegin(document.body, "<div id='u27based' style='z-index:1; visibility:hidden; position:absolute'></div><div id='u27base' style='z-index:1; visibility:hidden; position:absolute'></div>");
var u27based = document.getElementById('u27based');
            
InsertBeforeEnd(u27based, "<div class='anncontent'><span class='annfieldname'>详细说明(specification):</span> 错误信息显示区<BR><BR></div>");

if (window.OnLoad) OnLoad();
