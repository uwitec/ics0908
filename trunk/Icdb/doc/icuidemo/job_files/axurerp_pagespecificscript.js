
var PageName = 'job';
var PageId = 'p4d9568d625564f6cae65c16cd5503fc2'
var PageUrl = 'job.html'
document.title = 'job';

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

eval(GetDynamicPanelScript('u2', 1));

eval(GetDynamicPanelScript('u99', 2));

var u62 = document.getElementById('u62');
gv_vAlignTable['u62'] = 'top';
var u195 = document.getElementById('u195');
gv_vAlignTable['u195'] = 'top';
var u45 = document.getElementById('u45');

var u28 = document.getElementById('u28');

var u142 = document.getElementById('u142');

var u180 = document.getElementById('u180');

var u54 = document.getElementById('u54');

var u59 = document.getElementById('u59');

var u71 = document.getElementById('u71');

var u104 = document.getElementById('u104');

var u93 = document.getElementById('u93');
gv_vAlignTable['u93'] = 'top';
var u12 = document.getElementById('u12');

var u73 = document.getElementById('u73');

var u112 = document.getElementById('u112');

var u128 = document.getElementById('u128');

var u193 = document.getElementById('u193');
gv_vAlignTable['u193'] = 'top';
var u56 = document.getElementById('u56');
gv_vAlignTable['u56'] = 'top';
var u161 = document.getElementById('u161');
gv_vAlignTable['u161'] = 'top';
var u91 = document.getElementById('u91');
gv_vAlignTable['u91'] = 'center';
var u206 = document.getElementById('u206');

var u173 = document.getElementById('u173');
gv_vAlignTable['u173'] = 'top';
var u90 = document.getElementById('u90');

var u40 = document.getElementById('u40');
gv_vAlignTable['u40'] = 'top';
var u163 = document.getElementById('u163');
gv_vAlignTable['u163'] = 'top';
var u179 = document.getElementById('u179');
gv_vAlignTable['u179'] = 'top';
var u23 = document.getElementById('u23');

var u147 = document.getElementById('u147');
gv_vAlignTable['u147'] = 'top';
var u88 = document.getElementById('u88');
gv_vAlignTable['u88'] = 'top';
var u130 = document.getElementById('u130');

var u108 = document.getElementById('u108');

var u176 = document.getElementById('u176');

var u100 = document.getElementById('u100');
gv_vAlignTable['u100'] = 'top';
var u181 = document.getElementById('u181');
gv_vAlignTable['u181'] = 'top';
var u37 = document.getElementById('u37');

var u3 = document.getElementById('u3');

var u105 = document.getElementById('u105');
gv_vAlignTable['u105'] = 'center';
var u68 = document.getElementById('u68');
gv_vAlignTable['u68'] = 'top';
var u159 = document.getElementById('u159');
gv_vAlignTable['u159'] = 'top';
var u21 = document.getElementById('u21');

var u113 = document.getElementById('u113');
gv_vAlignTable['u113'] = 'top';
var u129 = document.getElementById('u129');
gv_vAlignTable['u129'] = 'top';
var u194 = document.getElementById('u194');

var u156 = document.getElementById('u156');

var u207 = document.getElementById('u207');

if (bIE) u207.attachEvent("onchange", Changeu207);
else u207.addEventListener("change", Changeu207, true);
function Changeu207(e)
{

if (true) {

	SetPanelStateu99("pd1u99");

}

}

var u35 = document.getElementById('u35');

var u18 = document.getElementById('u18');
gv_vAlignTable['u18'] = 'center';
var u126 = document.getElementById('u126');

var u170 = document.getElementById('u170');

var u185 = document.getElementById('u185');
gv_vAlignTable['u185'] = 'top';
var u197 = document.getElementById('u197');
gv_vAlignTable['u197'] = 'top';
var u49 = document.getElementById('u49');

var u131 = document.getElementById('u131');
gv_vAlignTable['u131'] = 'top';
var u53 = document.getElementById('u53');

var u97 = document.getElementById('u97');
gv_vAlignTable['u97'] = 'top';
var u63 = document.getElementById('u63');

var u84 = document.getElementById('u84');
gv_vAlignTable['u84'] = 'top';
var u106 = document.getElementById('u106');

var u9 = document.getElementById('u9');

