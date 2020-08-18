<?php
include_once dirname(__FILE__) . '/../model/Duraciones.Class.php';
include_once dirname(__FILE__) . '/../libs/arraysParams.php';

@$action = $_POST["action"];
@$IdDuracion = $_POST["IdDuracion"];
@$Nonbre = $_POST["Nombre"];
@$TiempoMaximo = $_POST["TiempoMaximo"];
@$TiempoMinimo = $_POST["TiempoMinimo"];
@$Activo = $_POST["Activo"];
@$FechaRegistro = $_POST["FechaRegistro"];
@$FechaActualizacion = $_POST["FechaActualizacion"];

$Duraciones = new Duraciones();

switch ($action) {
    case 'insert':    
            $dataArray = buildArray($_POST);       
            echo $Duraciones->insertDuracion($dataArray);
        break;
    
    case 'select':
            $tables = "duraciones";
            $fields = "*";
            $where  = "";
            echo $Duraciones->selectDuracion($tables, $fields, $where);
        break;
    
    case 'update':
            $dataArray = buildArrayUpdate($_POST, "IdDuracion");
            $idValuesArray = ["idField" => "IdDuracion", "idValue" => $IdDuracion];
            echo $Duraciones->updateDuracion($dataArray, $idValuesArray);
        break;
    
    case 'delete':
            $idValuesArray = ["idField" => "IdDuracion", "idValue" => $IdDuracion];
            echo $Duraciones->deleteDuracion($idValuesArray);
        break;    
}


?>