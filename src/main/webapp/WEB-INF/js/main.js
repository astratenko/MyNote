$(document).ready(function () {
    //Скрыть PopUp при загрузке страницы
    PopUpHide();
});
//Функция отображения PopUp
function PopUpShow() {
    $("#popup1").show();
}
//Функция скрытия PopUp
function PopUpHide() {
    $("#popup1").hide();
}


/*Ajax*/
$(document).ready(function() {
    $("#notesFullTextDiv").click(function(){
        send();
    });
});

function send(){
    $.ajax({
        url:"/getFullNoteText",
        data : ({name : $('#noteId').val()}),
        success : function(data){
            $('#notesFullTextDiv').html(data);
        },
        error : function(data){
            console.log("error: "+data);
        }
    });
}

