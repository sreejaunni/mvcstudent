<?php

namespace App\Models;

use PDO;

/**
 * $Id: StudentModel.php, v 1.0 2019/06/22
 *
 * PHP version 7.0
 */
class StudentModel extends \Core\Model
{

    public $db;
	
	public function __construct()
    {
        $this->db = static::getDB();
    }
	
    /**
     * Get all the students as an associative array
     * Parameters:
	 * @searchQuery - Search Query
	 * @searchArray - Search Query Params to bind
	 * @params - Extra params for sort & limit
     * @return array
     */
    public function getAll($searchQuery='',$searchArray,$params=[])
    {
		
		 $query="SELECT * FROM student WHERE 1 ".$searchQuery." 
				ORDER BY ".$params['sortBy']." ".$params['sortOrder'].
				" LIMIT ".$params['start'].",".$params['limit'];       		
		$stmt = $this->db->prepare($query);
		
		// Bind values
		if(!empty($searchArray))
		{
			foreach($searchArray as $key=>$search){
			   $stmt->bindValue(':'.$key, $search,PDO::PARAM_STR);
			}
		}
		$stmt->execute();
		$userRecords=$stmt->fetchAll(PDO::FETCH_ASSOC);
		$data = array();

			foreach($userRecords as $row){
			   $data[] = array(
			    "student_id"=>$row['student_id'],
				"student_first_name"=>$row['student_first_name'],
				"student_last_name"=>$row['student_last_name'],
				"student_dob"=>$row['student_dob'],
				"student_email"=>$row['student_email'],
				"student_class"=>$row['student_class'],
				"student_guardian_name"=>$row['student_guardian_name'],
				"student_phone"=>$row['student_phone'],
				"student_joined"=>$row['student_joined'],
				"added_date"=>$row['added_date'],
				"updated_date"=>$row['updated_date'],
				"update"=>'<button type="button" name="update" id="'.$row["student_id"].'" class="btn btn-warning btn-xs update">Update</button>',
				"delete"=>'<button type="button"  class="btn btn-danger btn-xs delete" id="'.$row["student_id"].'">Delete</button>',
			   );
			}	
			return $data;
    }
	
	/**
     * Get results as an associative array by query
     * Parameters:
	 * @query - Query	
     * @return array
     */	
	public function getData($query)
    {
		try
		{       
			$stmt =$this->db->query($query);
			return $stmt->fetch(PDO::FETCH_ASSOC);
		}			
		catch (\PDOException $e) {					
			return false;
		}
    }
	
	/**
     * Get student Data as an associative array by ID
     * Parameters:
	 * @id - studentID
     * @return array
     */	
	public function fetchOne($id='')
    {
		try
		{
			if(!empty($id))
			{
				$values['student_id']=trim($id);
				$query="SELECT *  FROM student WHERE  student_id=:student_id";			
				$stmt =  $this->db->prepare($query);
				$stmt->execute($values);
				$results= $stmt->fetch(PDO::FETCH_ASSOC);
				return (!empty($results))?$results:[];
			}
			return false;
		}			
		catch (\PDOException $e) {					
			return false;
		}
		
    }
	
	/**
     * Get Users Count by Search Criteria
     * Parameters:
	 * @searchQuery- searchQuery
	 * @values- Query Bind Params 
     * @return array
     */	
	public function getCount($searchQuery='',$values=[])
    {
		
		try
		{
			$query="SELECT COUNT(*) AS allcount FROM student WHERE 1 ".$searchQuery;			
			$stmt =  $this->db->prepare($query);
			$stmt->execute($values);		
			return $stmt->fetchColumn();
		}			
		catch (\PDOException $e) {					
			return false;
		}
    }
	
	/**
     * Check Email Exist in DB
     * Parameters:
	 * @email- email
	 * @student_id- studentID 
     * @return  boolean true if Email already exists, false otherwise.
     */	
	public static function isEmailExist($email='',$student_id='')
    {	
		$db = static::getDB();
		if(!empty($email))
		{
			$query='SELECT count(*) FROM student WHERE student_email =:email';
			$query.=(!empty($student_id))? " AND student_id!='".$student_id."'" :'';
			$data['email']=$email;
			$stmt = $db->prepare($query);
			$stmt->execute($data);
			$count=$stmt->fetchColumn();
			return ($count>0)?true:false;
		}		
		return false;
		
    }
	
