
var PageName = 'dpt';
var PageId = 'pd7dc00600f6b4cd4bc295a6dac8a01c1'
var PageUrl = 'dpt.html'
document.title = 'dpt';

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

eval(GetDynamicPanelScript('u92', 2));

var u62 = document.getElementById('u62');
gv_vAlignTable['u62'] = 'top';
var u195 = document.getElementById('u195');

var u45 = document.getElementById('u45');

var u28 = document.getElementById('u28');

var u142 = document.getElementById('u142');
gv_vAlignTable['u142'] = 'top';
var u180 = document.getElementById('u180');
gv_vAlignTable['u180'] = 'top';
var u54 = document.getElementById('u54');

var u59 = document.getElementById('u59');

var u71 = document.getElementById('u71');

var u104 = document.getElementById('u104');
gv_vAlignTable['u104'] = 'center';
var u93 = document.getElementById('u93');
gv_vAlignTable['u93'] = 'top';
var u12 = document.getElementById('u12');

var u73 = document.getElementById('u73');

var u112 = document.getElementById('u112');
gv_vAlignTable['u112'] = 'top';
var u128 = document.getElementById('u128');
gv_vAlignTable['u128'] = 'top';
var u193 = document.getElementById('u193');

var u56 = document.getElementById('u56');
gv_vAlignTable['u56'] = 'top';
var u91 = document.getElementById('u91');

if (bIE) u91.attachEvent("onchange", Changeu91);
else u91.addEventListener("change", Changeu91, true);
function Changeu91(e)
{

if (true) {

	SetPanelStateu92("pd1u92");

}

}

var u206 = document.getElementById('u206');
gv_vAlignTable['u206'] = 'top';
var u173 = document.getElementById('u173');

var u90 = document.getElementById('u90');
gv_vAlignTable['u90'] = 'top';
var u40 = document.getElementById('u40');
gv_vAlignTable['u40'] = 'top';
var u163 = document.getElementById('u163');

var u179 = document.getElementById('u179');

var u23 = document.getElementById('u23');

var u147 = document.getElementById('u147');

var u132 = document.getElementById('u132');
gv_vAlignTable['u132'] = 'top';
var u88 = document.getElementById('u88');
gv_vAlignTable['u88'] = 'top';
var u130 = document.getElementById('u130');
gv_vAlignTable['u130'] = 'top';
var u108 = document.getElementById('u108');
gv_vAlignTable['u108'] = 'top';
var u176 = document.getElementById('u176');
gv_vAlignTable['u176'] = 'top';
var u100 = document.getElementById('u100');
gv_vAlignTable['u100'] = 'center';
var u181 = document.getElementById('u181');

var u37 = document.getElementById('u37');

var u209 = document.getElementById('u209');
gv_vAlignTable['u209'] = 'top';
var u3 = document.getElementById('u3');

var u105 = document.getElementById('u105');

var u68 = document.getElementById('u68');
gv_vAlignTable['u68'] = 'top';
var u159 = document.getElementById('u159');

var u21 = document.getElementById('u21');

var u113 = document.getElementById('u113');

var u129 = document.getElementById('u129');

var u194 = document.getElementById('u194');
gv_vAlignTable['u194'] = 'center';
var u156 = document.getElementById('u156');
gv_vAlignTable['u156'] = 'top';
var u207 = document.getElementById('u207');
gv_vAlignTable['u207'] = 'top';
var u35 = document.getElementById('u35');

var u18 = document.getElementById('u18');
gv_vAlignTable['u18'] = 'center';
var u126 = document.getElementById('u126');
gv_vAlignTable['u126'] = 'top';
var u185 = document.getElementById('u185');

var u197 = document.getElementById('u197');

u197.style.cursor = 'pointer';
if (bIE) u197.attachEvent("onclick", Clicku197);
else u197.addEventListener("click", Clicku197, true);
function Clicku197(e)
{

if (true) {

	NewWindow("modifydpt.html" + GetQuerystring(), "", "directories=0, height=500, location=0, menubar=0, resizable=0, scrollbars=0, status=0, toolbar=0, width=500", true, 500, 500);

}

}
gv_vAlignTable['u197'] = 'top';
var u49 = document.getElementById('u49');

var u131 = document.getElementById('u131');

var u220 = document.getElementById('u220');

var u53 = document.getElementById('u53');

