$.fn.outerHTML = function(){	 
    // IE, Chrome & Safari will comply with the non-standard outerHTML, all others (FF) will have a fall-back for cloning
    return (!this.length) ? this : (this[0].outerHTML || (
      function(el){
          var div = document.createElement('div');
          div.appendChild(el.cloneNode(true));
          var contents = div.innerHTML;
          div = null;
          return contents;
    })(this[0]));
};

$.postForm = function(URL, PARAMS, target) {        
    var temp = document.createElement("form");        
    temp.action = URL;        
    temp.method = "post";
    if(target)
    	temp.target = target;
    temp.style.display = "none";        
    for (var x in PARAMS) {        
        var opt = document.createElement("textarea");        
        opt.name = x;        
        opt.value = PARAMS[x];        
        // alert(opt.name)         
        temp.appendChild(opt);        
    }        
    document.body.appendChild(temp);        
    temp.submit();        
    return temp;             
};

$.form2Json = function (formObj){
	var form = new Object();
	$(formObj).find("input[name]").each(function(){
		form[$(this).attr("name")]=$(this).val();
	});
	return form;
};

String.prototype.parseTextarea = function() {
	var text = this.replace(new RegExp("\n","gm"),"\\n");
    return text;
};

window.console = window.console || {log:function(){}};