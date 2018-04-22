<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="icon" href="css/ico.png">
    <title>askME</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/styleO.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    <style>
      body {
        padding-top: 54px;
      }
      @media (min-width: 992px) {
        body {
          padding-top: 56px;
        }
      }

    </style>

  </head>

  <body>

    <nav class="navbar navbar-expand-lg tog bg-nav fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.php"><b>askME</b></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item act">
              <a class="nav-link" href="ask.php">Ask Question
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container">
      <div class="row">
        <div class="col-md-8">
         <?php require("db.php");
			$id = $_GET['id'];
			$ip=$_SERVER['REMOTE_ADDR'];
			$query = mysqli_query($con,"SELECT * FROM seen WHERE post_id='".$id."' AND ip_address='".$ip."'");
			if(mysqli_num_rows($query)==0){
				$sqli = "INSERT INTO seen (post_id, ip_address) VALUES ('".$id."','".$ip."')";
				mysqli_query($con,$sqli);
				$update = "UPDATE post SET seen = seen + 1 WHERE id = '".$id."'";
				mysqli_query($con, $update);
			}
			$result = mysqli_query($con,"SELECT * FROM post WHERE id='$id'");
			$row = mysqli_fetch_array($result);
			$date = strtotime($row['post_date']);
				echo '<div class="cardO">
				<div class="ptitle"><h2 style="color:#0274be;">' . $row['post_title'] . '</h2></div>';
				echo '<div class="postinfo"><i class="fa fa-calendar" aria-hidden="true"></i>'.date(" F j Y",$date).'	&nbsp; <i class="fa fa-user" aria-hidden="true"></i> asked by '.$row['askedby'].' &nbsp;&nbsp;<i class="fa fa-eye"></i> '.$row['seen'].'</div>';
				echo nl2br('<div class="pcontent"><p>' . html_entity_decode($row['post_content']).' </p></div>');
			
			?>
			<div class="hea"><h4>Answers</h4></div>
			<?php 	
				$resul = mysqli_query($con,"SELECT * FROM answers WHERE post_id='$id' ORDER BY vote DESC");
				while($row = mysqli_fetch_array($resul)){
					$date = strtotime($row['ans_date']);
					echo '<div class="answers">
					<div class = "box">
					<div class = "up" onClick="upvote('.$row['id'].')" style="cursor: pointer;">&#9650;</div><div id="'.$row['id'].'">'.$row['vote'].'</div>
				<div class = "down" onClick="downvote('.$row['id'].')" style="cursor: pointer;">&#9660;</div></div>
					<h5>'.$row['ansby'].'</h5>
				
				<div class="anscont">'.$row['ans_content'].'</div>
				<div class="ansinfo"><i class="fa fa-calendar" aria-hidden="true"></i>&nbsp;'.date(" F j Y",$date).'&nbsp;</div></div>';}
			?>
			<div class="answers">
				<form action="post.php" method="post">
				
				<div class="form-group">
					<label for="exampleFormControlTextarea1"></label>
					<textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="8" required></textarea>
				</div>
				<div class="col-md-4 mb-3">
				<label for="validationTooltip01">Name</label>
				<input type="text" class="form-control" name="name" id="validationTooltip01"  required>
				 <?php echo '<input type="hidden" name="xid" value="'.htmlentities($id).'">'; ?>
				</div>
	
			<button class="btn btn-primary" name="save" type="submit">Reply</button>
			</form>
			<?php
				if(isset($_POST['save']))
			{	
				$id=$_POST["xid"];
				$name=$_POST["name"];
				$content=$_POST["content"];
				$sql = "INSERT INTO answers (ansby, post_id, ans_content)
				VALUES ('".$_POST["name"]."','".$id."','".htmlentities (mysqli_real_escape_string($con,$content))."')";
				$result = mysqli_query($con,$sql);
				if( $name!=''){
					header("Location:post.php?id=$id");
				}
			}
			?>
			</div>
		</div>
</div>
		<div class="col-md-4">
			<div class="cardO side">
			<div><h4>Recent Questions</h4></div>
				<ul>
				<?php 
					$result = mysqli_query($con,"SELECT * FROM post ORDER BY id DESC");
					$z=0;
				while(($row = mysqli_fetch_array($result)) && $z!=5){
					echo '<li><a href="post.php?id='.$row['id'].'">' . $row['post_title'] . '</a></li>';
					$z++;
				}
				echo '</div>';
					mysqli_close($con);
				?>
				</ul>
        </div>
      </div>
    </div>
<div class="footer fot py-3 text-center">
        © 2018:
        <a href="#"> askME </a>
    </div>
  <script>
function upvote(id)
{
    var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById(id).innerHTML=xmlhttp.responseText;
            }
        };
    xmlhttp.open("GET", "vote.php?id=" +id+"&vote="+1, true);
    xmlhttp.send();
}
function downvote(id)
{
    var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById(id).innerHTML=xmlhttp.responseText;
            }
        };
    xmlhttp.open("GET", "vote.php?id=" +id+"&vote="+0, true);
    xmlhttp.send();
}
</script>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="js/bootstrap.bundle.min.js"></script>

  </body>

</html>
