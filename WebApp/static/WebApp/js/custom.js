function hasClass(element, clsName) {
    return (' ' + element.className + ' ').indexOf(' ' + clsName + ' ') > -1;
}

function ToggleCollapse(element_id){
    console.log(element_id);
    var collapse = document.getElementById("collapse-section-" + element_id);
    var arrow = document.getElementById("collapse-arrow-" + element_id);

    if(hasClass(arrow, "collapse-arrow-up")){
        arrow.classList.remove("collapse-arrow-up");
        collapse.classList.remove("d-flex");
        collapse.classList.add("d-none");
    }
    else{
        
        arrow.classList.add("collapse-arrow-up");
        collapse.classList.remove("d-none");
        collapse.classList.add("d-flex");
    }
}
function OpenModal(id){
    console.log(images);
    imgId = parseInt(id);
    current_img = images[id];
    document.getElementById("modal-title").innerHTML = current_img.title;
    document.getElementById("modal-content").innerHTML = current_img.content;
    document.getElementById("modal-img").src = current_img.url;

}