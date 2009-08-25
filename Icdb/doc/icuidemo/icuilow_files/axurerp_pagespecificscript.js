
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

var u10 = document.getElementById('u10');

var u5 = document.getElementById('u5');
gv_vAlignTable['u5'] = 'center';
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

var u3 = document.getElementById('u3');
gv_vAlignTable['u3'] = 'center';
var u9 = document.getElementById('u9');
gv_vAlignTable['u9'] = 'center';
var u6 = document.getElementById('u6');

var u1 = document.getElementById('u1');
gv_vAlignTable['u1'] = 'center';
var u4 = document.getElementById('u4');

var u11 = document.getElementById('u11');
gv_vAlignTable['u11'] = 'center';
var u7 = document.getElementById('u7');
gv_vAlignTable['u7'] = 'center';
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

var u8 = document.getElementById('u8');

if (window.OnLoad) OnLoad();
