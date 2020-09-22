const CANVAS_WIDTH = 300;
const CANVAS_HEIGHT = 300;
const CANVAS_R_VALUE = 120;
const DEFAULT_R_VALUE = 2;
const plot = $(".graphics svg");
/*
TODO
Test it
 */

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
    const rText = $('input[name="r-value"]').val();
    let rValue = parseFloat(rText);

    // if there is answer page without form
    if (rText === undefined) {
        rValue = parseFloat($(".table-row").first().find(">:nth-child(3)").text());
        // if somebody send get request to /controller then table will be empty
        if(isNaN(rValue)){
            rValue = DEFAULT_R_VALUE;
        }
    } else {
        if(!checkR()){
            return null;
        }
    }
    return rValue;
}

function getYValue() {
    return $('input[name ="y-value"]').val();
}

function getXValue(){
    return $('.rainbow-button.hvr-grow.active').text();
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

    if(rValue!==null) {
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
}

plot.click(clickPlotHandler);