u9.style.cursor = 'pointer';
if (bIE) u9.attachEvent("onclick", Clicku9);
else u9.addEventListener("click", Clicku9, true);
function Clicku9(e)
{

if (true) {

	SetPanelVisibilityu2("hidden");

}

}

var u182 = document.getElementById('u182');

var u46 = document.getElementById('u46');
gv_vAlignTable['u46'] = 'center';
var u198 = document.getElementById('u198');

var u81 = document.getElementById('u81');

var u144 = document.getElementById('u144');

var u190 = document.getElementById('u190');

var u151 = document.getElementById('u151');
gv_vAlignTable['u151'] = 'top';
var u30 = document.getElementById('u30');
gv_vAlignTable['u30'] = 'top';
var u77 = document.getElementById('u77');

var u152 = document.getElementById('u152');

var u61 = document.getElementById('u61');

var u168 = document.getElementById('u168');

var u7 = document.getElementById('u7');
gv_vAlignTable['u7'] = 'top';
var u13 = document.getElementById('u13');

var u95 = document.getElementById('u95');

u95.style.cursor = 'pointer';
if (bIE) u95.attachEvent("onclick", Clicku95);
else u95.addEventListener("click", Clicku95, true);
function Clicku95(e)
{

if (true) {

	self.location.href="dpt.html" + GetQuerystring();

}

}
gv_vAlignTable['u95'] = 'top';
var u125 = document.getElementById('u125');
gv_vAlignTable['u125'] = 'top';
var u96 = document.getElementById('u96');

u96.style.cursor = 'pointer';
if (bIE) u96.attachEvent("onclick", Clicku96);
else u96.addEventListener("click", Clicku96, true);
function Clicku96(e)
{

if (true) {

	self.location.href="Resources/reload.html#" + encodeURI(PageUrl + GetQuerystring());

}

}
gv_vAlignTable['u96'] = 'top';
var u137 = document.getElementById('u137');
gv_vAlignTable['u137'] = 'top';
var u44 = document.getElementById('u44');
gv_vAlignTable['u44'] = 'center';
var u165 = document.getElementById('u165');
gv_vAlignTable['u165'] = 'top';
var u109 = document.getElementById('u109');
gv_vAlignTable['u109'] = 'center';
var u27 = document.getElementById('u27');

var u4 = document.getElementById('u4');
gv_vAlignTable['u4'] = 'center';
var u2 = document.getElementById('u2');

var u75 = document.getElementById('u75');

var u132 = document.getElementById('u132');

var u58 = document.getElementById('u58');
gv_vAlignTable['u58'] = 'top';
var u11 = document.getElementById('u11');

var u205 = document.getElementById('u205');
gv_vAlignTable['u205'] = 'top';
var u140 = document.getElementById('u140');

var u183 = document.getElementById('u183');
gv_vAlignTable['u183'] = 'top';
var u199 = document.getElementById('u199');
gv_vAlignTable['u199'] = 'top';
var u42 = document.getElementById('u42');

var u145 = document.getElementById('u145');
gv_vAlignTable['u145'] = 'top';
var u191 = document.getElementById('u191');
gv_vAlignTable['u191'] = 'top';
var u103 = document.getElementById('u103');
gv_vAlignTable['u103'] = 'center';
var u25 = document.getElementById('u25');

u25.style.cursor = 'pointer';
if (bIE) u25.attachEvent("onclick", Clicku25);
else u25.addEventListener("click", Clicku25, true);
function Clicku25(e)
{

if (true) {

	SetPanelStateu2("pd0u2");

}

}

var u153 = document.getElementById('u153');
gv_vAlignTable['u153'] = 'top';
var u169 = document.getElementById('u169');
gv_vAlignTable['u169'] = 'top';
var u196 = document.getElementById('u196');

var u201 = document.getElementById('u201');
gv_vAlignTable['u201'] = 'center';
var u127 = document.getElementById('u127');
gv_vAlignTable['u127'] = 'top';
var u160 = document.getElementById('u160');

var u39 = document.getElementById('u39');

var u70 = document.getElementById('u70');

var u120 = document.getElementById('u120');

var u187 = document.getElementById('u187');
gv_vAlignTable['u187'] = 'top';
var u87 = document.getElementById('u87');

var u166 = document.getElementById('u166');

