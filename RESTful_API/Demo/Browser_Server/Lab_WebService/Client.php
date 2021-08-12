<?php

// 引用 nusoap 函式館
require_once ('lib/nusoap.php');

// 準備 SayHello 方法所需的參數值
$param = array (
        'UserName' => 'Chien' 
);

// 建立 nusoap_client 並且呼叫 WebService 的方法
$client = new nusoap_client ( 'https://lab-appdev1226-1.c9users.io/WebService/Server.php' );
$response = $client->call ( 'SayHello', $param );

// 處理傳回值
if ($client->fault) {
    echo "FAULT: <p>Code: (" . $client->faultcode . "</p>";
    echo "String: " . $client->faultstring;
} else {
    echo $response;
}

echo "<hr>";

// 準備 Add 方法所需的參數值
$param = array (
        'x' => 10,
        'y' => 11
);

// 呼叫 Add 方法
$response = $client->call ( 'Add', $param );

// 處理傳回值
if ($client->fault) {
    echo "FAULT: <p>Code: (" . $client->faultcode . "</p>";
    echo "String: " . $client->faultstring;
} else {
    echo $response;
}

?> 
