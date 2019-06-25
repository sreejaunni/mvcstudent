<!DOCTYPE html>
<html>
<head>
    <?php $root = trim(dirname(dirname($_SERVER['PHP_SELF'])), "/"); ?>
    <meta charset="UTF-8">
	<title>Students</title>		
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
	<link rel='stylesheet' href='/<?php echo $root?>/assets/css/jquery.dataTables.min.css'  type='text/css'>
	<link rel="stylesheet" href="/<?php echo $root?>/assets/css/style.css"  type='text/css'>
	<!-- jQuery Library -->  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<!-- Datatable JS -->
	<script src="/<?php echo $root?>/assets/js/jquery.dataTables.min.js"></script>
	<script src="/<?php echo $root?>/assets/js/student.js"></script>
</head>
<body>
	<div class="container-fluid">
		<h1 align="center">Add Edit Delete Datatables Records using PHP Ajax</h1>
		<br />
		<div class="table-responsive">
		<br />
		<div align="right">
			<button type="button" id="add_button" data-toggle="modal" data-target="#studentModal" class="btn btn-info btn-lg">Add</button>
		</div>
		<br />
		<div id="alert_message" class="alert alert-success" style="text-align:center;display:none">Success!</div>

		<table id='empTable' class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>First Name</th>
					<th>Last Name</th>      
					<th>Email</th>
					<th>DOB</th>
					<th>Class</th>
					<th>Guardian Name</th>
					<th>Phone</th>
					<th>Date Added</th>
					<th>Year Joined</th>	  
					<th>Updated</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
		</table>
		</div>
	</div>
</body>
</html>

<div id="studentModal" class="modal fade">
	<div class="modal-dialog">
		<form method="post" id="student_form" enctype="multipart/form-data">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add Student</h4>
				</div>
				<div class="modal-body">
					<div class="column">
						<label>First Name</label><span class="required">*</span>
						<input type="text" name="first_name" id="first_name" class="form-control" required />
					</div>

					<div class="column">
						<label>Last Name</label><span class="required">*</span>
						<input type="text" name="last_name" id="last_name" class="form-control" required />
					</div>
					<div class="column">
						<label>DOB</label><span class="required">*</span>
						<input type="text" name="dob" id="dob" class="form-control datepicker" required />
					</div>
					<div class="column">
						<label>Email</label><span class="required">*</span>
						<input type="email" name="email" id="email" class="form-control" required />
					</div>
					<div class="column">
						<label>Phone Number</label><span class="required">*</span>
						<input type='tel' name="phone" id="phone" class="form-control" required />
					</div>
					<div class="column">
						<label>Class</label><span class="required">*</span>
						<input type="text" name="class" id="class" class="form-control" required />
					</div>
					<div class="column">
						<label>Guardian Name</label><span class="required">*</span>
						<input type="text" name="guardian_name" id="guardian_name" class="form-control" required />
					</div>
					<div class="column">
						<label>Joined Year</label><span class="required">*</span>    
						<input name="joined_year" id="joined_year" class="form-control" type="number" min="1900" max="2019" step="1" value="2016" />
					</div>
					<div class="column">
						<label>Added Date</label><span class="required">*</span>
						<input type="text" name="added_date" id="added_date" class="form-control datepicker" required />
					</div>
				</div>
				<div class="modal-footer">
					<input type="hidden" name="student_id" id="student_id" />
					<input type="hidden" name="email_state" id="email_state" />
					<input type="hidden" name="operation" id="operation" />
					<input type="submit" name="action" id="action" class="btn btn-success" value="Add" />
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</form>
	</div>
</div>
