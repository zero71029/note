<!DOCTYPE html>
<html>
<body>

<div id="result"></div>

<script>
    if(typeof(EventSource)!=="undefined")
    {
        var source=new EventSource("sse_server.php");
        source.onmessage=function(event){
                document.getElementById("result").innerHTML+=event.data + "<br>";
            };
    }
    else {
        document.getElementById("result").innerHTML="Sorry, your browser does not support server-sent events.";
    }
</script>

</body>
</html>
