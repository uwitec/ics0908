
var PageName = 'icuilow';
var PageId = 'p920fcb4e5c504a8fb330efd3e0b0954c'
var PageUrl = 'icuilow.html'
document.title = 'icuilow';

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

var u20 = document.getElementById('u20');

var u64 = document.getElementById('u64');

var u51 = document.getElementById('u51');
gv_vAlignTable['u51'] = 'center';
var u36 = document.getElementById('u36');

var u31 = document.getElementById('u31');
gv_vAlignTable['u31'] = 'center';
var u45 = document.getElementById('u45');
gv_vAlignTable['u45'] = 'center';
var u11 = document.getElementById('u11');
gv_vAlignTable['u11'] = 'center';
var u27 = document.getElementById('u27');
gv_vAlignTable['u27'] = 'center';
var u6 = document.getElementById('u6');

var u67 = document.getElementById('u67');
gv_vAlignTable['u67'] = 'center';
var u4 = document.getElementById('u4');

var u2 = document.getElementById('u2');

u2.style.cursor = 'pointer';
if (bIE) u2.attachEvent("onclick", ClickLinkToReferencePageu2);
else u2.addEventListener("click", ClickLinkToReferencePageu2, true);
function ClickLinkToReferencePageu2(e)
{
    self.location.href="userhome.html" + GetQuerystring();
}

