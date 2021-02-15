<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 	String collegeid = "", name = "", course = "", branch = "", semester = "";
collegeid = (String)request.getSession().getAttribute("collegeid");
%>

<%  if(collegeid == null) {
	response.sendRedirect("http://localhost:8080/MiniProject/index.html");
}
else {
	name = (String)request.getSession().getAttribute("name");
	course = (String)request.getSession().getAttribute("course");
	branch = (String)request.getSession().getAttribute("branch");
	semester = (String)request.getSession().getAttribute("semester");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Profile</title>
  <!-- Favicon -->
  <link href="./assets/img/brand/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="./assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="./assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="./assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
</head>
<style>
	body{
		overflow:hidden;
	}
	.btn-fb {
	    background-color: #3B5998;
	    color: white;
	    border-color: #3B5998;
	  }
	  .fa {
	  padding: 5px;
	  font-size: 20px;
	  width: 25px;
	  text-align: center;
	  text-decoration: none;
	}
	.btns {
	    background-color: white;
	    color:#3B5998;
	  }
</style>

<body>
  <div class="main-content">
    <!-- Navbar -->
    <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
      <div class="container-fluid">
        
        <!-- User -->
        <ul class="navbar-nav d-none d-md-flex" style="margin-left: auto;">
          <li class="nav-item dropdown">
            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle">
                  <img alt="Image placeholder" src="./assets/img/brand/favicon.png">
                </span>
                <div class="media-body ml-2 d-none d-lg-block">
                  <span class="mb-0 text-sm font-weight-bold"><%=name%></span>
                </div>
              </div>
            </a>
            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
              <div class=" dropdown-header noti-title">
                <h6 class="text-overflow m-0">Welcome!</h6>
              </div>
              <a href="./user_profile.jsp" class="dropdown-item">
                <i class="ni ni-single-02"></i>
                <span>My profile</span>
              </a>
              <div class="dropdown-divider"></div>
              <a id="logout" class="dropdown-item">
                <i class="ni ni-user-run"></i>
                <span>Logout</span>
              </a>
            </div>
          </li>
        </ul>
      </div>
    </nav>
    <!-- End Navbar -->
    <!-- Header -->
    <div class="header d-flex align-items-center" style="min-height: 450px; background-image: url(./assets/img/theme/profile-cover.jpg); background-size: cover; background-position: center top;">
      <!-- Mask -->
      <span class="mask bg-gradient-default opacity-8"></span>
      <!-- Header container -->
      <div class="container-fluid align-items-center mt--8 mb-6">
        <div class="row">
          <div class="col-lg-12 col-md-12">
            <h1 class="display-1 text-white" style="display:inline;clear:none">Welcome!</h1>
            <h4 class="ml-4 text-white" style="display:inline;clear:none;font-size:2.40rem;font-weight:600;line-height:1.5"><%=name%></h4>
            <p class="text-white mt-0">"In the end we are our choices. Build yourself a great story."</p>
            <h4 class="text-white mb-5" style="margin-left: 26.5vw;"> - Jeff Bezos</h4>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content -->
    <div class="container-fluid mt--9">
      <div class="row">
        <div class="col-xl-10 order-xl-2 mb-5 mb-xl-0" style="margin-left: auto;margin-right: auto;">
          <div class="card card-profile shadow" id="allquestions" style="height:50vh;overflow-y:scroll;display: none;">
              <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
                  <div class="d-flex justify-content-between">
                    <a id="" class="btn btn-md btn-info mr-4 text-white all_questions">All Questions</a>
                    <a id="" class="btn btn-md btn-default text-white float-right voted_questions">Voted Questions</a>
                  </div>
                </div>
            <div class="card-body">
	            <table class="table table-hover table-bordered">
		          <tbody id="ques"></tbody>
		        </table>
            </div>
          </div>
          <div class="card card-profile shadow" id="votedquestions" style="height:50vh;overflow-y:scroll;display: none;">
              <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
                  <div class="d-flex justify-content-between">
                    <a id="" class="btn btn-md btn-info mr-4 text-white all_questions">All Questions</a>
                    <a id="" class="btn btn-md btn-default text-white float-right voted_questions">Voted Questions</a>
                  </div>
                </div>
              <div class="card-body">
	              <table class="table table-hover table-bordered">
		              <tbody id="voted"></tbody>
		           </table>
              </div>
            </div>
          <div class="card card-profile shadow" id="profile" style="display:block;">
            <div class="row justify-content-center">
              <div class="col-lg-3 order-lg-2">
                <div class="card-profile-image">
                  <a href="./user_profile.jsp">
                    <img src="./assets/img/theme/user.jpg" class="rounded-circle">
                  </a>
                </div>
              </div>
            </div>
            <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
              <div class="d-flex justify-content-between">
                <a id="" class="btn btn-sm btn-info mr-4 text-white all_questions">All Questions</a>
                <a id="" class="btn btn-sm btn-default text-white float-right voted_questions">Voted Questions</a>
              </div>
            </div>
            <div class="card-body pt-0 pt-md-4">
              <div class="text-center mt-md-5">
                <h2><%=name%></h2>
                <h3 class="text-muted"><%=collegeid%></h3>
              </div>
              <div class="row mt-md-4" style="text-align:center">
              	<div class="col">
	              	<div class="font-weight-300" style="display:inline;clear:none">
		              <h3>Course :<i class="ni location_pin mr-2"></i><%=course%></h3>
		            </div>
              	</div>
              	<div class="col">
	              	 <div class="font-weight-300" style="display:inline;clear:none">
	              	   <h3>Branch :<i class="ni location_pin mr-2"></i><%=branch%></h3>
		             </div>
              	</div>
              	<div class="col">
	              	<div class="font-weight-300" style="display:inline;clear:none">
	                  <h3>Semester :<i class="ni location_pin mr-2"></i><%=semester%></h3>
	                </div>
              	</div>
              </div>
            </div>
          </div>
        </div>
      </div>
          <!-- Footer -->
          <footer class="footer">
              <div class="row align-items-center justify-content-xl-end" style="margin-left: auto;">
                  <div class="copyright text-center text-xl-left text-muted">
                    &copy; 2019 <a href="" class="font-weight-bold ml-1" target="_blank">Agrima</a>
                    <a href="" class="font-weight-bold ml-1" target="_blank">Kartikay</a>
                  </div>
              </div>
            </footer>
    </div>
  </div>
  <!--   Core   -->
  <script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
<script>
$('#logout').click(function() {
	var collegeid = <%= collegeid%>;
	$.ajax({
		url: "logout",
		method: "get",
		data: {"id":collegeid},
		success: function(data) {
			console.log("Logout Successful");
			window.location.href = "http://localhost:8080/MiniProject/index.html?Success=LogoutSuccessful";
	}
	});
});
</script>
<script>
$('.all_questions').click(function() {
	var studentid = <%=collegeid%>;
	$.ajax({
		  url: 'view_questions',
		  method: 'post',
		  data: {"id":studentid},
		  success: function(data) {
			  var arr = new Array();
			  var i;
			  var ques,id,pos;
			  var code = "";
			  arr = data.split("|");
			  if(arr.length > 1) {
				  $('#ques card').remove();
				  for(i=0; i<arr.length;i++) {
					  pos = arr[i].indexOf('-');
					  id = arr[i].substr(0,pos);
					  ques = arr[i].substr(pos+1,arr[i].length);
					  code = code + '<div class="card mb-2 mt-2"><div class="card-header"><a data-toggle="collapse" data-target="#'+id+'">'+ques+'</a></div><div class="card-body collapse" id="'+id+'"><div class="btn-group"><button type="button" class="btn btn-fb btns mr-3" style="border-radius: 50%;" value="yes"><i class="fa fa-thumbs-up radio-options" id="dislike"></i></button><button type="button" class="btn btn-fb btns ml-3 " style="border-radius: 50%;" value="no"><i class="fa fa-thumbs-down radio-options" id="dislike"></i></button></div></div></div>';
				  }
				  
				  $('#ques').append(code);
			  }
			  else {
				  $('#ques .allques').remove();
				  code = code + "<div class='card allques' style='height:25vh'><div class='container' style='text-align:center;padding:10vh 0vw'><h3>No Questions</h3></div></div>";
				  $('#ques').append(code);
			  }
			  
		  }
	  });
  $('#allquestions').show();
  $('#votedquestions').hide();
  $('#profile').hide();
});

$('.voted_questions').click(function() {
	var studentid = <%=collegeid%>;
	console.log(studentid);
	$.ajax({
		url: "voted",
		method: "post",
		data: {id:studentid},
		success: function(data) {
			var arr = new Array();
			var i;
            var code = "";
			arr = JSON.parse(data);
			var len = Object.keys(arr).length;
			if(Object.keys(arr) == "-1") {
				$('#voted .votedques').remove();
				code = code + "<div class='card votedques' style='height:25vh'><div class='container' style='text-align:center;padding:10vh 0vw'><h3>No Questions</h3></div></div>";
			}
			else {
				$('#voted .votedques').remove();
            	$('#voted tr').remove();
                
                for(i=0; i<len;i++) {
                  var id = arr[i]["id"];
                  var ques = arr[i]["question"];
                  var date = arr[i]["date"];
                  var course = arr[i]["course"];
                  var branch = arr[i]["branch"];
                  var semester = arr[i]["semester"];
                  var vote = arr[i]["vote"]
                  code = code +"<tr><td><h4>"+ ques + "</h4></td><td><h4>"+vote+"</h4></td><td><h4>"+course+"</h4></td><td><h4>"+branch+"</h4></td><td><h4>"+semester+"</h4></td><td><h4>"+date+"</h4></td>";
                }
                code = code + "</tr>";
            }
            
            $('#voted').append(code);
		}
	});
  $('#allquestions').hide();
  $('#votedquestions').show();
  $('#profile').hide();
});
</script>

<script>
$(document).on("click", ".btn-fb", function() {
  var val = $(this).val();
  var qid = $(this).parent().parent().attr("id");
  var studentid = <%=collegeid%>;
  $(this).siblings().removeClass("active");
  $(this).siblings().addClass("btns");
  $(this).removeClass("btns");
  $.ajax({
   url: 'vote',
   method: 'post',
   data: {id:qid,studentid:studentid,vote:val},
   success: function(data) {
	   $('#'+qid).parent().hide('slow', function() {
		   $('#'+qid).parent().remove();
		});
     $(this).addClass("active");
   }
 });
});
</script>
</html>