function hasClass(element, clsName) {
    return (' ' + element.className + ' ').indexOf(' ' + clsName + ' ') > -1;
}

function ToggleCollapse(element_id){
    console.log(element_id);
    var collapse = document.getElementById("collapse-section-" + element_id);
    var arrow = document.getElementById("collapse-arrow-" + element_id);

    if(hasClass(arrow, "collapse-arrow-up")){
        arrow.classList.remove("collapse-arrow-up");
        collapse.classList.add("collapse-section");
        collapse.classList.remove("visible-collapse-section");
    }
    else{
        arrow.classList.add("collapse-arrow-up");
        collapse.classList.remove("collapse-section")
        collapse.classList.add("visible-collapse-section");
        //random_article.scrollIntoView({behavior: "smooth"});
    }
}