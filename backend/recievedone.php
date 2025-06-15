<?php
include "../connect.php";
$userid=filterRequest("id");
$stat=$con->prepare("SELECT * FROM `deliveryapporder`WHERE order_status=3 AND userdeleverid=? ");

$stat->execute(array($userid));
$data=$stat->fetchAll(PDO::FETCH_ASSOC);
$count=$stat->rowCount();
if($count>0){
    echo json_encode(array("status" => "success", "data" => $data));
}else{
    printfailur();
}