var u144 = document.getElementById('u144');
gv_vAlignTable['u144'] = 'top';
var u177 = document.getElementById('u177');

var u63 = document.getElementById('u63');

var u84 = document.getElementById('u84');
gv_vAlignTable['u84'] = 'top';
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
gv_vAlignTable['u182'] = 'top';
var u46 = document.getElementById('u46');
gv_vAlignTable['u46'] = 'center';
var u198 = document.getElementById('u198');

u198.style.cursor = 'pointer';
if (bIE) u198.attachEvent("onclick", Clicku198);
else u198.addEventListener("click", Clicku198, true);
function Clicku198(e)
{

if (true) {

	NewWindow("addjob.html" + GetQuerystring(), "", "directories=0, height=500, location=0, menubar=0, resizable=0, scrollbars=0, status=0, toolbar=0, width=500", true, 500, 500);

}

}
gv_vAlignTable['u198'] = 'top';
var u81 = document.getElementById('u81');

var u106 = document.getElementById('u106');
gv_vAlignTable['u106'] = 'top';
var u190 = document.getElementById('u190');
gv_vAlignTable['u190'] = 'top';
var u151 = document.getElementById('u151');

var u30 = document.getElementById('u30');
gv_vAlignTable['u30'] = 'top';
var u77 = document.getElementById('u77');

var u152 = document.getElementById('u152');
gv_vAlignTable['u152'] = 'top';
var u61 = document.getElementById('u61');

var u168 = document.getElementById('u168');
gv_vAlignTable['u168'] = 'top';
var u7 = document.getElementById('u7');
gv_vAlignTable['u7'] = 'top';
var u13 = document.getElementById('u13');

var u95 = document.getElementById('u95');

var u125 = document.getElementById('u125');

var u137 = document.getElementById('u137');

var u123 = document.getElementById('u123');

var u44 = document.getElementById('u44');
gv_vAlignTable['u44'] = 'center';
var u165 = document.getElementById('u165');

var u109 = document.getElementById('u109');

u109.style.cursor = 'pointer';
if (bIE) u109.attachEvent("onclick", Clicku109);
else u109.addEventListener("click", Clicku109, true);
function Clicku109(e)
{

if (true) {

	NewWindow("viewdpt.html" + GetQuerystring(), "", "directories=0, height=500, location=0, menubar=0, resizable=0, scrollbars=0, status=0, toolbar=0, width=500, left=100, top=100", false, 500, 500);

}

}

var u27 = document.getElementById('u27');

var u4 = document.getElementById('u4');
gv_vAlignTable['u4'] = 'center';
var u2 = document.getElementById('u2');

var u75 = document.getElementById('u75');

var u170 = document.getElementById('u170');
gv_vAlignTable['u170'] = 'top';
var u148 = document.getElementById('u148');
gv_vAlignTable['u148'] = 'top';
var u58 = document.getElementById('u58');
gv_vAlignTable['u58'] = 'top';
var u140 = document.getElementById('u140');
gv_vAlignTable['u140'] = 'top';
var u183 = document.getElementById('u183');

var u199 = document.getElementById('u199');
gv_vAlignTable['u199'] = 'top';
var u42 = document.getElementById('u42');

var u145 = document.getElementById('u145');

var u191 = document.getElementById('u191');

var u103 = document.getElementById('u103');

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

var u169 = document.getElementById('u169');

var u196 = document.getElementById('u196');

u196.style.cursor = 'pointer';
if (bIE) u196.attachEvent("onclick", Clicku196);
else u196.addEventListener("click", Clicku196, true);
function Clicku196(e)
{

if (true) {

	NewWindow("adddpt.html" + GetQuerystring(), "", "directories=0, height=500, location=0, menubar=0, resizable=0, scrollbars=0, status=0, toolbar=0, width=500", true, 500, 500);

}

}

var u201 = document.getElementById('u201');
gv_vAlignTable['u201'] = 'top';
var u127 = document.getElementById('u127');

var u160 = document.getElementById('u160');
gv_vAlignTable['u160'] = 'top';
var u39 = document.getElementById('u39');

var u70 = document.getElementById('u70');

var u120 = document.getElementById('u120');
gv_vAlignTable['u120'] = 'top';
var u187 = document.getElementById('u187');

var u87 = document.getElementById('u87');

