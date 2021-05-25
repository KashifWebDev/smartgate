<?php
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL,"https://api.amberelectric.com.au/prices/listprices");
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, '{ "postcode": "5000" }');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$server_output = curl_exec($ch);
curl_close ($ch);

//echo $server_output;

$json = json_decode($server_output, true);
$totalfixedKWHPrice_E1 = $json['data']['staticPrices']['E1']['totalfixedKWHPrice'];
$totalfixedKWHPrice_E2 = $json['data']['staticPrices']['E2']['totalfixedKWHPrice'];
$totalfixedKWHPrice_B1 = $json['data']['staticPrices']['B1']['totalfixedKWHPrice'];
$lossFactor_E1  = $json['data']['staticPrices']['E1']['lossFactor'];
$lossFactor_E2  = $json['data']['staticPrices']['E2']['lossFactor'];
$lossFactor_B1  = $json['data']['staticPrices']['B1']['lossFactor'];
$wholesaleKWHPrice_0  = $json['data']['variablePricesAndRenewables'][0]['wholesaleKWHPrice'];
$wholesaleKWHPrice_1  = $json['data']['variablePricesAndRenewables'][1]['wholesaleKWHPrice'];
$wholesaleKWHPrice_2  = $json['data']['variablePricesAndRenewables'][2]['wholesaleKWHPrice'];

$anyTimeUsage = $totalfixedKWHPrice_E1 + $lossFactor_E1 * $wholesaleKWHPrice_0 / 1.1;
$controledLoadUsage = $totalfixedKWHPrice_E2 + $lossFactor_E2 * $wholesaleKWHPrice_1 / 1.1;
$exportToGrid = $totalfixedKWHPrice_B1 + $lossFactor_B1 * $wholesaleKWHPrice_2 / 1.1;

require '../modules/db.php';
$sql = "INSERT INTO prices (anyTimeUsage, controledLoadUsage, exportToGrid) VALUES 
        ($anyTimeUsage, $controledLoadUsage, $exportToGrid)";
if(mysqli_query($con, $sql)){
    echo "Data saved!";
}


?>
