<?php
include "../connect.php";
$orderid=filterRequest("orderid");

$state=$con->prepare("UPDATE orders SET order_status=order_status+1 WHERE ordre_id=? AND order_type='delevery'");
$state->execute(array($orderid
));
$count=$state->rowCount();
result($count);