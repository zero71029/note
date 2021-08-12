<?php
header('Content-Type: text/event-stream');
header('Cache-Control: no-cache');

$time = date('Y-m-d H:m:s');
echo "data: Current time: {$time}\n\n";
flush();
?>
