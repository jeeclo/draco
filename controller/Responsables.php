<?php

include_once dirname(__FILE__) . '/../model/Responsables.Class.php';
include_once dirname(__FILE__) . '/../libs/arraysParams.php';

@$action = $_POST["action"];
@$IdResonsable = $_POST["IdResponsable"];
@$Nonbre = $_POST["Nombre"];
@$Orden = $_POST["Orden"];
@$Activo = $_POST["Activo"];
@$FechaRegistro = $_POST["FechaRegistro"];
@$FechaActualizacion = $_POST["FechaActualizacion"];

$Resonsables = new Resonsables();

switch ($action) {
    case 'insert':    
            $dataArray = buildArray($_POST);       
            echo $Resonsables->insertResponsable($dataArray);
        break;
    
    case 'select':
            $tables = "resonsables";
            $fields = "*";
            $where  = "";
            echo $Resonsables->selectResponsable($tables, $fields, $where);
        break;
    
    case 'update':
            $dataArray = buildArrayUpdate($_POST, "IdResponsable");
            $idValuesArray = ["idField" => "IdResponsable", "idValue" => $IdResponsable];
            echo $Resonsables->updateResponsable($dataArray, $idValuesArray);
        break;
    
    case 'delete':
            $idValuesArray = ["idField" => "IdResponsable", "idValue" => $IdResponsable];
            echo $Resonsables->deleteResponsable($idValuesArray);
        break;    
}



?>