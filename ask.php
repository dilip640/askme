<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>askME</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/styleO.css" rel="stylesheet">
	<link href="css/form.css" rel="stylesheet">
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
        <div class="col-lg-8">
		<div class="cardO">
		<?php require("db.php");
			 if(isset($_POST['save']))
			{	
				$name=$_POST["name"];
				$content=$_POST["content"];
				$sql = "INSERT INTO post (askedby, post_title, post_content)
				VALUES ('".$_POST["name"]."','".mysqli_real_escape_string($con,$_POST["title"])."','".htmlentities (mysqli_real_escape_string($con,$content))."')";
				$result = mysqli_query($con,$sql);
				$id = $con->insert_id;
				if( $name!=''){
					header("Location:post.php?id=$id");
				}
			} ?>
			<form action="ask.php" method="post">
				
				<div class="col-md-4 mb-3">
				<label for="validationTooltip01">Name</label>
				<input type="text" class="form-control" name="name" id="validationTooltip01"  required>
				
				</div>
				<div class="col-md-12 mb-3">
				<label for="validationTooltip02">Post Title</label>
				<input type="text" class="form-control" name="title" id="validationTooltip02" placeholder="Enter title here" required>
				</div>
				<div class="form-group">
					<label for="exampleFormControlTextarea1"></label>
					<textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="8" required></textarea>
				</div>
	
			<button class="btn btn-primary" name="save" type="submit">Post</button>
			</form>
			 
        </div></div>
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
	$(document).ready(function () {

$('#form').validate({
    rules: {
        name: {
            minlength: 2,
            required: true
        },
        email: {
            required: true,
            email: true
        },
        message: {
            minlength: 2,
            required: true
        }
    },
    highlight: function (element) {
        $(element).closest('.control-group').removeClass('success').addClass('error');
    },
    success: function (element) {
        element.text('OK!').addClass('valid')
            .closest('.control-group').removeClass('error').addClass('success');
    }
});
});
	</script>
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/form.js"></script>

  </body>

</html>
