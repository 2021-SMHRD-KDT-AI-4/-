const itemImgs = document.querySelectorAll(".likeResultListImg");
const itemLikes = document.querySelectorAll(".txtLike");
const itemHashs = document.querySelectorAll(".txtHash");

for(var i = 0; i < itemImgs.length; i++) { 
    itemImgs[i].addEventListener("click", selectItem);
   // itemImgs[i].onclick = selectItem;/
}

function selectItem() {
    document.getElementById('img0').className = 'likeResultListImg';
    document.getElementById('img1').className = 'likeResultListImg';
    document.getElementById('img2').className = 'likeResultListImg';
    document.getElementById('img3').className = 'likeResultListImg';
    document.getElementById('img4').className = 'likeResultListImg';
    document.getElementById('img5').className = 'likeResultListImg';
    this.classList.toggle("selectedItem");
    if (document.getElementById('img0').className == 'likeResultListImg selectedItem') {
        document.getElementById('resultImg').setAttribute("src", document.getElementById('img0').getAttribute('src'));
        document.getElementById('resultTxtLike').innerHTML = document.getElementById('txtLike0').innerHTML;
        document.getElementById('resultTxtHash').innerHTML = document.getElementById('txtHash0').innerHTML;
    }
    if (document.getElementById('img1').className == 'likeResultListImg selectedItem') {
        document.getElementById('resultImg').setAttribute("src", document.getElementById('img1').getAttribute('src'));
        document.getElementById('resultTxtLike').innerHTML = document.getElementById('txtLike1').innerHTML;
        document.getElementById('resultTxtHash').innerHTML = document.getElementById('txtHash1').innerHTML;
    }
    if (document.getElementById('img2').className == 'likeResultListImg selectedItem') {
        document.getElementById('resultImg').setAttribute("src", document.getElementById('img2').getAttribute('src'));
        document.getElementById('resultTxtLike').innerHTML = document.getElementById('txtLike2').innerHTML;
        document.getElementById('resultTxtHash').innerHTML = document.getElementById('txtHash2').innerHTML;
    }
    if (document.getElementById('img3').className == 'likeResultListImg selectedItem') {
        document.getElementById('resultImg').setAttribute("src", document.getElementById('img3').getAttribute('src'));
        document.getElementById('resultTxtLike').innerHTML = document.getElementById('txtLike3').innerHTML;
        document.getElementById('resultTxtHash').innerHTML = document.getElementById('txtHash3').innerHTML;
    }
    if (document.getElementById('img4').className == 'likeResultListImg selectedItem') {
        document.getElementById('resultImg').setAttribute("src", document.getElementById('img4').getAttribute('src'));
        document.getElementById('resultTxtLike').innerHTML = document.getElementById('txtLike4').innerHTML;
        document.getElementById('resultTxtHash').innerHTML = document.getElementById('txtHash4').innerHTML;
    }
    if (document.getElementById('img5').className == 'likeResultListImg selectedItem') {
        document.getElementById('resultImg').setAttribute("src", document.getElementById('img5').getAttribute('src'));
        document.getElementById('resultTxtLike').innerHTML = document.getElementById('txtLike5').innerHTML;
        document.getElementById('resultTxtHash').innerHTML = document.getElementById('txtHash5').innerHTML;
    }
   
}