var u8 = document.getElementById('u8');
gv_vAlignTable['u8'] = 'top';
var u36 = document.getElementById('u36');
gv_vAlignTable['u36'] = 'top';
var u171 = document.getElementById('u171');
gv_vAlignTable['u171'] = 'top';
var u149 = document.getElementById('u149');
gv_vAlignTable['u149'] = 'top';
var u20 = document.getElementById('u20');
gv_vAlignTable['u20'] = 'center';
var u67 = document.getElementById('u67');

var u52 = document.getElementById('u52');
gv_vAlignTable['u52'] = 'center';
var u141 = document.getElementById('u141');
gv_vAlignTable['u141'] = 'top';
var u6 = document.getElementById('u6');
gv_vAlignTable['u6'] = 'top';
var u184 = document.getElementById('u184');

var u85 = document.getElementById('u85');

var u146 = document.getElementById('u146');

var u34 = document.getElementById('u34');
gv_vAlignTable['u34'] = 'top';
var u154 = document.getElementById('u154');

var u99 = document.getElementById('u99');

var u202 = document.getElementById('u202');

var u17 = document.getElementById('u17');

var u1 = document.getElementById('u1');
gv_vAlignTable['u1'] = 'top';
var u65 = document.getElementById('u65');

var u48 = document.getElementById('u48');
gv_vAlignTable['u48'] = 'center';
var u121 = document.getElementById('u121');
gv_vAlignTable['u121'] = 'top';
var u167 = document.getElementById('u167');
gv_vAlignTable['u167'] = 'top';
var u203 = document.getElementById('u203');

u203.style.cursor = 'pointer';
if (bIE) u203.attachEvent("onclick", Clicku203);
else u203.addEventListener("click", Clicku203, true);
function Clicku203(e)
{

if (true) {

	NewWindow("addjob.html" + GetQuerystring(), "", "directories=0, height=500, location=0, menubar=0, resizable=0, scrollbars=0, status=0, toolbar=0, width=500", true, 500, 500);

}

}

var u79 = document.getElementById('u79');

var u188 = document.getElementById('u188');

var u32 = document.getElementById('u32');
gv_vAlignTable['u32'] = 'top';
var u80 = document.getElementById('u80');
gv_vAlignTable['u80'] = 'top';
var u134 = document.getElementById('u134');

var u175 = document.getElementById('u175');
gv_vAlignTable['u175'] = 'top';
var u143 = document.getElementById('u143');
gv_vAlignTable['u143'] = 'top';
var u76 = document.getElementById('u76');
gv_vAlignTable['u76'] = 'top';
var u155 = document.getElementById('u155');
gv_vAlignTable['u155'] = 'top';
var u158 = document.getElementById('u158');

var u101 = document.getElementById('u101');

var u204 = document.getElementById('u204');

u204.style.cursor = 'pointer';
if (bIE) u204.attachEvent("onclick", Clicku204);
else u204.addEventListener("click", Clicku204, true);
function Clicku204(e)
{

if (true) {

	NewWindow("modifyjob.html" + GetQuerystring(), "", "directories=0, height=500, location=0, menubar=0, resizable=0, scrollbars=0, status=0, toolbar=0, width=500", true, 500, 500);

}

}
gv_vAlignTable['u204'] = 'top';
var u94 = document.getElementById('u94');

u94.style.cursor = 'pointer';
if (bIE) u94.attachEvent("onclick", Clicku94);
else u94.addEventListener("click", Clicku94, true);
function Clicku94(e)
{

if (true) {

	self.location.href="struct.html" + GetQuerystring();

}

}
gv_vAlignTable['u94'] = 'top';
var u60 = document.getElementById('u60');

var u117 = document.getElementById('u117');
gv_vAlignTable['u117'] = 'top';
var u51 = document.getElementById('u51');

var u150 = document.getElementById('u150');

var u43 = document.getElementById('u43');

u43.style.cursor = 'pointer';
if (bIE) u43.attachEvent("onclick", Clicku43);
else u43.addEventListener("click", Clicku43, true);
function Clicku43(e)
{

if (true) {

	self.location.href="orgstructure.html" + GetQuerystring();

}

}

var u114 = document.getElementById('u114');

var u89 = document.getElementById('u89');
gv_vAlignTable['u89'] = 'top';
var u174 = document.getElementById('u174');

