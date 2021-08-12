// 11. 畫面準備好以後才開始執行
$(function () {
    btnGet.onclick = function () {

        // // 20. 取得 姓名欄位 (使用 JavaScript 的方式)
        // var js = document.getElementById('userName').value;
        // console.log(js);

        // // 21. 取得 姓名欄位 (使用 jQuery 的方式)
        // var jq = $('#userName').prop('value');
        // console.log(jq);

        // var jq_v2 = $('#userName').val();
        // console.log(jq_v2);


        // 30. 取得 地址欄位 (使用 JavaScript 的方式)
        // 31. 取得 地址欄位 (使用 jQuery 的方式)
        var js = document.getElementById('address').value;
        var jq = $('#address').val();
        console.log(js);
        console.log(jq);

        // 40. 取得 年紀欄位 (使用 JavaScript 的方式)
        // 41. 取得 年紀欄位 (使用 jQuery 的方式) 
        var list = document.getElementsByName('age');
        for (var i = 0; i < list.length; i++) {
            // console.log(list[i].checked);
            if(list[i].checked){
                console.log(list[i].value);
            }
        }
        var jq = $('input[name="age"]:checked').val();
        console.log(jq);
    }
})



