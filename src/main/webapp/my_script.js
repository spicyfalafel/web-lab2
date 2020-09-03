
const GRAPH_WIDTH = 300;
const GRAPH_HEIGHT = 300;
const R_PIXELS_ON_GRAPH = 70;

let X_VALUES = [-3, -2, -1, 0, 1, 2, 3, 4, 5];
let R_VALUES = [1, 1.5, 2, 2.5, 3];

const yTextField = document.getElementById("y-text");
const error = document.getElementById('value-validate-text');
var yIsOk = false;
yTextField.addEventListener("input", function (event) {
    const yStr = this.value.replace(",", ".");
    if (!isNaN(yStr)) {
        if (numberIsInInterval(yStr, -5, 5)) {
            error.innerText = "OK"
            error.style.color = "green"
            yIsOk=true;
        } else {
            error.innerText = "Not correct value: must be in [-5;5]"
            error.style.color = "red";
            yIsOk=false;
        }
    } else {
        error.innerText = "Please enter number only"
        error.style.color = "red";
        yIsOk=false;
    }
})


function numberIsInInterval(num, min, max) {
    return min <= num && num <= max;
}


function calculateX(x, r){
    return x / r * R_PIXELS_ON_GRAPH + GRAPH_WIDTH / 2;
}
function calculateY(y, r) {
    return GRAPH_HEIGHT/ 2 - y / r * R_PIXELS_ON_GRAPH;
}

const clearButt = document.getElementById("clear-button");
clearButt.addEventListener('click', function (e) {
    e.preventDefault();
})


$("input:checkbox").click(function () {
    var group = "input:checkbox[name='" + $(this).prop("name") + "']";
    $(group).prop("checked", false);
    $(this).prop("checked", true);
}).on("change", e=>{
    changePoint();
});

yTextField.addEventListener('change', e => {
    changePoint();
})

$("input:radio").on("change", e =>{
   changePoint();
});

function changePoint() {
    let point = $("#point");
    var formData = new FormData(document.getElementById("coordinates-form"));
    const x = formData.get("x"), y = formData.get("y").replace(',', '.'), r = formData.get("r");
    const xGraph = calculateX(x, r), yGraph = calculateY(y, r);
    point.attr({
        cx: xGraph,
        cy: yGraph,
        visibility: "visible"
    });
}