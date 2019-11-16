<?php
//condicion donde se rectifica que los campos no esten vacios y que esten definidos
if(isset($_POST['submit']) && !empty($_POST['radiobutton']) && !empty($_POST['documento_usuario']) && !empty($_POST['nombre_usuario']) && !empty($_POST['apellido_usuario']) && !empty($_POST['tipo_usuario']) && !empty($_POST['horario']) ){

        require_once '../modelo/MySQL.php';//se llama la pagina mysql.php para hacer la respectiva conexion con la BD
        //declaracion de las variables donde se almacenan los datos de los respectivos campos llenados del formulario metodo post
        $documento=$_POST["documento_usuario"];
        $nombre=$_POST["nombre_usuario"];
        $apellido=$_POST["apellido_usuario"];
        $jornada=$_POST["radiobutton"];
        $tipo=$_POST["tipo_usuario"];
        $horario=$_POST["horario"];

        $mysql = new MySQL;//nuevo mysql
        $mysql->conectar();//funcion almacenada en mysql.php
        //consulta de la insercion de datos en la base de datos, donde hace las respectivas consultas
        $sql=$mysql->efectuarConsulta("insert into integrador.usuario(documento,nombres,apellidos,jornada,tipo_usuario_id,horario_id) VALUES ('".$documento."','".$nombre."','".$apellido."','".$jornada."','".$tipo."','".$horario."')");
        //condicion donde si la consulta se hace correcto
        if($sql){
            //mensaje de salida (alert) cuanod la consulta es exitosa con su respectiva redireccion de pagina
            echo"<script type=\"text/javascript\">alert('Se registro correctamente'); window.location='../index_administrador.html';</script>";

        }else{
            //mensaje de salida en caso de que la consulta falle
            echo"<script type=\"text/javascript\">alert('Se produjo un error'); window.location='../registro_usuario.php';</script>";
        }
        
         
}
?>