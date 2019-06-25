<?php

namespace App\Controllers;

use \Core\View;
use \App\Models\StudentModel;


/**
 * Student controller
 */
class Student extends \Core\Controller
{

    const ROW_PER_PAGE = 10;
	const EMAIL_UNIQUE = "email_unique";
	const ACTION_ADD = "add";
	const ACTION_EDIT = "edit";
	const ACTION_UPDATE = "update";
	
	
    /**
     * Show Index Page List with search,sort,pagination    
     * @return list
     */
    public function indexAction()
    {
		$student= new StudentModel();
		
		if(!empty($_POST))
		{
			$searchArray = [];
			## Read value
			$draw = $_POST['draw'];
			$params['start'] = $_POST['start'];
			$params['limit'] =  !empty($_POST['length'])?$_POST['length']:self::ROW_PER_PAGE ;// Rows display per page
			$columnIndex = trim($_POST['order'][0]['column']); // Column index
			$params['sortBy'] = trim($_POST['columns'][$columnIndex]['data']); // Column name
			$params['sortOrder'] = trim($_POST['order'][0]['dir']); // asc or desc
			$searchValue = trim($_POST['search']['value']); // Search value
			
			## Gobal Search 
			$searchQuery = " ";
			if($searchValue != ''){
			   $searchQuery = " AND (student_first_name LIKE :first_name or 
					student_email LIKE :email OR 
					student_last_name LIKE :last_name ) ";
			   $searchArray = array( 
					'first_name'=>"%$searchValue%", 
					'email'=>"%$searchValue%", 
					'last_name'=>"%$searchValue%" 
			   );
			}
		
		    ## Column Search
			$searchByName=trim($_POST['columns'][1]['search']['value']);
			$searchDateFrom=trim($_POST['columns'][8]['search']['value']);
			$searchDateTo=trim($_POST['columns'][9]['search']['value']);
			if(!empty($searchByName))
			{
				$searchQuery .= " AND (student_first_name LIKE :searchName)";
				$searchArray['searchName']="$searchByName%";
			}
			if(!empty($searchDateFrom))
			{
				$searchQuery .= " AND (added_date>=:searchDateFrom)";
				$searchArray['searchDateFrom']=$searchDateFrom;
			}
			if(!empty($searchDateTo))
			{
				$searchQuery .= " AND (added_date<=:searchDateTo)";
				$searchArray['searchDateTo']=$searchDateTo;
			}

			## Total number of records without filtering			
			$totalRecords = $student->getCount();
			
			## Total number of records with filtering
			$totalRecordwithFilter=$student->getCount($searchQuery,$searchArray);	

			## Fetch records			
			$userRecords=$student->getAll($searchQuery,$searchArray,$params);
			
			## Response
			$response = array(
			   "draw" => intval($draw),
			   "iTotalRecords" => $totalRecords,
			   "iTotalDisplayRecords" => $totalRecordwithFilter,
			   "aaData" => $userRecords
			);
			echo json_encode($response);
			
		}
		else
		{		
			View::render('Home/index.php');
		}
    }
	
	/**
     * Add/Edit/Update Action    
     * Parameters:
	 * @section - Email Check/Edit
	 * @operation- insert/update	 * 
     * @return  boolean true if insert success, false otherwise.
     */
	public function addAction()
    {
		$student= new StudentModel();
		
		## Email Address Already Exists
		if(!empty($_POST['section']) && $_POST["section"]==self::EMAIL_UNIQUE)
		{
			$student_id=!empty($_POST['student_id'])?trim($_POST['student_id']):'';
			echo StudentModel::isEmailExist(trim($_POST['email']),$student_id);
						
		}
		## Add Students
		elseif(!empty($_POST['operation']) && $_POST["operation"]==self::ACTION_ADD)
		{
				echo $student->insertData($_POST);	
				
		}
		## Get Student Details By studentID
		elseif(!empty($_POST['section']) && $_POST["section"]==self::ACTION_EDIT)
		{
			
				$student_id=($_POST["student_id"])?trim($_POST["student_id"]):'';
				$results=$student->fetchOne($student_id);
				echo json_encode($results);
		}
		## Update Student
		elseif(!empty($_POST['operation']) && $_POST["operation"]==self::ACTION_UPDATE)
		{
			echo StudentModel::updateData($_POST['student_id'],$_POST);			
		}
    }
	
	/**
     * Delete Action    
     * Parameters:
	 * @id -StudentID	 * 
     * @return  boolean true if delete success, false otherwise.
     */
	
	public function deleteAction()
    {
		if(!empty($_POST['id']))
			{
				echo $userRecords=StudentModel::deleteData(trim($_POST['id']));              
			}
    }
}
