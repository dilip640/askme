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
	<link href="css/style.css" rel="stylesheet">
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
			 if(isset($_GET['sort']))
				$order=$_GET['sort'];
			else $order='id';
			$result = mysqli_query($con,"SELECT * FROM post ORDER BY ".$order." DESC");
			while($row = mysqli_fetch_array($result)){
				$date = strtotime($row['post_date']);
				echo '<div class="card">';
				echo '<div class="ptitle"><a style="text-decoration:none" href="post.php?id='.$row['id'].'"><h3 style="color:#0274be;">' . $row['post_title'] . '</h3></a></div>';
				echo '<div class="postinfo"><i class="fa fa-calendar" aria-hidden="true"></i> '.date(" F j Y",$date).' 	&nbsp; <i class="fa fa-user" aria-hidden="true"></i> asked by '.$row['askedby'].' &nbsp;&nbsp;<i class="fa fa-eye"></i> '.$row['seen'].'</div>';
				echo '<div class="pcontent"><p>' . substr($row['post_content'], 0, 250) . '...</p><a href="post.php?id='.$row['id'].'">[Continue reading...]</a></div></div>';
			}
			?>
	</div>
			<div class="col-md-4">
			<div class="sticky-top">
				<div class="side side">
				<div><h5 class="text-center" style="color: #e85664">ORDER BY</h5></div>
				<form method="get" action="">
					<label class="cont">Newest First
					<input type="radio" checked="checked" name="sort" value="id">
					<span class="checkmark"></span>
					</label>
					<label class="cont">Most Viewed
					<input type="radio" name="sort" value='seen'>
					<span class="checkmark"></span>
					</label>
					<button style="margin-left:30%; border-radius:5px;cursor: pointer;" type="submit" >Sort</button>
				</form>

			</div>
					
				
			<div class="side side">
			<div><h4>Recent Questions</h4></div>
			 <ul>
				<?php 
					$result = mysqli_query($con,"SELECT * FROM post ORDER BY id DESC");
					$z=0;
				while(($row = mysqli_fetch_array($result)) && $z!=5){
					$date = strtotime($row['post_date']);
					echo '<li><a href="post.php?id='.$row['id'].'">' . $row['post_title'] . '</a></li>';
					$z++;
				}
				echo '</u></div>';
					mysqli_close($con);
				?>
			</div></div>
        </div>
		
      </div>
    </div>
	<div class="footer fot py-3 text-center">
        © 2018:
        <a href="#"> askME </a>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="js/bootstrap.bundle.min.js"></script>

  </body>

</html>
