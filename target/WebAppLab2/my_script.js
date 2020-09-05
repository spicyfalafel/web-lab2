
const GRAPH_WIDTH = 300;
const GRAPH_HEIGHT = 300;
const R_PIXELS_ON_GRAPH = 70;


const yTextField = document.getElementById("y-text");
const error = document.getElementById('value-validate-text');
let yIsOk = false;

yTextField.addEventListener("input", function (event) {
    const yStr = this.value.replace(",", ".");
    if (!isNaN(yStr)) {
        if (numberIsInInterval(yStr, -5, 5)) {
            error.innerText = "OK"
            error.style.color = "green"
            yIsOk=true;
            $("#submit-button").show();
        } else {
            error.innerText = "Not correct value: must be in [-5;5]"
            error.style.color = "red";
            yIsOk=false;
            $("#submit-button").hide();
        }
    } else {
        error.innerText = "Please enter number only"
        error.style.color = "red";
        yIsOk=false;
        $("#submit-button").hide();
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


$("input:checkbox").click(function () {
    const group = "input:checkbox[name='" + $(this).prop("name") + "']";
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
    const formData = new FormData(document.getElementById("coordinates-form"));
    const x = formData.get("x"), y = formData.get("y").replace(',', '.'), r = formData.get("r");
    const xGraph = calculateX(x, r), yGraph = calculateY(y, r);
    point.attr({
        cx: xGraph,
        cy: yGraph,
        visibility: "visible"
    });
}



$("#graph").click(evt => {
    const e = evt.target;
    const dim = e.getBoundingClientRect();
    const x = evt.clientX - dim.left;
    const y = evt.clientY - dim.top;
    alert("x: "+x+" y:"+y+"\n" +
        "x: "+toGraphX(x)+" y:"+toGraphY(y));
})

function toGraphX(x) {
    return x - GRAPH_WIDTH/2;
}

function toGraphY(y) {
    return y + GRAPH_HEIGHT/2;
}


