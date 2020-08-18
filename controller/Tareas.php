<?php
include_once dirname(__FILE__) . '/../model/Tareas.Class.php';
include_once dirname(__FILE__) . '/../libs/arraysParams.php';

@$action = $_POST["action"];
@$IdTarea = $_POST["IdTarea"];
@$NonbreTarea = $_POST["NombreTarea"];
@$DescripcionTarea = $_POST["DescripcionTarea"];
@$FechaRegistro = $_POST["FechaRegistro"];
@$FechaActualizacion = $_POST["FechaActualizacion"];
@$TiempoTarea = $_POST["TiempoTarea"];
@$IdDuracion = $_POST["IdDuracion"];
@$IdEstado = $_POST["IdEstado"];
@$IdResponsable = $_POST["IdResponsable"];
@$IdPrioridad = $_POST["IdPrioridad"];
@$Activo = $_POST["Activo"];
@$FechaInicio = $_POST["FechaInicio"];
@$FechaFin = $_POST["FechaFin"];

$Tareas = new Tareas();

switch ($action) {
    case 'insert':    
            $dataArray = buildArray($_POST);       
            echo $Tareas->insertTarea($dataArray);
        break;
    
    case 'select':
            $tables = "tareas";
            $fields = "*";
            $where  = "";
            echo $Tareas->selectTarea($tables, $fields, $where);
        break;
    
    case 'update':
            $dataArray = buildArrayUpdate($_POST, "IdTarea");
            $idValuesArray = ["idField" => "IdTarea", "idValue" => $IdTarea];
            echo $Tareas->updateTarea($dataArray, $idValuesArray);
        break;
    
    case 'delete':
            $idValuesArray = ["idField" => "IdTarea", "idValue" => $IdTarea];
            echo $Tareas->deleteTarea($idValuesArray);
        break;    
}


?>