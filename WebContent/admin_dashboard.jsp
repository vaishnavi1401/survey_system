<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%	String collegeid = "", name = "";
	collegeid = (String)request.getSession().getAttribute("collegeid");
%>

<%  if(collegeid == null) {
		response.sendRedirect("http://localhost:8080/MiniProject/index.html");
	}
	else {
		name = (String)request.getSession().getAttribute("name");
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
              <a href="./examples/profile.html" class="dropdown-item">
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
              <ul class="nav nav-pills">
                  <li class="active col-xl-3 col-lg-6">
                    <a data-toggle="tab" href="#post_question">
                      <div class="card card-stats mb-4 mb-xl-0">
                          <div class="card-body">
                            <div class="row">
                              <div class="col">
                                <h5 class="card-title text-uppercase mb-0">Post a Question</h5>
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

                  <li class="col-xl-3 col-lg-6">
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
                  <li class="col-xl-3 col-lg-6">
                    <a data-toggle="tab" href="#view_archived_questions">
                        <div class="card card-stats mb-4 mb-xl-0">
                            <div class="card-body">
                              <div class="row">
                                <div class="col">
                                  <h5 class="card-title text-uppercase mb-0">Archived Questions</h5>
                                </div>
                                <div class="col-auto">
                                  <div class="icon icon-shape bg-yellow text-white rounded-circle shadow">
                                    <i class="fas fa-archive"></i>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                    </a>
                  </li>
                  <li class="col-xl-3 col-lg-6">
                    <a data-toggle="tab" href="#menu3">
                        <div class="card card-stats mb-4 mb-xl-0">
                            <div class="card-body">
                              <div class="row">
                                <div class="col">
                                  <h5 class="card-title text-uppercase mb-0">Random</h5>
                                </div>
                                <div class="col-auto">
                                  <div class="icon icon-shape bg-info text-white rounded-circle shadow">
                                    <i class="fas fa-percent"></i>
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
    <!-- End of Header -->

    <div class="container-fluid mt--7 ">
      <div class="card">
        <div class="card-body">
          <div class="tab-content">
              <!-- Post a Question -->
              <div id="post_question" class="tab-pane fade in active">
                  <form action="post_question" method="post">
                    <div class="row">
                        <div class="col-md-2">
                            <h3>Question</h3>
                        </div>
                      <div class="col-md-8">
                        <div class="form-group">
                          <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Question" name="question" required>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-2">
                          <h3>Category</h3>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group">
                          <select class="form-control" name="category" id="category" required>
                              <option value="category" selected disabled>Select Category</option>
                              <option value="Academics">Academic</option>
                              <option value="Curriculum">Curriculum</option>
                              <option value="Administration">Administration</option>
                              <option value="Infrastructure">Infrastructure</option>
                              <option value="Workshop">Workshop</option>
                              <option value="Project">Project</option>
                              <option value="Sports">Sports</option>
                              <option value="Exams">Exams</option>
                              <option value="Registration">Registration</option>
                              <option value="Fees">Fees</option>
                              <option value="Transport">Transport</option>
                              <option value="Faculty">Faculty</option>
                              <option value="Others">Others</option>    
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-2">
                          <h3>Set Audience</h3>
                      </div>
                      <!-- Course -->
                      <div class="col-md-3">
                        <div class="form-group">
                            <select class="form-control" name="course" id="course" required>
                                <option value="category" selected disabled>Course</option>
                                <option value="BTECH">B.Tech</option>
                                <option value="BSC">BSc.</option>
                                <option value="BCA">BCA</option>
                                <option value="BBA">BBA</option>
                                <option value="BCOM">B.Com</option>
                                <option value="BHM">B.HM</option>
                                <option value="BA">BA</option>
                                <option value="MTECH">M.Tech</option>
                                <option value="MSC">Msc.</option>
                                <option value="MCA">MCA</option>
                                <option value="MBA">MBA</option>
                                <option value="MHM">M.HM</option>
                                <option value="PHD">PhD</option>
                                <option value="All">All</option>
                            </select>
                        </div>
                      </div>

                      <!-- Branch -->
                      <div class="col-md-3">
                        <div class="form-group">
                            <select class="form-control" name="branch" id="branch" required>
                                <option value="category" selected disabled>Branch</option>
                                <option value="CSE">COMPUTER SCIENCE AND ENGINEERING (CSE)</option>
                                <option value="IT">INFORMATION TECHNOLOGY</option>
                                <option value="ECE">ELECTRONICS AND COMMUNICATION ENGINEERING</option>
                                <option value="EE">ELECTRICAL ENGINEERING</option>
                                <option value="ME">MECHANICAL ENGINEERING</option>
                                <option value="BIOTECH"> BIOTECHNOLOGY</option>
                                <option value="CIVIL">CIVIL ENGINEERING</option>
                                <option value="PE">PETROLEUM ENGINEERING</option>
                                <option value="BCOM">B.Com</option>
                                <option value="BBA">BBA</option>
                                <option value="HM">HOSPITALITY MANAGEMENT</option>
                                <option value="FOODTECH">FOOD TECHNOLOGY</option>
                                <option value="MICROBIO">MICROBIOLOGY</option>
                                <option value="EVS">ENVIRONMENTAL SCIENCE</option>
                                <option value="ECONOMIC">ECONOMICS (HONS.)</option>
                                <option value="PSYCHOLOGY">PSYCHOLOGY (HONS.)</option>
                                <option value="POLITICAL-SCIENCE">POLITICAL SCIENCE (HONS.)</option>
                                <option value="ENGLISH">ENGLISH</option>
                                <option value="All">All</option>
                            </select>
                        </div>
                      </div>
                    
                        <!-- Semester -->
                        <div class="col-md-3">
                            <div class="form-group">
                                <select class="form-control" name="semester" id="semester" required>
                                    <option value="category" selected disabled>Semester</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="All">All</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group mt-3" style="margin-left: auto;margin-right: auto;">
                            <button type="submit" class="btn btn-success" style="width:15vw">Post</button>
                        </div>
                    </div>
                  </form>
              </div>
              <!-- End of Post a Question -->

              <!-- View all Question -->
              <div id="view_question" class="tab-pane fade">
                <table class="table table-hover table-bordered">
                  <tbody id="ques"></tbody>
                </table>
              </div>
              <!-- End of View all Question -->

               <!-- Archived Questions -->
               <div id="view_archived_questions" class="tab-pane fade">
                  <table class="table table-hover table-bordered">
	                <tbody id="archive"></tbody>
	              </table>
              </div>
              <!-- End of Archived Questions -->
          </div>

        </div>
      </div>
      
      <!-- The Modal -->
	<div class="modal" id="edit_question">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Edit Question</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      
		  	<!-- Modal body -->
		      <div class="modal-body">
		      	<div class="form-group">
		      		<input type="text" class="form-control" id="question">
		      		<input type="text" class="form-control" id="ques_id" style="display:none">
		      	</div>
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
		        <button type="button" class="btn btn-success save">Save</button>
		      </div>
	
	    </div>
	  </div>
	</div>
	<!-- End of Modal -->
     
      <!-- Footer -->
      <footer class="footer">
          <div class="row align-items-center justify-content-xl-end" style="margin-left: auto;">
              <div class="copyright text-center text-xl-left text-muted">
                &copy; 2019 <a href="" class="font-weight-bold ml-1" target="_blank">Agrima</a>
                <a href="" class="font-weight-bold ml-1" target="_blank">Vaishnavi</a>
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
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
  
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  
  <script type="text/javascript">
                  $('a[data-toggle="tab"]').on('shown.bs.tab', function () {
                  var target = $(this).attr("href") // activated tab
                  if(target == "#view_question") {
                    $.ajax({
                      url: 'view_questions',
                      method: 'post',
                      success: function(data) {
                        var arr = new Array();
                        var i;
                        var ques,id,pos;
                        arr = data.split("|");
                        var code = "";
                        $('#ques tr').remove();
                        
                        for(i=0; i<arr.length;i++) {
                          pos = arr[i].indexOf('-');
                          id = arr[i].substr(0,pos);
                          ques = arr[i].substr(pos+1,arr[i].length);
                          code = code +"<tr><td><h4>"+ ques + "</h4></td><td  style='width:10vw'><button class='btn btn-info edit' type='button' id='"+id+"' onclick='edit(id)'><span class='fa fa-edit'></span></button></td>";
                        }
                        code = code + "</tr>";
                        $('#ques').append(code);
                      }
                    });
                  }
                  else if(target == "#view_archived_questions") {
                	  $.ajax({
                		  url: "view_archived_questions",
                		  method: "post",
                		  success: function(data) {
                		  	
                			  var arr = new Array();
                			  arr = JSON.parse(data);
                			  var len = Object.keys(arr).length;
                              var i;
                              var code = "";
                              $('#archive tr').remove();
                              
                              for(i=0; i<len;i++) {
                                var id = arr[i]["id"];
                                var ques = arr[i]["question"];
                                var date = arr[i]["date"];
                                var course = arr[i]["course"];
                                var branch = arr[i]["branch"];
                                var semester = arr[i]["semester"];
                                code = code +"<tr><td><h4>"+ ques + "</h4></td><td><h4>"+course+"</h4></td><td><h4>"+branch+"</h4></td><td><h4>"+semester+"</h4></td><td><h4>"+date+"</h4></td>";
                              }
                              code = code + "</tr>";
                              $('#archive').append(code);
                		  }
                	  });
                  }
                });
</script>
<script>
	function edit(id) {
		$('#edit_question').modal("show");
		$.ajax({
			url: 'edit_question',
			method: 'post',
			data: {request:'view',qid:id},
			success: function(data) {
				$('#question').val(data);
				$('#ques_id').val(id);
			}
		});
	}
	
	$('.save').click(function() {
		var id = $('#ques_id').val();
		var ques = $('#question').val();
		$.ajax({
			url: 'edit_question',
			method: 'post',
			data: {request:'edit',qid:id,question:ques},
			success: function(data) {
				console.log(data);
				$('#edit_question').modal("toggle");
				swal("Success", "Question Updated successfuly", "success");
				setTimeout(function() {
					location.reload("true");
				}, 2500);
			}
		});
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
<script>
	$(document).ready(function() {
		var url = new URL(window.location.href);
		var params = url.searchParams.get("Success");
		if(params == "QuestionPostedSuccessfully") {
			swal("Success", "You've successfully posted the question", "success");
		}
		var params = url.searchParams.get("Error");
		if(params == "ErrorPostingQuestion") {
			swal("Error", "There was an error posting the question", "error");
		}
	});
</script>
</body>

</html>