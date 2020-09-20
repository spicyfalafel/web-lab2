const CANVAS_WIDTH = 300;
const CANVAS_HEIGHT = 300;
const CANVAS_R_VALUE = 120;
const DEFAULT_R_VALUE = 1;
const plot = $(".graphics svg");

function fromRToSvgX(x, r) {
    return x / r * CANVAS_R_VALUE + CANVAS_WIDTH / 2;
}

function fromRToSvgY(y, r) {
    return CANVAS_HEIGHT / 2 - y / r * CANVAS_R_VALUE;
}

function fromSvgToRX(x, r) {
    return r * (x - CANVAS_WIDTH / 2) / CANVAS_R_VALUE;
}

function fromSvgToRY(y, r) {
    return r * (CANVAS_HEIGHT / 2 - y) / CANVAS_R_VALUE;
}

function getRValue() {
    const rText = $("#r-value option:selected").text();
    let rValue = parseFloat(rText);
    // if there is answer page without form
    if (isNaN(rValue)) {
        rValue = parseFloat($(".table-row").last().find(">:nth-child(3)").text());
        // if somebody send get request to /controller then table will be empty
        if(isNaN(rValue)){
            rValue = DEFAULT_R_VALUE;
        }
    }
    return rValue;
}

function getUrlContext() {
    const link = document.location.href.split('/');
    return link[3];
}

function clickPlotHandler(e) {
    const offset = $(this).offset();
    const x = e.pageX - offset.left;
    const y = e.pageY - offset.top;
    const rValue = getRValue();

    const xValue = fromSvgToRX(x, rValue);
    const yValue = fromSvgToRY(y, rValue);

    $.ajax({
        type: "POST",
        url: "controller",
        data: {
            "x-value": xValue,
            "y-value": yValue,
            "r-value": rValue
        },
        success: function () {
            if (getUrlContext() !== "answer.jsp") {
                document.location.href = "answer.jsp";
            } else {
                document.location.reload();
            }

        }
    })
}

plot.click(clickPlotHandler);