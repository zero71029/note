<?php

// 引用 nusoap 函式館
require_once ('lib/nusoap.php');

$server = new soap_server ();

// 登記哪些 function 要對外公開
$server->register ( 'SayHello' );
$server->register ( 'Add' );

// 實作對外公開的函式
function SayHello($UserName) {
    $result = "";
    if (! $UserName) {
        return new soap_fault ( 'Client', '', 'Please tell me your name.' );
    }
    $result = "Hi! " . $UserName;
    return $result;
}

function Add($x, $y) {
    return $x + $y;
}


$server->service ( $HTTP_RAW_POST_DATA );
exit ();

?> 

