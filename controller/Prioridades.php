<?php
include_once dirname(__FILE__) . '/../model/Prioridades.Class.php';
include_once dirname(__FILE__) . '/../libs/arraysParams.php';

@$action = $_POST["action"];
@$IdPrioridad = $_POST["IdPrioridad"];
@$Nonbre = $_POST["Nombre"];
@$Orden = $_POST["Orden"];
@$Activo = $_POST["Activo"];
@$FechaRegistro = $_POST["FechaRegistro"];
@$FechaActualizacion = $_POST["FechaActualizacion"];

$Prioridades = new Prioridades();

switch ($action) {
    case 'insert':    
            $dataArray = buildArray($_POST);       
            echo $Prioridades->insertPrioridad($dataArray);
        break;
    
    case 'select':
            $tables = "prioridades";
            $fields = "*";
            $where  = "";
            echo $Prioridades->selectPrioridad($tables, $fields, $where);
        break;
    
    case 'update':
            $dataArray = buildArrayUpdate($_POST, "IdPrioridad");
            $idValuesArray = ["idField" => "IdPrioridad", "idValue" => $IdPrioridad];
            echo $Prioridades->updatePrioridad($dataArray, $idValuesArray);
        break;
    
    case 'delete':
            $idValuesArray = ["idField" => "IdPrioridad", "idValue" => $IdPrioridad];
            echo $Prioridades->deletePrioridad($idValuesArray);
        break;    
}
