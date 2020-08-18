<?php
include_once dirname(__FILE__) . '/../model/Estados.Class.php';
include_once dirname(__FILE__) . '/../libs/arraysParams.php';


@$action = $_POST["action"];
@$IdEstado = $_POST["IdEstado"];
@$Nonbre = $_POST["Nombre"];
@$Orden = $_POST["Orden"];
@$Activo = $_POST["Activo"];
@$FechaRegistro = $_POST["FechaRegistro"];
@$FechaActualizacion = $_POST["FechaActualizacion"];

$Estados = new Estados();

switch ($action) {
    case 'insert':    
            $dataArray = buildArray($_POST);       
            echo $Estados->insertEstado($dataArray);
        break;
    
    case 'select':
            $tables = "estados";
            $fields = "*";
            $where  = "";
            echo $Estados->selectEstado($tables, $fields, $where);
        break;
    
    case 'update':
            $dataArray = buildArrayUpdate($_POST, "IdEstado");
            $idValuesArray = ["idField" => "IdEstado", "idValue" => $IdEstado];
            echo $Estados->updateEstado($dataArray, $idValuesArray);
        break;
    
    case 'delete':
            $idValuesArray = ["idField" => "IdEstado", "idValue" => $IdEstado];
            echo $Estados->deleteEstado($idValuesArray);
        break;    
}


