
try{
        HTMLElement.prototype.__defineGetter__
        (
        "innerText",
        function ()
        {
            var anyString = "";
            var childS = this.childNodes;
            for(var i=0; i<childS.length; i++)
            {
                if(childS[i].nodeType==1)
                    anyString += childS[i].tagName=="BR" ? '"n' : childS[i].innerText;
                else if(childS[i].nodeType==3)
                    anyString += childS[i].nodeValue;
            }
            return anyString;
        }
    ); 
}
catch(e){}
  
  	function page_close(){
    		window.opener=null;
	  			window.close();
    	}
  
  	function trim(s){
	  	var str = s||"";
	   	str = str.replace(/(^\s*)|(\s*$)/g,'');
	   	return str;
	}
	
	function isEmptyNum(s) {
	return !(s === 0)
			&& (isNull(s) || s == "" || new String(s).toUpperCase() == "NULL");
	}
	
	function isNull(o) {
		return null == o && !(o === 0);
	}
	
	function isNumber(sNumber, len) {
	if (!isEmptyNum(sNumber)) {
		if (sNumber.length <= (len || 16)) {
			var regex = /^\d+(\.\d{1,2})?$/;
			return sNumber.match(regex) ? true : false;
		}
	}
	return false;

}
	
	function pageSet(value_key){
    		var sizevalue=document.getElementById("size").value;
    		var countvalue=document.getElementById("countsize").value;
    		 switch(value_key){
			  case -1:
			   document.getElementById("size").value=sizevalue-'0'-1;
			   break;
			  case 1:
			    document.getElementById("size").value=sizevalue-'0'+1;
			   break;
			  case 0:
			    document.getElementById("size").value=1;
			   break;
			   case 2:
			    document.getElementById("size").value=countvalue;
			   	break;
			  default:
			   break;
			   }
			  pageform.submit();
    	}
    	
    	function toSetId(value_list,radio_list){
    		var idtitle;
    		var JSP_value=new Array(value_list.length);
    		var temp;
    		idtitle=document.getElementsByName(radio_list);
    		for(var i=0; i<idtitle.length;i++){
		       if(idtitle[i].checked){
		       for(var j=0;j<value_list.length;j++){
		       	  temp=value_list[j]+idtitle[i].value;
		       	  
		             
		          if(document.getElementById(temp).value!=null){
		          	   JSP_value[j]=document.getElementById(temp).value; 
			          }else{
			           JSP_value[j]=document.getElementById(temp).innerText; 
			          } 
		          }
		        } 
		   }
		   if(JSP_value!=null){
		   		for(var k=0;k<value_list.length;k++){
		   	
		    		window.opener.document.getElementById(value_list[k]).value=JSP_value[k];
		    	}
    		window.close();
    		}else{
    			alert("请选择一条有效的信息");
    		}
    	}