var u26 = document.getElementById('u26');
gv_vAlignTable['u26'] = 'center';
var u124 = document.getElementById('u124');

var u74 = document.getElementById('u74');
gv_vAlignTable['u74'] = 'top';
var u122 = document.getElementById('u122');

var u138 = document.getElementById('u138');

var u10 = document.getElementById('u10');
gv_vAlignTable['u10'] = 'center';
var u57 = document.getElementById('u57');

var u92 = document.getElementById('u92');

var u5 = document.getElementById('u5');
gv_vAlignTable['u5'] = 'top';
var u189 = document.getElementById('u189');
gv_vAlignTable['u189'] = 'top';
var u41 = document.getElementById('u41');

var u135 = document.getElementById('u135');
gv_vAlignTable['u135'] = 'top';
var u24 = document.getElementById('u24');
gv_vAlignTable['u24'] = 'center';
var u72 = document.getElementById('u72');
gv_vAlignTable['u72'] = 'top';
var u186 = document.getElementById('u186');

var u118 = document.getElementById('u118');

var u0 = document.getElementById('u0');

var u55 = document.getElementById('u55');

var u38 = document.getElementById('u38');
gv_vAlignTable['u38'] = 'top';
var u83 = document.getElementById('u83');

var u110 = document.getElementById('u110');

var u102 = document.getElementById('u102');

var u50 = document.getElementById('u50');
gv_vAlignTable['u50'] = 'center';
var u86 = document.getElementById('u86');
gv_vAlignTable['u86'] = 'top';
var u115 = document.getElementById('u115');
gv_vAlignTable['u115'] = 'top';
var u69 = document.getElementById('u69');

var u22 = document.getElementById('u22');
gv_vAlignTable['u22'] = 'center';
var u123 = document.getElementById('u123');
gv_vAlignTable['u123'] = 'top';
var u139 = document.getElementById('u139');
gv_vAlignTable['u139'] = 'top';
var u177 = document.getElementById('u177');
gv_vAlignTable['u177'] = 'top';
var u66 = document.getElementById('u66');
gv_vAlignTable['u66'] = 'top';
var u133 = document.getElementById('u133');
gv_vAlignTable['u133'] = 'top';
var u19 = document.getElementById('u19');

var u136 = document.getElementById('u136');

var u157 = document.getElementById('u157');
gv_vAlignTable['u157'] = 'top';
var u15 = document.getElementById('u15');

var u33 = document.getElementById('u33');

var u107 = document.getElementById('u107');
gv_vAlignTable['u107'] = 'center';
var u98 = document.getElementById('u98');

if (bIE) u98.attachEvent("onchange", Changeu98);
else u98.addEventListener("change", Changeu98, true);
function Changeu98(e)
{

if (true) {

	SetPanelStateu99("pd1u99");

}

}

var u16 = document.getElementById('u16');
gv_vAlignTable['u16'] = 'center';
var u119 = document.getElementById('u119');
gv_vAlignTable['u119'] = 'top';
var u64 = document.getElementById('u64');
gv_vAlignTable['u64'] = 'top';
var u164 = document.getElementById('u164');

var u111 = document.getElementById('u111');
gv_vAlignTable['u111'] = 'center';
var u200 = document.getElementById('u200');

var u192 = document.getElementById('u192');

var u47 = document.getElementById('u47');

var u82 = document.getElementById('u82');
gv_vAlignTable['u82'] = 'top';
var u116 = document.getElementById('u116');

u116.style.cursor = 'pointer';
if (bIE) u116.attachEvent("onclick", Clicku116);
else u116.addEventListener("click", Clicku116, true);
function Clicku116(e)
{

if (true) {

	NewWindow("viewjob.html" + GetQuerystring(), "", "directories=0, height=500, location=0, menubar=0, resizable=0, scrollbars=0, status=0, toolbar=0, width=500, left=100, top=100", false, 500, 500);

}

}

var u148 = document.getElementById('u148');

var u78 = document.getElementById('u78');

var u172 = document.getElementById('u172');

var u31 = document.getElementById('u31');

var u162 = document.getElementById('u162');

var u29 = document.getElementById('u29');

var u178 = document.getElementById('u178');

var u14 = document.getElementById('u14');
gv_vAlignTable['u14'] = 'center';
if (window.OnLoad) OnLoad();
