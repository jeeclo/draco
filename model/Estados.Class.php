<?php
include_once dirname(__FILE__) . '/../libs/connect/Connect.php';


class Estados{

    private $table = "estados";
    private $data = "";
    private $fields = "";
    private $where = "";
    private $idValues = "";
    private $Connect = "";

    public function _construct(){

    }

    public function insertEstados($data = []){
        $this->data = $data;
        $dataArray = ["table" => $this->table, "data" => $this->data, "pk" => "IdEstado"];
        $Connect = new Connect();
        return $Connect->insert($dataArray);
    }

    public function updateEstados($data = [], $idValues = []){
        $this->data = $data;
        $this->idValues = $idValues;
        $dataArray = ["table" => $this->table, "idValues" => $this->idValues ,"data" => $this->data];
        $Connect = new Connect();
        return $Connect->update($dataArray);
    }

    public function deleteEstados($idValues = []){      
        $this->idValues = $idValues;
        $dataArray = ["table" => $this->table, "idValues" => $this->idValues];
        $Connect = new Connect();
        return $Connect->delete($dataArray);
    }
    public function selectEstados($tables = "", $fields = "", $where = ""){
        $this->table = $tables;
        $this->fields = $fields;
        $this->where = $where;

        $dataArray = ["table" => $this->table, "fields" => $this->fields, "where" => $this->where];
        $Connect = new Connect();
        return $Connect->select($dataArray);

    }



}


?>