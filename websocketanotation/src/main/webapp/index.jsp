<!DOCTYPE HTML>

<html>
<head>
    <title>WebSocket Learning Example(Hello World)</title>
    <script type="text/javascript">
        var ws;
        function init() {
            outputArea = document.getElementById("output");
        }

        function sayHello() {
            var url = "ws://localhost:8080/websocket/hello";
            writeMessageToScreen("Connecting to " + url);
            ws = new WebSocket(url);
            ws.onopen = function (event) {
                writeMessageToScreen("Connected.");
                var message=document.getElementById("message").value;
                doSend(message);
            }

            ws.onmessage = function (event) {
                writeMessageToScreen("Received message: " + event.data);
                ws.close();
            }

            ws.onerror = function (event) {
                writeMessageToScreen("Occur Error:<span style='color:red'>" + event.data + "</span>");
                ws.close();
            }
        }

        function doSend(message) {
            ws.send(message);
            writeMessageToScreen("Sent message: " + message);
        }

        function writeMessageToScreen(message) {
            var p = document.createElement("p");
            p.style.wordWrap = "break-word";
            p.innerHTML = message;
            outputArea.appendChild(p);
        }

        this.addEventListener("load", init, false);
    </script>
</head>
<body>
<h1>Hello World Server</h1>

<div style="text-align:left">
    <form action="#">
        <input type="text"  id="message" placeholder="Please enter your name."/>
        <input type="button" id="sender" value="PressMeToSend" onclick="sayHello()"/>
    </form>
</div>
<div id="output">
</div>
</body>
</html>
