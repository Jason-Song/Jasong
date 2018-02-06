<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Comet4J Hello World</title>
<script type="text/javascript" src="../../assets/js/comet4j.js"></script>
<script type="text/javascript">
function init(){
    
        var number1 = document.getElementById('number1');
        var number2 = document.getElementById('number2');
        // 建立连接，conn 即web.xml中 CometServlet的<url-pattern>
        JS.Engine.start('conn');
        // 监听后台某个频道
        JS.Engine.on(
               { 
                   // 对应服务端 “频道1” 的值 result1
                   result1 : function(num1){
                       alert(num1);

                       number1.innerHTML = num1;
                },
                // 对应服务端 “频道2” 的值 result2
                result2 : function(num2){
                       number2.innerHTML = num2;
                }
            }
           );
}
</script>
</head>
<body onload="init()">
        suzi1<span id="number1">...</span><br></br>
       2:<span id="number2">...</span>
</body>
</html>