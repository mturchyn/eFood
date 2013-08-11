/**
 * Created with IntelliJ IDEA.
 * User: Artem
 * Date: 12.08.13
 * Time: 1:27
 * To change this template use File | Settings | File Templates.
 */



function changeWeek(increment) {
    var currentTime = new Date();
    var day = currentTime.getDay();
    var dayOfMonth;
    if (day) {
        dayOfMonth = currentTime.getDate() - day + 1;
    }
    else {
        dayOfMonth = currentTime.getDate() - 6;
    }
    var myDate=new Date();
    myDate.setDate(dayOfMonth+7*increment);
    $.ajax({
        url: 'menu/qqq',
        type: 'POST',
        dataType: 'json',
        data:{date:myDate.toDateString()},
        success: function (data, textStatus) {
            alert(data+" "+textStatus);
        },
        complete:function(){
            alert("qqq")
        }
    })
}