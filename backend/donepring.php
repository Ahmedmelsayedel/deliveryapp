<?php
include "../connect.php";
$stat=$con->prepare("SELECT * FROM `deliveryapporder`WHERE order_status=1");

$stat->execute();
$data=$stat->fetchAll(PDO::FETCH_ASSOC);
$count=$stat->rowCount();
if($count>0){
    echo json_encode(array("status" => "success", "data" => $data));
}else{
    printfailur();
}