var u166 = document.getElementById('u166');
gv_vAlignTable['u166'] = 'top';
var u8 = document.getElementById('u8');
gv_vAlignTable['u8'] = 'top';
var u134 = document.getElementById('u134');
gv_vAlignTable['u134'] = 'top';
var u36 = document.getElementById('u36');
gv_vAlignTable['u36'] = 'top';
var u171 = document.getElementById('u171');

var u149 = document.getElementById('u149');

var u20 = document.getElementById('u20');
gv_vAlignTable['u20'] = 'center';
var u67 = document.getElementById('u67');

var u52 = document.getElementById('u52');
gv_vAlignTable['u52'] = 'center';
var u141 = document.getElementById('u141');

var u6 = document.getElementById('u6');
gv_vAlignTable['u6'] = 'top';
var u184 = document.getElementById('u184');
gv_vAlignTable['u184'] = 'top';
var u85 = document.getElementById('u85');

var u146 = document.getElementById('u146');
gv_vAlignTable['u146'] = 'top';
var u214 = document.getElementById('u214');
gv_vAlignTable['u214'] = 'center';
var u34 = document.getElementById('u34');
gv_vAlignTable['u34'] = 'top';
var u154 = document.getElementById('u154');
gv_vAlignTable['u154'] = 'top';
var u99 = document.getElementById('u99');

var u202 = document.getElementById('u202');
gv_vAlignTable['u202'] = 'top';
var u17 = document.getElementById('u17');

var u218 = document.getElementById('u218');

u218.style.cursor = 'pointer';
if (bIE) u218.attachEvent("onclick", Clicku218);
else u218.addEventListener("click", Clicku218, true);
function Clicku218(e)
{

if (true) {

	self.location.href="Resources/reload.html#" + encodeURI(PageUrl + GetQuerystring());

}

}
gv_vAlignTable['u218'] = 'top';
var u1 = document.getElementById('u1');
gv_vAlignTable['u1'] = 'top';
var u65 = document.getElementById('u65');

var u48 = document.getElementById('u48');
gv_vAlignTable['u48'] = 'center';
var u121 = document.getElementById('u121');

var u210 = document.getElementById('u210');
gv_vAlignTable['u210'] = 'top';
var u143 = document.getElementById('u143');

var u167 = document.getElementById('u167');

var u203 = document.getElementById('u203');
gv_vAlignTable['u203'] = 'top';
var u215 = document.getElementById('u215');

var u79 = document.getElementById('u79');

var u188 = document.getElementById('u188');
gv_vAlignTable['u188'] = 'top';
var u32 = document.getElementById('u32');
gv_vAlignTable['u32'] = 'top';
var u80 = document.getElementById('u80');
gv_vAlignTable['u80'] = 'top';
var u172 = document.getElementById('u172');
gv_vAlignTable['u172'] = 'top';
var u175 = document.getElementById('u175');

var u15 = document.getElementById('u15');

var u76 = document.getElementById('u76');
gv_vAlignTable['u76'] = 'top';
var u155 = document.getElementById('u155');

var u158 = document.getElementById('u158');
gv_vAlignTable['u158'] = 'top';
var u101 = document.getElementById('u101');

var u204 = document.getElementById('u204');
gv_vAlignTable['u204'] = 'top';
var u94 = document.getElementById('u94');

var u60 = document.getElementById('u60');

var u117 = document.getElementById('u117');

var u51 = document.getElementById('u51');

var u150 = document.getElementById('u150');
gv_vAlignTable['u150'] = 'top';
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

var u162 = document.getElementById('u162');
gv_vAlignTable['u162'] = 'top';
var u114 = document.getElementById('u114');
gv_vAlignTable['u114'] = 'top';
var u89 = document.getElementById('u89');
gv_vAlignTable['u89'] = 'top';
var u26 = document.getElementById('u26');
gv_vAlignTable['u26'] = 'center';
var u219 = document.getElementById('u219');

u219.style.cursor = 'pointer';
if (bIE) u219.attachEvent("onclick", Clicku219);
else u219.addEventListener("click", Clicku219, true);
function Clicku219(e)
{

if (true) {

	self.location.href="job.html" + GetQuerystring();

}

}
gv_vAlignTable['u219'] = 'top';
var u124 = document.getElementById('u124');
gv_vAlignTable['u124'] = 'top';
var u74 = document.getElementById('u74');
gv_vAlignTable['u74'] = 'top';
var u122 = document.getElementById('u122');
gv_vAlignTable['u122'] = 'top';
var u211 = document.getElementById('u211');
gv_vAlignTable['u211'] = 'top';
var u138 = document.getElementById('u138');
gv_vAlignTable['u138'] = 'top';
var u136 = document.getElementById('u136');
gv_vAlignTable['u136'] = 'top';
var u10 = document.getElementById('u10');
gv_vAlignTable['u10'] = 'center';
var u57 = document.getElementById('u57');

