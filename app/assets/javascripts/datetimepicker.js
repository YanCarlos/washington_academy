
$(document).on("turbolinks:load",function(){
	$('.datetimepicker').flatpickr({
		enableTime:      true,
    altInput:        true,
    minDate:         "today",
    altFormat:       "F j, Y at h:i K",
    dateFormat:      "Y-m-d H:i",
    defaultHour:     23,
    defaultMinute:   59,
    minuteIncrement: 1
	});
});
