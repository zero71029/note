//顯示新增單字
function newWord() {
    var modal = document.getElementsByClassName("modal")[0];
    modal.style.visibility = "visible";
}
//關閉新增單字
//關閉新增單字庫
function bClose(){
    var modal = document.getElementsByClassName("modal")[0];
    modal.style.visibility = "hidden";
    var PaModal = document.getElementsByClassName("PaModal")[0];
    PaModal.style.visibility = "hidden";

}
//顯示新增單字庫
function CreatePackage() {
    var PaModal = document.getElementsByClassName("PaModal")[0];
    PaModal.style.visibility = "visible";

}
