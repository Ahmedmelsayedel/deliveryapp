<?php
include "../connect.php";
$userid=filterRequest("id");
$stat=$con->prepare("SELECT * FROM `deliveryapporder`WHERE order_status=2");
$stat->execute();

$data=$stat->fetchAll(PDO::FETCH_ASSOC);
$count=$stat->rowCount();
if($count>0){
    $stat2=$con->prepare("UPDATE deliveryapporder SET userdeleverid=? ");
    $stat2->execute(array($userid));
    echo json_encode(array("status" => "success", "data" => $data));
}else{
    printfailur();
}