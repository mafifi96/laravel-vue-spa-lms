<?php

function uid(){
    $uid = (string)(mt_rand(100000 , 999999) + mt_rand(-999,-1));

    if(strlen($uid) == 6)
    {
        return date("Y") . "-" . $uid;

    }

    uid();
}
