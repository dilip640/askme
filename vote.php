<?php 
if(isset($_GET['id']) && !empty($_GET['id']))
{
    $id = $_GET['id'];
	$vote=$_GET['vote'];
	if($vote==1) $rank=1;
	else $rank=-1;
    include('db.php');
	$ip=$_SERVER['REMOTE_ADDR'];
	$query = mysqli_query($con,"SELECT * FROM votes WHERE ans_id='".$id."' AND ip_address='".$ip."'");
	$row = mysqli_fetch_array($query);
	if(mysqli_num_rows($query)==0){
		$sqli = "INSERT INTO votes (ans_id, ip_address, rank)
				VALUES ('".$id."','".$ip."','".$rank."')";
		mysqli_query($con,$sqli);
		if($vote==1)
			$update = "UPDATE answers SET vote = vote + 1 WHERE id = '".$id."'";
		else
			$update = "UPDATE answers SET vote = vote - 1 WHERE id = '".$id."'";
		mysqli_query($con, $update);
	}
	else{
		
		if($vote==1&&$row['rank']==-1){
			$sqli = "UPDATE votes SET rank='".$rank."' WHERE ip_address='".$ip."' AND ans_id='".$id."'";
			mysqli_query($con,$sqli);
			$update = "UPDATE answers SET vote = vote + 2 WHERE id = '".$id."'";
			mysqli_query($con, $update);
		}
		else if($vote==0&&$row['rank']==1){
			$sqli = "UPDATE votes SET rank='".$rank."' WHERE ip_address='".$ip."' AND ans_id='".$id."'";
			mysqli_query($con,$sqli);
			$update = "UPDATE answers SET vote = vote - 2 WHERE id = '".$id."'";
			mysqli_query($con, $update);
		}
	}
	$result = mysqli_query($con,"SELECT vote FROM answers WHERE id='".$id."'");
	$row = mysqli_fetch_array($result);
	echo $row['vote'];
    die;
}
?>