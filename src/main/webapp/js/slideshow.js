var slideIndex = 0;
let rotateAngle = 90;
let pixels = 100;
let widthOfWindow = window.innerWidth - 700;
let right = true;

carousel();

function rotate(image) {
    image.setAttribute("style", "transform: rotate(" + rotateAngle + "deg)");
    rotateAngle+=90;
}
function changePos(image){
    image.style.left = pixels + "px";
    if(pixels<0) {
        right = true;
    }
    if(pixels<widthOfWindow){
        if(right) {
            pixels += 100;
        }else {
            pixels -= 100;
        }
    }else{
        right = false;
        pixels -= 100;
    }
    console.log(pixels);
}


function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > x.length) {slideIndex = 1}

    rotate(x[slideIndex-1]);
    changePos(x[slideIndex-1]);


    x[slideIndex-1].style.display = "block";

    setTimeout(carousel, 150);
}

