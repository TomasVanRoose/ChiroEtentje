

$( document ).ready(function() {


	// Function to add a table with the names corresponding to the table number 
	$("#number_field").keyup(function() {

		// Clear table
		$(".list-group").html('');

		// Loop over the values of table names and check if table equals the table number in the table field
		$("#hidden > *").each(function(index) {
			if ($(this).attr("table") == $("#number_field").val()) {
				$(".list-group").append('<a class="list-group-item">' + $(this).val() + '<a>');
			}

		});

		// When the user clicks a table value add it to the table name field
		$(".list-group-item").click(function() {
			$("#name_field").val($(this).html());
			$(".list-group").html('');
		});


	});

	
});
