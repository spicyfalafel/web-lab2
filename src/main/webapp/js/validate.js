const X_INVALID_MESSAGE = "Select X value";
const Y_INVALID_MESSAGE = "Fix Y value";
const R_INVALID_MESSAGE = "Fix R value";
const Y_MAX_VALUE = 5;
const Y_MIN_VALUE = -3;
const R_MAX_VALUE = 5;
const R_MIN_VALUE = 2;
const Y_ELEMENT = $('input[name="y-value"]');
const R_ELEMENT = $('input[name="r-value"]');


function checkInput(min, max, element) {
    let text = element.val().replace(",", ".");
    element.val(text);
    let val = parseFloat(text);
    if (/^(-?\d+)(\.\d+)?$/.test(text) && val >= min && val <= max) {
        $(element).css("border-color", "green");
        return true;
    } else {
        $(element).css("border-color", "red");
        return false;
    }
}

function checkY() {
    if (!checkInput(Y_MIN_VALUE, Y_MAX_VALUE, Y_ELEMENT)) {
        writeErrorMessage(Y_INVALID_MESSAGE);
        return false;
    }
    writeErrorMessage("");
    return true;
}

function checkX() {
    if ($('.rainbow-button.active').val() === undefined) {
        writeErrorMessage(X_INVALID_MESSAGE);
        return false;
    } else {
        return true;
    }
}

function writeErrorMessage(message) {
    $("#error-log").html(message);
}

function checkR() {
    if (!checkInput(R_MIN_VALUE, R_MAX_VALUE, R_ELEMENT)) {
        writeErrorMessage(R_INVALID_MESSAGE);
        return false;
    }
    writeErrorMessage("");
    return true;
}
