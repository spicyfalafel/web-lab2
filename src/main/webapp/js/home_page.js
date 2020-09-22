function onSubmitClick(e) {
    e.preventDefault();
    if (checkX() && checkY() && checkR()) {
        let x = parseFloat(getXValue());
        let y = parseFloat(getYValue());
        let r = parseFloat(getRValue());
        writeErrorMessage("");

        // ajax submit
        $.ajax({
            type: "POST",
            url: "controller",
            data: {
                "x-value": x,
                "y-value": y,
                "r-value": r
            },
            success: function () {
                if (getUrlContext() !== "answer.jsp") {
                    document.location.href = "answer.jsp";
                } else {
                    document.location.reload();
                }
            }
        });
    }
}

$('.rainbow-button.hvr-grow').click(function () {
    $('.rainbow-button.hvr-grow').removeClass('active');
    $(this).addClass('active');
});


$('input[name="y-value"]').keyup(checkY);
$('input[name="r-value"]').keyup(checkR);

$('button[name=\"btn-submit\"]').on("click", onSubmitClick);

// handler enter key
// enter key code = 13
$("#data-form").keydown(function (event) {
    if (event.keyCode === 13) {
        event.preventDefault();
        $('button[name=\"btn-submit\"]').click();
    }
});

$('button[name="reset"]').click(function () {
    $('.rainbow-button.hvr-grow.active').removeClass("active");
    writeErrorMessage("");
});