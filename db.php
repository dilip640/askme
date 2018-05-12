<?php $con=new mysqli(null,'root','password',"askme",null,"/cloudsql/askme8896:us-central1:root1");

if (mysqli_connect_errno())
{
echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
 ?>
