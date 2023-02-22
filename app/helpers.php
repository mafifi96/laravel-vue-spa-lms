<?php

function uid(){
    $uid = (string)(mt_rand(100000 , 999999) + mt_rand(-999,-1));

    if(strlen($uid) == 6)
    {
        return date("Y") . "-" . $uid;

    }

    uid();
}


function sendData(
    $data = [] ,
    $status = 200 ,
    $message = null)
{
    return response()->json([

        'data' => $data ,
        'message' => $message] ,
        $status);
}

function sendError(
    $errors = [] ,
    $status = 500 ,
    $message = null)
{

    return response()->json([
        'errors' => $errors ,
        'message' => $message] ,
        $status);
}
