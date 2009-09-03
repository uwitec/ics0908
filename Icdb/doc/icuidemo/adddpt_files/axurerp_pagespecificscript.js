
var PageName = 'adddpt';
var PageId = 'p3d8044bbeae54116baeb665b3e5c58ba'
var PageUrl = 'adddpt.html'
document.title = 'adddpt';

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

u10.style.cursor = 'pointer';
if (bIE) u10.attachEvent("onclick", Clicku10);
else u10.addEventListener("click", Clicku10, true);
function Clicku10(e)
{

if (true) {

	parent.window.close();

}

}

var u5 = document.getElementById('u5');

var u0 = document.getElementById('u0');

var u13 = document.getElementById('u13');

var u3 = document.getElementById('u3');
gv_vAlignTable['u3'] = 'top';
var u9 = document.getElementById('u9');

var u6 = document.getElementById('u6');

var u1 = document.getElementById('u1');
gv_vAlignTable['u1'] = 'top';
var u14 = document.getElementById('u14');

u14.style.cursor = 'pointer';
if (bIE) u14.attachEvent("onclick", Clicku14);
else u14.addEventListener("click", Clicku14, true);
function Clicku14(e)
{

if (true) {

	var obj1 = document.getElementById("u13");
    obj1.disabled = false;

	var obj1 = document.getElementById("u15");
    obj1.disabled = false;

	var obj1 = document.getElementById("u14");
    obj1.disabled = true;

}

}

var u12 = document.getElementById('u12');
gv_vAlignTable['u12'] = 'top';
var u4 = document.getElementById('u4');

var u11 = document.getElementById('u11');

u11.style.cursor = 'pointer';
if (bIE) u11.attachEvent("onclick", Clicku11);
else u11.addEventListener("click", Clicku11, true);
function Clicku11(e)
{

if (true) {

	parent.window.close();

}

}

var u15 = document.getElementById('u15');

u15.style.cursor = 'pointer';
if (bIE) u15.attachEvent("onclick", Clicku15);
else u15.addEventListener("click", Clicku15, true);
function Clicku15(e)
{

if (true) {

	var obj1 = document.getElementById("u14");
    obj1.disabled = false;

	var obj1 = document.getElementById("u13");
    obj1.disabled = true;

	var obj1 = document.getElementById("u15");
    obj1.disabled = true;

}

}

var u7 = document.getElementById('u7');
gv_vAlignTable['u7'] = 'top';
var u2 = document.getElementById('u2');
gv_vAlignTable['u2'] = 'top';
var u8 = document.getElementById('u8');

if (window.OnLoad) OnLoad();
