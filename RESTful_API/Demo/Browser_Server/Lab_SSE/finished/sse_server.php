<?php 
header('Content-Type: text/event-stream');
header('Cache-Control: no-cache');

$counter = rand(1, 10);
while (1) {
  echo "event: ping\n";
  $curDate = date('Y-m-d H:m:s');
  echo 'data: {"time": "' . $curDate . '"}';
  echo "\n\n";
  ob_flush();
  flush();

  $counter--;
  if (!$counter) {
  	echo 'data: This is a message at time ' . $curDate . "\n\n";
  	break;
  }
  
  sleep(1);
}
?>
