<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<ul id="eventList">
</ul>

<script>
	var evtSource = new EventSource("sse_server.php");
	evtSource.onmessage = function(e) {
		var newElement = document.createElement("li");
		newElement.innerHTML = "message: " + e.data;
		eventList.appendChild(newElement)
	};

	evtSource.addEventListener("ping", function(e) {
		var newElement = document.createElement("li");
		var obj = JSON.parse(e.data);
		newElement.innerHTML = "ping at " + obj.time;
		eventList.appendChild(newElement);
	}, false);  
</script>

</body>
</html>