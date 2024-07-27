<?php 
class conexion {
    //cariale de conexion
    var $cnn;
    function conectar(){
        $servidor   = "localhost";
        $usuario    = "root"; 
        $clave      = "12345678"; 
        $base       = "aquapp"; 

        $link       = mysqli_connect($servidor,$usuario,$clave,$base);        
        
        // configuracion de caracteres UTF8
        mysqli_query($link,'SET NAMES utf8');
        mysqli_query($link,"SET time_zone = '-05:00'");
        mysqli_query($link,"SET lc_time_names = 'es_ES'"); //agregado v1.2
        
        return $link;
    }
    
    //fucion cerrar s
    function cerrar ($cnn){ 
        mysqli_close($cnn); 
    }   

    function EjecutarStore($sql){
        
        $cn = $this->conectar();
        $rs = mysqli_query($cn, $sql);
        
        $this->cerrar($cn);
        return $rs;
    }
} 
?>