var u92 = document.getElementById('u92');

var u5 = document.getElementById('u5');
gv_vAlignTable['u5'] = 'top';
var u97 = document.getElementById('u97');

var u189 = document.getElementById('u189');

var u41 = document.getElementById('u41');

var u135 = document.getElementById('u135');

var u24 = document.getElementById('u24');
gv_vAlignTable['u24'] = 'center';
var u72 = document.getElementById('u72');
gv_vAlignTable['u72'] = 'top';
var u102 = document.getElementById('u102');
gv_vAlignTable['u102'] = 'center';
var u118 = document.getElementById('u118');
gv_vAlignTable['u118'] = 'top';
var u0 = document.getElementById('u0');

var u55 = document.getElementById('u55');

var u38 = document.getElementById('u38');
gv_vAlignTable['u38'] = 'top';
var u83 = document.getElementById('u83');

var u110 = document.getElementById('u110');
gv_vAlignTable['u110'] = 'top';
var u50 = document.getElementById('u50');
gv_vAlignTable['u50'] = 'center';
var u86 = document.getElementById('u86');
gv_vAlignTable['u86'] = 'top';
var u115 = document.getElementById('u115');

var u69 = document.getElementById('u69');

var u216 = document.getElementById('u216');
gv_vAlignTable['u216'] = 'top';
var u22 = document.getElementById('u22');
gv_vAlignTable['u22'] = 'center';
var u161 = document.getElementById('u161');

var u212 = document.getElementById('u212');
gv_vAlignTable['u212'] = 'top';
var u139 = document.getElementById('u139');

var u186 = document.getElementById('u186');
gv_vAlignTable['u186'] = 'top';
var u66 = document.getElementById('u66');
gv_vAlignTable['u66'] = 'top';
var u217 = document.getElementById('u217');

u217.style.cursor = 'pointer';
if (bIE) u217.attachEvent("onclick", Clicku217);
else u217.addEventListener("click", Clicku217, true);
function Clicku217(e)
{

if (true) {

	self.location.href="struct.html" + GetQuerystring();

}

}
gv_vAlignTable['u217'] = 'top';
var u133 = document.getElementById('u133');

var u19 = document.getElementById('u19');

var u174 = document.getElementById('u174');
gv_vAlignTable['u174'] = 'top';
var u157 = document.getElementById('u157');

var u33 = document.getElementById('u33');

var u107 = document.getElementById('u107');

var u98 = document.getElementById('u98');
gv_vAlignTable['u98'] = 'center';
var u16 = document.getElementById('u16');
gv_vAlignTable['u16'] = 'center';
var u119 = document.getElementById('u119');

var u208 = document.getElementById('u208');
gv_vAlignTable['u208'] = 'top';
var u64 = document.getElementById('u64');
gv_vAlignTable['u64'] = 'top';
var u164 = document.getElementById('u164');
gv_vAlignTable['u164'] = 'top';
var u111 = document.getElementById('u111');

var u200 = document.getElementById('u200');
gv_vAlignTable['u200'] = 'top';
var u192 = document.getElementById('u192');
gv_vAlignTable['u192'] = 'top';
var u47 = document.getElementById('u47');

var u82 = document.getElementById('u82');
gv_vAlignTable['u82'] = 'top';
var u116 = document.getElementById('u116');
gv_vAlignTable['u116'] = 'top';
var u205 = document.getElementById('u205');
gv_vAlignTable['u205'] = 'top';
var u78 = document.getElementById('u78');

var u31 = document.getElementById('u31');

var u11 = document.getElementById('u11');

var u96 = document.getElementById('u96');
gv_vAlignTable['u96'] = 'center';
var u213 = document.getElementById('u213');

var u29 = document.getElementById('u29');

var u178 = document.getElementById('u178');
gv_vAlignTable['u178'] = 'top';
var u14 = document.getElementById('u14');
gv_vAlignTable['u14'] = 'center';
if (window.OnLoad) OnLoad();
