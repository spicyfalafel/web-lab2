function onSubmitClick(e) {
    e.preventDefault();
    if (checkX() && checkY() && checkR()) {
        writeErrorMessage("");
        document.getElementById("data-form").submit();
    }
}

$("#y-value").keyup(checkYInput);

$('button[name=\"btn-submit\"]').on("click", onSubmitClick);

// handler enter key
$("#data-form").keydown(function (event){
    // enter key code = 13
    if(event.keyCode === 13){
        event.preventDefault();
        $('button[name=\"btn-submit\"]').click();
    }
});