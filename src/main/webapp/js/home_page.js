function onSubmitClick(e) {
    e.preventDefault();
    if (checkX() && checkY() && checkR()) {
        writeErrorMessage("");
        document.getElementById("data-form").submit();
    }
}

$('input[name="y-value"]').keyup(checkY);
$('input[name="r-value"]').keyup(checkR);

$('button[name=\"btn-submit\"]').on("click", onSubmitClick);

// handler enter key
// enter key code = 13
$("#data-form").keydown(function (event){
    if(event.keyCode === 13){
        event.preventDefault();
        $('button[name=\"btn-submit\"]').click();
    }
});