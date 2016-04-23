
$(document).on("page:change", function() {


	$("#payed_number_field").keyup(function() {

		total = parseFloat($("#total").html().replace('€', ''));
		payed = parseFloat($(this).val());

		refund = payed - total
		
		if (refund != NaN && refund >= 0) {
			$("#refund").html("€" + (payed - total));
		}
	});

	
});
