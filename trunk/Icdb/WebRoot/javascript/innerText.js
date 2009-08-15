
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

	function toSetIdold(id_code,name_code,radiolist){
    		var code;
    		var name;
    		var idtitle;
    		
    		idtitle=document.getElementsByName(radiolist);
    		for(var i=0; i<idtitle.length;i++){
		       if(idtitle[i].checked){
		          code="code"+idtitle[i].value;
		          name="name"+idtitle[i].value;
		          code=document.getElementById(code).value;
		          name=document.getElementById(name).value;
		        } 
		   }
		   if(code!=null && name!=null){
		    window.opener.document.getElementById(id_code).value=code;
		    window.opener.document.getElementById(name_code).value=name;
    		window.close();
    		}else{
    			alert("请选择一条有效的信息");
    		}
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