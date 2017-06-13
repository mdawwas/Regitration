$(document).ready(function() {
     $('#datatable').dataTable();

    $("[data-toggle=tooltip]").tooltip();

});

function doIt(secId,stId) {
    var newGrade = prompt('Enter the new mark');
    if(newGrade === "" || isNaN(newGrade))
        alert("You should enter a number");
    else if(newGrade > 100 || newGrade < 0)
        alert("Enter a grade from 0-100")
    else{
        $.ajax({
            type: 'POST',
            url: "/editgrade",
            data: {sectionId: secId, studentId: stId, grade: newGrade},
            success: function (result) {
                location.reload();
            }
        });
    }
}



