<?php

require_once('mtdb.mysql.php');
class MTSerializeMessagePackDatabasemysql extends MTDatabasemysql {
    public function set_serializer($s) {
        $this->serializer = $s;
    }
}
$this->db = new MTSerializeMessagePackDatabasemysql(
    $this->config('DBUser'),
    $this->config('DBPassword'),
    $this->config('Database'),
    $this->config('DBHost'),
    $this->config('DBPort'),
    $this->config('DBSocket')
);

require_once('MTSerializeMessagePack.php');
$this->db()->set_serializer(new MTSerializeMessagePack());
