/**
 * Created with IntelliJ IDEA.
 * User: Artem
 * Date: 12.08.13
 * Time: 1:27
 * To change this template use File | Settings | File Templates.
 */



function changeWeek(e, increment) {
    var event=e||window.event;
    var target=event.target||event.srcElement;
//    alert(target.id);
    event=null;
    if (target.id == "go_right") {
//        alert("aaa");
        increment++;
        document.getElementById("go_right").onclick = function () {
            changeWeek(event,increment);
        };
        document.getElementById("go_left").onclick = function () {
            changeWeek(event,increment);
        };

    } else {
        increment--;
        document.getElementById("go_right").onclick = function () {
            changeWeek(event,increment);
        };
        document.getElementById("go_left").onclick = function () {
            changeWeek(event,increment);
        };
    }
//    -1 1 ->19
//    0 2 |19 ->26
//    1 3 |26 ->2
//    0 2
//    -1 1
    var currentTime = new Date();
    var day = currentTime.getDay();
    var dayOfMonth;
    if (day) {
        dayOfMonth = currentTime.getDate() - day + 1;
    }
    else {
        dayOfMonth = currentTime.getDate() - 6;
    }
    var myDate = new Date();
    myDate.setDate(dayOfMonth + 7 * increment);
    $.ajax({
        url: 'menu/qqq',
        type: 'POST',
        dataType: 'json',
        data: {date: myDate.toDateString()},
        success: function (data, textStatus) {

        },
        complete: function () {

        }
    })
}