// JavaScript Document
$a=jQuery.noConflict(); 

$a(document).ready(function($) {  
  //LogOut confirm Button
  $("#btn_LogOut_id").on("click", function(e){
	e.preventDefault();		
	var LogOut_confirm_msg = 'Are you sure to logout ?';
	  $("#dialog").html(LogOut_confirm_msg);
	  $("#dialog").dialog("open");	  
  });
  $("#dialog").dialog({
	  autoOpen: false,
	  position: 'center',
	  resizable: false,
	  modal: true,
	  width: 325,
	  height: 175,
	  title: "Confirm log out....",
	  buttons: {
		"Yes, log me out" : function(){
		  $(this).dialog("close");
		  LogOutFunction(true);
		},
		"Dismiss": function() {
		  $(this).dialog("close");
		},
	  }
  });
  
  // Show Users  
  $('#btn_ShowUsers_id').on('click', function(e){
	  e.preventDefault();
	  jQuery.ajax({
		url: './Components/Authenticate.cfc',
		type: 'GET',
		data: {method: "GetAllUsers"},
		success: function(data, textStatus, xhr){		 
		  $('#ShowUsers_DIV').show('fast'); //Show Users Div
		  ColdFusion.navigate('./Views/Users.cfm','ShowUsers_DIV');	
		},
		error: function(xhr, textStatus, errorThrown){		
		  alert('Something went wrong, please contact IT.');  		  
		}
	  });
  });

  
  
});

//CALL FUNCTIONS
//Direct Login Page
LogOutFunction = function(value){	
  window.location.href="LogIn.cfm?wBack=2";  
};  