x = 0;
y = (u2.offsetHeight) - 4;
InsertAfterBegin(u2ann, "<img src='Resources/newwindow.gif' id='u2PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u2PagePopup = document.getElementById('u2PagePopup');
if (bIE) u2PagePopup.attachEvent("onclick", u2PagePopupHandler);
else u2PagePopup.addEventListener("click", u2PagePopupHandler, true);

function u2PagePopupHandler(event)
{
    window.open("userhome.html" + GetQuerystring());
}

var u10 = document.getElementById('u10');

var u0 = document.getElementById('u0');

u0.style.cursor = 'pointer';
if (bIE) u0.attachEvent("onclick", ClickLinkToReferencePageu0);
else u0.addEventListener("click", ClickLinkToReferencePageu0, true);
function ClickLinkToReferencePageu0(e)
{
    self.location.href="login.html" + GetQuerystring();
}

x = 0;
y = (u0.offsetHeight) - 4;
InsertAfterBegin(u0ann, "<img src='Resources/newwindow.gif' id='u0PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u0PagePopup = document.getElementById('u0PagePopup');
if (bIE) u0PagePopup.attachEvent("onclick", u0PagePopupHandler);
else u0PagePopup.addEventListener("click", u0PagePopupHandler, true);

function u0PagePopupHandler(event)
{
    window.open("login.html" + GetQuerystring());
}

var u26 = document.getElementById('u26');

var u49 = document.getElementById('u49');
gv_vAlignTable['u49'] = 'center';
var u63 = document.getElementById('u63');
gv_vAlignTable['u63'] = 'center';
var u35 = document.getElementById('u35');
gv_vAlignTable['u35'] = 'center';
var u29 = document.getElementById('u29');
gv_vAlignTable['u29'] = 'center';
var u54 = document.getElementById('u54');

var u8 = document.getElementById('u8');

var u34 = document.getElementById('u34');

var u14 = document.getElementById('u14');

u14.style.cursor = 'pointer';
if (bIE) u14.attachEvent("onclick", ClickLinkToReferencePageu14);
else u14.addEventListener("click", ClickLinkToReferencePageu14, true);
function ClickLinkToReferencePageu14(e)
{
    self.location.href="struct.html" + GetQuerystring();
}

x = 0;
y = (u14.offsetHeight) - 4;
InsertAfterBegin(u14ann, "<img src='Resources/newwindow.gif' id='u14PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u14PagePopup = document.getElementById('u14PagePopup');
if (bIE) u14PagePopup.attachEvent("onclick", u14PagePopupHandler);
else u14PagePopup.addEventListener("click", u14PagePopupHandler, true);

function u14PagePopupHandler(event)
{
    window.open("struct.html" + GetQuerystring());
}

var u48 = document.getElementById('u48');

u48.style.cursor = 'pointer';
if (bIE) u48.attachEvent("onclick", ClickLinkToReferencePageu48);
else u48.addEventListener("click", ClickLinkToReferencePageu48, true);
function ClickLinkToReferencePageu48(e)
{
    self.location.href="viewjob.html" + GetQuerystring();
}

x = 0;
y = (u48.offsetHeight) - 4;
InsertAfterBegin(u48ann, "<img src='Resources/newwindow.gif' id='u48PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u48PagePopup = document.getElementById('u48PagePopup');
if (bIE) u48PagePopup.attachEvent("onclick", u48PagePopupHandler);
else u48PagePopup.addEventListener("click", u48PagePopupHandler, true);

function u48PagePopupHandler(event)
{
    window.open("viewjob.html" + GetQuerystring());
}

var u28 = document.getElementById('u28');

u28.style.cursor = 'pointer';
if (bIE) u28.attachEvent("onclick", ClickLinkToReferencePageu28);
else u28.addEventListener("click", ClickLinkToReferencePageu28, true);
function ClickLinkToReferencePageu28(e)
{
    self.location.href="modifystruct.html" + GetQuerystring();
}

x = 0;
y = (u28.offsetHeight) - 4;
InsertAfterBegin(u28ann, "<img src='Resources/newwindow.gif' id='u28PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u28PagePopup = document.getElementById('u28PagePopup');
if (bIE) u28PagePopup.attachEvent("onclick", u28PagePopupHandler);
else u28PagePopup.addEventListener("click", u28PagePopupHandler, true);

function u28PagePopupHandler(event)
{
    window.open("modifystruct.html" + GetQuerystring());
}

var u44 = document.getElementById('u44');

u44.style.cursor = 'pointer';
if (bIE) u44.attachEvent("onclick", ClickLinkToReferencePageu44);
else u44.addEventListener("click", ClickLinkToReferencePageu44, true);
function ClickLinkToReferencePageu44(e)
{
    self.location.href="modifydpt.html" + GetQuerystring();
}

x = 0;
y = (u44.offsetHeight) - 4;
InsertAfterBegin(u44ann, "<img src='Resources/newwindow.gif' id='u44PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u44PagePopup = document.getElementById('u44PagePopup');
if (bIE) u44PagePopup.attachEvent("onclick", u44PagePopupHandler);
else u44PagePopup.addEventListener("click", u44PagePopupHandler, true);

function u44PagePopupHandler(event)
{
    window.open("modifydpt.html" + GetQuerystring());
}

var u33 = document.getElementById('u33');
gv_vAlignTable['u33'] = 'center';
var u50 = document.getElementById('u50');

u50.style.cursor = 'pointer';
if (bIE) u50.attachEvent("onclick", ClickLinkToReferencePageu50);
else u50.addEventListener("click", ClickLinkToReferencePageu50, true);
function ClickLinkToReferencePageu50(e)
{
    self.location.href="addjob.html" + GetQuerystring();
}

x = 0;
y = (u50.offsetHeight) - 4;
InsertAfterBegin(u50ann, "<img src='Resources/newwindow.gif' id='u50PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u50PagePopup = document.getElementById('u50PagePopup');
if (bIE) u50PagePopup.attachEvent("onclick", u50PagePopupHandler);
else u50PagePopup.addEventListener("click", u50PagePopupHandler, true);

function u50PagePopupHandler(event)
{
    window.open("addjob.html" + GetQuerystring());
}

var u22 = document.getElementById('u22');

var u52 = document.getElementById('u52');

u52.style.cursor = 'pointer';
if (bIE) u52.attachEvent("onclick", ClickLinkToReferencePageu52);
else u52.addEventListener("click", ClickLinkToReferencePageu52, true);
function ClickLinkToReferencePageu52(e)
{
    self.location.href="modifyjob.html" + GetQuerystring();
}

x = 0;
y = (u52.offsetHeight) - 4;
InsertAfterBegin(u52ann, "<img src='Resources/newwindow.gif' id='u52PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u52PagePopup = document.getElementById('u52PagePopup');
if (bIE) u52PagePopup.attachEvent("onclick", u52PagePopupHandler);
else u52PagePopup.addEventListener("click", u52PagePopupHandler, true);

function u52PagePopupHandler(event)
{
    window.open("modifyjob.html" + GetQuerystring());
}

var u66 = document.getElementById('u66');

var u13 = document.getElementById('u13');
gv_vAlignTable['u13'] = 'center';
var u47 = document.getElementById('u47');
gv_vAlignTable['u47'] = 'center';
var u12 = document.getElementById('u12');

u12.style.cursor = 'pointer';
if (bIE) u12.attachEvent("onclick", ClickLinkToReferencePageu12);
else u12.addEventListener("click", ClickLinkToReferencePageu12, true);
function ClickLinkToReferencePageu12(e)
{
    self.location.href="orgstructure.html" + GetQuerystring();
}

x = 0;
y = (u12.offsetHeight) - 4;
InsertAfterBegin(u12ann, "<img src='Resources/newwindow.gif' id='u12PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u12PagePopup = document.getElementById('u12PagePopup');
if (bIE) u12PagePopup.attachEvent("onclick", u12PagePopupHandler);
else u12PagePopup.addEventListener("click", u12PagePopupHandler, true);

function u12PagePopupHandler(event)
{
    window.open("orgstructure.html" + GetQuerystring());
}

var u41 = document.getElementById('u41');
gv_vAlignTable['u41'] = 'center';
var u53 = document.getElementById('u53');
gv_vAlignTable['u53'] = 'center';
var u57 = document.getElementById('u57');
gv_vAlignTable['u57'] = 'center';
var u21 = document.getElementById('u21');
gv_vAlignTable['u21'] = 'center';
var u37 = document.getElementById('u37');
gv_vAlignTable['u37'] = 'center';
var u7 = document.getElementById('u7');
gv_vAlignTable['u7'] = 'center';
var u40 = document.getElementById('u40');

u40.style.cursor = 'pointer';
if (bIE) u40.attachEvent("onclick", ClickLinkToReferencePageu40);
else u40.addEventListener("click", ClickLinkToReferencePageu40, true);
function ClickLinkToReferencePageu40(e)
{
    self.location.href="viewdpt.html" + GetQuerystring();
}

x = 0;
y = (u40.offsetHeight) - 4;
InsertAfterBegin(u40ann, "<img src='Resources/newwindow.gif' id='u40PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u40PagePopup = document.getElementById('u40PagePopup');
if (bIE) u40PagePopup.attachEvent("onclick", u40PagePopupHandler);
else u40PagePopup.addEventListener("click", u40PagePopupHandler, true);

function u40PagePopupHandler(event)
{
    window.open("viewdpt.html" + GetQuerystring());
}

var u17 = document.getElementById('u17');
gv_vAlignTable['u17'] = 'center';
var u5 = document.getElementById('u5');
gv_vAlignTable['u5'] = 'center';
var u15 = document.getElementById('u15');
gv_vAlignTable['u15'] = 'center';
var u56 = document.getElementById('u56');

var u3 = document.getElementById('u3');
gv_vAlignTable['u3'] = 'center';
var u65 = document.getElementById('u65');
gv_vAlignTable['u65'] = 'center';
var u1 = document.getElementById('u1');
gv_vAlignTable['u1'] = 'center';
var u25 = document.getElementById('u25');
gv_vAlignTable['u25'] = 'center';
var u59 = document.getElementById('u59');
gv_vAlignTable['u59'] = 'center';
var u43 = document.getElementById('u43');
gv_vAlignTable['u43'] = 'center';
var u16 = document.getElementById('u16');

u16.style.cursor = 'pointer';
if (bIE) u16.attachEvent("onclick", ClickLinkToReferencePageu16);
else u16.addEventListener("click", ClickLinkToReferencePageu16, true);
function ClickLinkToReferencePageu16(e)
{
    self.location.href="dpt.html" + GetQuerystring();
}

x = 0;
y = (u16.offsetHeight) - 4;
InsertAfterBegin(u16ann, "<img src='Resources/newwindow.gif' id='u16PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u16PagePopup = document.getElementById('u16PagePopup');
if (bIE) u16PagePopup.attachEvent("onclick", u16PagePopupHandler);
else u16PagePopup.addEventListener("click", u16PagePopupHandler, true);

function u16PagePopupHandler(event)
{
    window.open("dpt.html" + GetQuerystring());
}

var u39 = document.getElementById('u39');
gv_vAlignTable['u39'] = 'center';
var u19 = document.getElementById('u19');
gv_vAlignTable['u19'] = 'center';
var u9 = document.getElementById('u9');
gv_vAlignTable['u9'] = 'center';
var u30 = document.getElementById('u30');

u30.style.cursor = 'pointer';
if (bIE) u30.attachEvent("onclick", ClickLinkToReferencePageu30);
else u30.addEventListener("click", ClickLinkToReferencePageu30, true);
function ClickLinkToReferencePageu30(e)
{
    self.location.href="addstruct.html" + GetQuerystring();
}

x = 0;
y = (u30.offsetHeight) - 4;
InsertAfterBegin(u30ann, "<img src='Resources/newwindow.gif' id='u30PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u30PagePopup = document.getElementById('u30PagePopup');
if (bIE) u30PagePopup.attachEvent("onclick", u30PagePopupHandler);
else u30PagePopup.addEventListener("click", u30PagePopupHandler, true);

function u30PagePopupHandler(event)
{
    window.open("addstruct.html" + GetQuerystring());
}

var u60 = document.getElementById('u60');

var u24 = document.getElementById('u24');

var u46 = document.getElementById('u46');

u46.style.cursor = 'pointer';
if (bIE) u46.attachEvent("onclick", ClickLinkToReferencePageu46);
else u46.addEventListener("click", ClickLinkToReferencePageu46, true);
function ClickLinkToReferencePageu46(e)
{
    self.location.href="addemployee.html" + GetQuerystring();
}

x = 0;
y = (u46.offsetHeight) - 4;
InsertAfterBegin(u46ann, "<img src='Resources/newwindow.gif' id='u46PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u46PagePopup = document.getElementById('u46PagePopup');
if (bIE) u46PagePopup.attachEvent("onclick", u46PagePopupHandler);
else u46PagePopup.addEventListener("click", u46PagePopupHandler, true);

function u46PagePopupHandler(event)
{
    window.open("addemployee.html" + GetQuerystring());
}

var u55 = document.getElementById('u55');
gv_vAlignTable['u55'] = 'center';
var u38 = document.getElementById('u38');

var u61 = document.getElementById('u61');
gv_vAlignTable['u61'] = 'center';
var u18 = document.getElementById('u18');

u18.style.cursor = 'pointer';
if (bIE) u18.attachEvent("onclick", ClickLinkToReferencePageu18);
else u18.addEventListener("click", ClickLinkToReferencePageu18, true);
function ClickLinkToReferencePageu18(e)
{
    self.location.href="job.html" + GetQuerystring();
}

x = 0;
y = (u18.offsetHeight) - 4;
InsertAfterBegin(u18ann, "<img src='Resources/newwindow.gif' id='u18PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u18PagePopup = document.getElementById('u18PagePopup');
if (bIE) u18PagePopup.attachEvent("onclick", u18PagePopupHandler);
else u18PagePopup.addEventListener("click", u18PagePopupHandler, true);

function u18PagePopupHandler(event)
{
    window.open("job.html" + GetQuerystring());
}

var u62 = document.getElementById('u62');

var u32 = document.getElementById('u32');

u32.style.cursor = 'pointer';
if (bIE) u32.attachEvent("onclick", ClickLinkToReferencePageu32);
else u32.addEventListener("click", ClickLinkToReferencePageu32, true);
function ClickLinkToReferencePageu32(e)
{
    self.location.href="viewstruct.html" + GetQuerystring();
}

x = 0;
y = (u32.offsetHeight) - 4;
InsertAfterBegin(u32ann, "<img src='Resources/newwindow.gif' id='u32PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u32PagePopup = document.getElementById('u32PagePopup');
if (bIE) u32PagePopup.attachEvent("onclick", u32PagePopupHandler);
else u32PagePopup.addEventListener("click", u32PagePopupHandler, true);

function u32PagePopupHandler(event)
{
    window.open("viewstruct.html" + GetQuerystring());
}

var u42 = document.getElementById('u42');

u42.style.cursor = 'pointer';
if (bIE) u42.attachEvent("onclick", ClickLinkToReferencePageu42);
else u42.addEventListener("click", ClickLinkToReferencePageu42, true);
function ClickLinkToReferencePageu42(e)
{
    self.location.href="adddpt.html" + GetQuerystring();
}

x = 0;
y = (u42.offsetHeight) - 4;
InsertAfterBegin(u42ann, "<img src='Resources/newwindow.gif' id='u42PagePopup' style='cursor:pointer;position:absolute;z-index:500;left:" + x + ";top:" + y + "'>");

var u42PagePopup = document.getElementById('u42PagePopup');
if (bIE) u42PagePopup.attachEvent("onclick", u42PagePopupHandler);
else u42PagePopup.addEventListener("click", u42PagePopupHandler, true);

function u42PagePopupHandler(event)
{
    window.open("adddpt.html" + GetQuerystring());
}

var u23 = document.getElementById('u23');
gv_vAlignTable['u23'] = 'center';
var u58 = document.getElementById('u58');

if (window.OnLoad) OnLoad();
