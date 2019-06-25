$(document).ready(function () {

    var location = window.location.href.replace(/(\/#|\/|#)$/, '');

    var markup = '<tr role="row"><th></th><th><input type="text" id="first_name" placeholder="First Name"></th><th></th><th></th><th></th><th></th><th></th>' +
            '<th></th><th><input type="text" class="datepicker date-field" id="from-date" placeholder="Date added From"><input type="text" class="datepicker date-field" id="to-date" placeholder="Date added To"></th>' +
            '<th></th><th></th></tr>';
    $('#empTable thead').prepend(markup);
    //$('#empTable thead tr').clone(true).prependTo( '#empTable thead' );	
    $(".datepicker").datepicker({
        dateFormat: "yy-mm-dd"
    });


    $('#first_name').on('keyup change', function () {
        if (table.column(1).search() !== this.value) {
            if (this.value.length >= 3) {
                table.column(1).search(this.value).draw();
            }
            if (this.value == "") {
                table.column(1).search("").draw();
            }

        }
    });


    $('input.date-field', this).on('keyup change', function () {
        var fromDateValue = $("#from-date").val();
        var toDateValue = $("#to-date").val();

        if (fromDateValue !== "" && toDateValue !== "") {

            if (new Date(toDateValue) < new Date(fromDateValue))
            {
                alert("To Date should be greater than or equal to from Date");
                return false;
            }
            table.column(8).search(fromDateValue).draw();
            table.column(9).search(toDateValue).draw();
        }
    });





    var table = $('#empTable').DataTable({
        "dom": '<"top"f>rt<"bottom"ilp><"clear">',
        'processing': true,
        "responsive": true,
        'serverSide': true,
        'serverMethod': 'post',
        'ajax': {
            'url': location
        },
        'columns': [
            {data: 'student_id'},
            {data: 'student_first_name'},
            {data: 'student_last_name'},
            {data: 'student_email'},
            {data: 'student_dob'},
            {data: 'student_class'},
            {data: 'student_guardian_name'},
            {data: 'student_phone'},
            {data: 'added_date'},
            {data: 'student_joined'},
            {data: 'updated_date'},
            {data: 'update', name: 'action', orderable: false, searchable: false},
            {data: 'delete', name: 'action', orderable: false, searchable: false},
        ]
    });

    $('#add_button').click(function () {
        $('#student_form')[0].reset();
        $('.modal-title').text("Add User");
        $('#action').val("Add");
        $('#operation').val("add");

    });

    $(document).on('submit', '#student_form', function (event) {
        event.preventDefault();
        var valid = true;
        $('form input[type="text"]').each(function () {
            if ($(this).val() == "") {
                console.log($(this));
                valid = false;

            }
        });

        if (valid && $('#email_state').val() == 1)
        {
            $.ajax({
                url: window.location + '/add',
                method: 'POST',
                data: new FormData(this),
                contentType: false,
                processData: false,
                success: function (data)
                {
                    if (data == 1)
                    {
                        $('#studentModal').modal('hide');
                        $('#student_form')[0].reset();
                        $('#studentModal').modal('hide');
                        showSuccesMsg();
                    }
                }
            });
        } else
        {
            alert("Please Fill All field  or Email need to be unique");
        }
    });


    $('#email').on('change blur', function () {
        var email = $(this).val();
        var student_id = $("#student_id").val();
        if (email == '') {
            return;
        }
        $.ajax({
            url: window.location + '/add',
            type: 'post',
            data: {
                'section': 'email_unique',
                'student_id': student_id,
                'email': email,
            },
            success: function (response) {
                if (response == '1') {
                    email_state = false;
                    $('#email_state').val(0);
                    $('#email').parent().addClass("form_error");
                    $('#email').siblings("span").text('Sorry... Email already taken');
                } else {
                    $('#email_state').val(1);
                    $('#email').parent().removeClass();
                    $('#email').parent().removeClass("form_success");
                    $('#email').siblings("span").text('');
                }
            }
        });
    });


    $(document).on('click', '.update', function () {
        var student_id = $(this).attr("id");
        $.ajax({
            url: window.location + '/add',
            method: "POST",
            data: {student_id: student_id, section: 'edit'},
            dataType: "json",
            success: function (data)
            {
                $('#email_state').val(1);
                $('#studentModal').modal('show');
                $('#first_name').val(data.student_first_name);
                $('#last_name').val(data.student_last_name);
                $('#email').val(data.student_email);
                $('#class').val(data.student_class);
                $('#dob').val(data.student_dob);
                $('#phone').val(data.student_phone);
                $('#guardian_name').val(data.student_guardian_name);
                $('#joined_year').val(data.student_joined);
                $('#added_date').val(data.added_date);
                $('.modal-title').text("Edit User");
                $('#student_id').val(student_id);
                $('#action').val("Update");
                $('#operation').val("update");
            }
        })
    });


    $(document).on('click', '.delete', function () {
        var student_id = $(this).attr("id");
        if (confirm("Are you sure you want to delete this?"))
        {

            $.ajax({
                url: window.location + '/delete',
                method: "POST",
                data: {id: student_id},
                success: function (data)
                {
                    if (data == 1)
                    {
                        showSuccesMsg();
                    }


                }
            });
        } else
        {
            return false;
        }
    });

    function showSuccesMsg()
    {
        $("#alert_message").show();
        table.ajax.reload();
        setTimeout(function () {
            $('#alert_message').fadeOut("slow");
        }, 5000);

    }
    function stripSlashes(site)
    {
        return site.replace(/\/$/, "");
    }


});


