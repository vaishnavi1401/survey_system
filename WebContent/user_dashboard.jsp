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
  <title>Voting System</title>
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

<body class="">
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
                  <img alt="Image placeholder" src="./assets/img/theme/user.jpg">
                </span>
                <div class="media-body ml-2 d-none d-lg-block">
                  <span class="mb-0 text-sm  font-weight-bold"><%=name%></span>
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
    <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
    
    <div class="container-fluid">
    <div class="header-body">
        <!-- Card stats -->
        <div class="row">
            <ul class="nav nav-pills" style="margin-left: auto;margin-right: auto;">
	            <li class="col-xl-6 col-lg-6 active">
		            <a data-toggle="tab" href="#view_question">
		                <div class="card card-stats mb-4 mb-xl-0">
		                    <div class="card-body">
		                      <div class="row">
		                        <div class="col">
		                          <h5 class="card-title text-uppercase mb-0">View all Questions</h5>
		                        </div>
		                        <div class="col-auto">
		                          <div class="icon icon-shape bg-warning text-white rounded-circle shadow">
		                            <i class="fas fa-chart-pie"></i>
		                          </div>
		                        </div>
		                      </div>
		                    </div>
		                  </div>
		            </a>
		          </li>
                <li class="col-xl-6 col-lg-6">
                  <a data-toggle="tab" href="#answered_questions">
                    <div class="card card-stats mb-4 mb-xl-0">
                        <div class="card-body">
                          <div class="row">
                            <div class="col">
                              <h5 class="card-title text-uppercase mb-0">Voted Questions</h5>
                            </div>
                            <div class="col-auto">
                              <div class="icon icon-shape bg-danger text-white rounded-circle shadow">
                                <i class="fas fa-chart-bar"></i>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </a>
                  </li>
              </ul>
        </div>

      </div>
</div>
    
    </div>
    
    
    <div class="container-fluid mt--7">
    <div class="card">
    <div class="card-body">
      <div class="tab-content">
	      <!-- View all Question -->
	      <div id="view_question" class="tab-pane fade active">
	        <table class="table table-hover table-bordered">
	          <tbody id="ques"></tbody>
	        </table>
	      </div>
	      <!-- End of View all Question -->

           <!-- Answered Questions -->
           <div id="answered_questions" class="tab-pane fade">
	           <table class="table table-hover table-bordered">
		          <tbody id="voted"></tbody>
		        </table>
          </div>
          <!-- End of Answered Questions -->
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
  <!--   Optional JS   -->
  <script src="./assets/js/plugins/chart.js/dist/Chart.min.js"></script>
  <script src="./assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
  <!--   Argon JS   -->
  <script src="./assets/js/argon-dashboard.min.js?v=1.1.0"></script>
</body>
<script>
	$(document).ready(function() {
		var studentid = <%=collegeid%>;
		$.ajax({
			  url: 'view_questions',
			  method: 'post',
			  data: {"id":studentid},
			  success: function(data) {
				  var arr = new Array();
				  var i;
				  var ques,id,pos;
				  arr = data.split("|");
				  $('#ques card').remove();
				  var code = "";
				  for(i=0; i<arr.length;i++) {
					  pos = arr[i].indexOf('-');
					  id = arr[i].substr(0,pos);
					  ques = arr[i].substr(pos+1,arr[i].length);
					  code = code + '<div class="card mb-2 mt-2"><div class="card-header"><a data-toggle="collapse" data-target="#'+id+'">'+ques+'</a></div><div class="card-body collapse" id="'+id+'"><div class="btn-group"><button type="button" class="btn btn-fb btns mr-3" style="border-radius: 50%;" value="yes"><i class="fa fa-thumbs-up radio-options" id="dislike"></i></button><button type="button" class="btn btn-fb btns ml-3 " style="border-radius: 50%;" value="no"><i class="fa fa-thumbs-down radio-options" id="dislike"></i></button></div></div></div>';
				  }
				  
				  $('#ques').append(code);
			  }
		  });
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
<script>
	$('a[data-toggle="tab"]').on('show.bs.tab', function(){
		var val = $(this).attr("href");
		var studentid = <%=collegeid%>;
		console.log(studentid);
		if(val == "#answered_questions") {
			$.ajax({
				url: "voted",
				method: "post",
				data: {id:studentid},
				success: function(data) {
					console.log(data);
				}
			});
		}
	});
</script>
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
</html>