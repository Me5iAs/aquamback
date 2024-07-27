<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: multipart/form-data; charset=UTF-8");
header("Access-Control-Allow-Methods: PUT, GET, POST, FILES");
header("Allow: GET, POST, OPTIONS, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// verificar si llegó alguna imagen
if(isset($_FILES['imagenPropia'])){
  $imagen_tipo = $_FILES['imagenPropia']['type'];
  $imagen_nombre = $_FILES['imagenPropia']['name'];
  $directorio_final = "clientes/".$_POST['Nombre']; 


  // verificar si es una imagen o un archivo en funcion a ello se establece la ruta
  if($imagen_tipo == "image/jpeg" || $imagen_tipo == "image/jpg" || $imagen_tipo == "image/png"){
    $directorio_final = "imagenes/".$_POST['Nombre'].".jpg"; 
  }else{
    $directorio_final = "archivos/".$imagen_nombre; 
  }
  
  // utf8_decode("SoluciÃ³n Ãºtil y apaÃ±ada a UTF-8");
  $directorio_final = utf8_decode($directorio_final);

  if(file_exists($directorio_final)){
    unlink($directorio_final); // Eliminamos la imagen previa si existe.
  }
  
  //trata de subir
  if(move_uploaded_file($_FILES['imagenPropia']['tmp_name'], $directorio_final)){

    
    $imgInfo = getimagesize($directorio_final); 
    $mime = $imgInfo['mime'];
    switch($imagen_tipo){ 
        case 'image/jpeg': 
            $image = imagecreatefromjpeg($directorio_final); 
            break; 
        case 'image/png': 
            $image = imagecreatefrompng($directorio_final); 
            break; 
        case 'image/gif': 
            $image = imagecreatefromgif($directorio_final); 
            break; 
        default: 
            $image = imagecreatefromjpeg($directorio_final); 
    } 

    //agregado el 05.05.2024
    $ancho = $imgInfo[0];
    $alto  = $imgInfo[1];

    $NuevoAncho = 600;
    $NuevoAlto = ($alto / $ancho) * $NuevoAncho;

    $imagen_p = imagecreatetruecolor($NuevoAncho, $NuevoAlto);
   
    imagecopyresampled($imagen_p, $image, 0, 0, 0, 0, $NuevoAncho, $NuevoAlto, $ancho, $alto);
    // fin agregado 05.05.2024

    if(file_exists($directorio_final)){
      unlink($directorio_final); // Eliminamos la imagen previa si existe.
    }
     
    // Guardamos la imagen
    imagejpeg($imagen_p, $directorio_final, 75); 
    // imagejpeg($image, $directorio_final, 75); 


    $data = array(
      'status' => 'success',
      'code' => 200,
      'msj' => 'Imagen subida'
    );
    $format = (object) $data;
    $json = json_encode($format); 
    echo $json; 

  }else{
    //si no se pudo subir bota error
    $data = array(
      'status' => 'error',
      'code' => 400,
      'msj' => 'Error al mover imagen al servidor'
    );
    $format = (object) $data;
    $json = json_encode($format); 
    echo $json; 


  }

  

}else{
  $data = array(
    'status' => 'error',
    'code' => 400,
    'msj' => 'No se recibio ninguna imagen'
  );
  $format = (object) $data;
  $json = json_encode($format); 
  echo $json; 

}
?>