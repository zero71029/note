$(function () {
    // 10. 練習設定初始值
    btnSet.onclick = function () {
        // 20. 將地址預設為台中
        // $('#address').prop('value', 'Hsinchu');
        // $('#address').val('Miaoli');

        // 30. 將職業預設為其他
        //$('input[value="other"]').prop('checked','checked');
        $('input[name="job"][value="other"]').prop('checked','checked');

        // 40. 將交通工具預設為機車
        $('input[name="vehicle"][value="motorcycle"]').prop('checked','checked');

    }
})