	/**
     * Insert Student Data to DB
     * Parameters:
	 * @data- Student details	 
     * @return  boolean true if insert success, false otherwise.
     */	
	
	public function insertData($data)
	{		 
		try
		{
			if(!empty($data))
			{
					$values["student_first_name"]=!empty($data['first_name'])?trim($data['first_name']):'';
					$values["student_last_name"]=!empty($data['last_name'])?trim($data['last_name']):'';
					$values["student_dob"]=!empty($data['dob'])?trim($data['dob']):'';
					$values["student_email"]=!empty($data['email'])?trim($data['email']):'';
					$values["student_class"]=!empty($data['class'])?trim($data['class']):'';
					$values["student_guardian_name"]=!empty($data['guardian_name'])?trim($data['guardian_name']):'';
					$values["student_phone"]=!empty($data['phone'])?trim($data['phone']):'';
					$values["student_joined"]=!empty($data['joined_year'])?trim($data['joined_year']):'';
					$values["added_date"]=!empty($data['added_date'])?trim($data['added_date']):'';
					
					$stmt = $this->db->prepare('INSERT INTO 
														student(student_first_name, student_last_name, student_dob,student_email,
														student_class,student_guardian_name,student_phone,student_joined,added_date)
											    VALUES
														(:student_first_name, :student_last_name, :student_dob,:student_email,
																  :student_class,:student_guardian_name,:student_phone,:student_joined,:added_date)'
													 );
					$stmt->execute($values);
					return ($stmt->rowCount()>0)? true : false;
			}
		}
		catch (\PDOException $e) {					
			return false;
		}
		
	}
	
	/**
     * Update Student Data by studentID
     * Parameters:
	 * @data- Student details
	 * @id- studentID		 
     * @return boolean true if update success, false otherwise.
     */	
	
	public static function updateData($id,$data)
	{	
		try
		{	
			$db = static::getDB();
			$values['student_id']=trim($id);
			$values["student_first_name"]=!empty($data['first_name'])?trim($data['first_name']):'';
			$values["student_last_name"]=!empty($data['last_name'])?trim($data['last_name']):'';
			$values["student_dob"]=!empty($data['dob'])?trim($data['dob']):'';
			$values["student_email"]=!empty($data['email'])?trim($data['email']):'';
			$values["student_class"]=!empty($data['class'])?trim($data['class']):'';
			$values["student_guardian_name"]=!empty($data['guardian_name'])?trim($data['guardian_name']):'';
			$values["student_phone"]=!empty($data['phone'])?trim($data['phone']):'';
			$values["student_joined"]=!empty($data['joined_year'])?trim($data['joined_year']):'';
			$values["added_date"]=!empty($data['added_date'])?trim($data['added_date']):'';		
			$sql = "UPDATE student SET student_first_name=:student_first_name,student_last_name=:student_last_name,
									 student_dob=:student_dob,student_email=:student_email,
									 student_class=:student_class,student_guardian_name=:student_guardian_name,student_phone=:student_phone,
									 student_joined=:student_joined,added_date=:added_date WHERE student_id=:student_id";
			$stmt = $db->prepare($sql);
			$stmt->execute($values);
			return true;
		}
		catch (\PDOException $e) {					
			return false;
		}
	}
	
	/**
     * Delete Student Data by studentID
     * Parameters:
	 * @data- Student details
	 * @id- studentID		 
     * @return boolean true if delete success, false otherwise.
     */
	public static function deleteData($id)
	{
		try
		{
			$db = static::getDB();
			$sql = 'DELETE FROM student '
					. 'WHERE student_id = :student_id';
			$stmt = $db->prepare($sql);
			$stmt->bindValue(':student_id', $id);
			$stmt->execute();
			return ($stmt->rowCount()>0)? true:false;
		}
		catch (\PDOException $e) {					
			return false;
		}
	}
}
