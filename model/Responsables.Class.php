<?php
include_once dirname(__FILE__) . '/../libs/connect/Connect.php';


class Responsables{

    private $table = "responsables";
    private $data = "";
    private $fields = "";
    private $where = "";
    private $idValues = "";
    private $Connect = "";

    public function _construct(){

    }

    public function insertResponsable($data = []){
        $this->data = $data;
        $dataArray = ["table" => $this->table, "data" => $this->data, "pk" => "IdResponsable"];
        $Connect = new Connect();
        return $Connect->insert($dataArray);
    }

    public function updateResponsable($data = [], $idValues = []){
        $this->data = $data;
        $this->idValues = $idValues;
        $dataArray = ["table" => $this->table, "idValues" => $this->idValues ,"data" => $this->data];
        $Connect = new Connect();
        return $Connect->update($dataArray);
    }

    public function deleteResponsable($idValues = []){      
        $this->idValues = $idValues;
        $dataArray = ["table" => $this->table, "idValues" => $this->idValues];
        $Connect = new Connect();
        return $Connect->delete($dataArray);
    }
    public function selectResponsable($tables = "", $fields = "", $where = ""){
        $this->table = $tables;
        $this->fields = $fields;
        $this->where = $where;

        $dataArray = ["table" => $this->table, "fields" => $this->fields, "where" => $this->where];
        $Connect = new Connect();
        return $Connect->select($dataArray);

    }



}


?>