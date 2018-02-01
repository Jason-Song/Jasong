<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>tail log</title>
<script src="//cdn.bootcss.com/jquery/2.1.4/jquery.js"></script>
<style>
	html,body
	{
		height:100%;
		width:100%;
	}
</style>
</head>
<body>
    <div id="log-container" style="height: 100%; overflow-y: scroll; background: #333; color: #aaa; padding: 10px;">
        <div>
        </div>
    </div>
</body>
<script>
    $(document).ready(function() {
        // æå®websocketè·¯å¾
        var websocket = new WebSocket('ws://localhost:8080/w/ws.do');
        websocket.onmessage = function(event) {
            // æ¥æ¶æå¡ç«¯çå®æ¶æ¥å¿å¹¶æ·»å å°HTMLé¡µé¢ä¸­
            $("#log-container div").append(event.data + "<p> </p>");
            // æ»å¨æ¡æ»å¨å°æä½é¨
            $("#log-container").scrollTop($("#log-container div").height() - $("#log-container").height());
        };
    });
</script>
</body>
</html>