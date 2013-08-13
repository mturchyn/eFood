/**
 * Created with IntelliJ IDEA.
 * User: Artem
 * Date: 12.08.13
 * Time: 1:27
 * To change this template use File | Settings | File Templates.
 */

var categories_array;

$(document).ready(function () {
    setIdFirstItem();
    $.ajax({
        url: '/efood/category/get_all_categories_ajax',
        type: 'GET',
        dataType: 'json',
        success: function (data, textStatus) {
            window.categories_array = data;
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("Error: " + errorThrown + " textStatus:" + textStatus)
        }
    });
    $.ajax({
        url: '/efood/menu/get_weekly_menu_to_ajax',
        type: 'GET',
        dataType: 'json',
        success: function (data, textStatus) {
            length = data.length;
            for (i = 0; i < length; ++i) {
                data[i].json = jQuery.parseJSON(data[i].json);
            }
            fillPage(data);
        }
    });
});

function setIdFirstItem() {
    var monday = new Date();
    monday.setDate(getCurrentMonday());
    $(".item")[0].id = dateToString(monday);
}

function dateToString(date) {
    numberMonth = 0;
    if (date.getMonth() + 1 < 10) {
        numberMonth = "0" + (date.getMonth() + 1);
    }
    else {
        numberMonth = (date.getMonth() + 1);
    }
    return date.getFullYear() + "-" + numberMonth + "-" + date.getDate();
}

function getCurrentMonday() {
    var currentTime = new Date();
    var day = currentTime.getDay();
    var monday;
    if (day) {
        monday = currentTime.getDate() - day + 1;
    }
    else {
        monday = currentTime.getDate() - 6;
    }
    return monday;
}

function changeWeek(e, increment) {
    increment = changeIncrement(e, increment)
    var monday = getCurrentMonday();
    var requiredMonday = new Date();
    requiredMonday.setDate(monday + 7 * increment);
    $.ajax({
        url: 'menu/qqq',
        type: 'POST',
        dataType: 'json',
        data: {date: requiredMonday.toDateString()},
//        success: function (data, textStatus) {
//            fillPage(data);
//        },
        complete: function () {
        }
    })
}

function changeIncrement(e, increment) {
    var event = e || window.event;
    var target = event.target || event.srcElement;
    event = null;
    if (target.id == "go_right") {
        increment++;
        document.getElementById("go_right").onclick = function () {
            changeWeek(event, increment);
        };
        document.getElementById("go_left").onclick = function () {
            changeWeek(event, increment);
        };
    } else {
        increment--;
        document.getElementById("go_right").onclick = function () {
            changeWeek(event, increment);
        };
        document.getElementById("go_left").onclick = function () {
            changeWeek(event, increment);
        };
    }
    return increment;
}


function qqq() {                               //todo delete
    $.ajax({
        url: '/efood/menu/get_weekly_menu_to_ajax',
        type: 'GET',
        dataType: 'json',
        success: function (data, textStatus) {
            length = data.length;
            for (i = 0; i < length; ++i) {
                data[i].json = jQuery.parseJSON(data[i].json);
            }
            fillPage(data);
        }
    });
}


function getCategoriesForCurrentWeek(data) {
    countDays = data.length;
    categories = [];
    globalCategoriesArrayLength = window.categories_array.length;
    for (i = 0; i < countDays; ++i) {
        countDishes = data[i].json.listOfDishes.length;
        for (j = 0; j < countDishes; ++j) {
            dish_categories_id = data[i].json.listOfDishes[j].dish_categories_id;
            for (k = 0; k < globalCategoriesArrayLength; ++k) {
                if (window.categories_array[k].id == dish_categories_id
                    && categories.indexOf(window.categories_array[k])==-1) {
                    categories.push(window.categories_array[k]);
                }
            }
        }
    }
    return categories;
}

function setIdDay(day,index) {
    day.attr("id", index);
}
function fillDates(data,day) {
    dateOfDay = day.children(".date");
    dateOfDay.text(data[index].json["date"]);
}

function addCategoriesAndDishes(data,day,index){
    template='';

    categories=getCategoriesForCurrentWeek(data);
    categoriesLength = categories.length;

    for (i = 0; i < categoriesLength; ++i) {
        template+='<div class="category">'+categories[i].category +'(<span class="price">'+categories[i].price+'  BYR</span>):';
        countDishes=data[index].json.listOfDishes.length;
        for (j = 0; j < countDishes; ++j) {
           if(data[index].json.listOfDishes[j].dish_categories_id==categories[i].id){
               template+='<label class="checkbox"><input type="checkbox">'+data[index].json.listOfDishes[j].name+'</label>';
           }
        }
        template+='</div>';
    }
    template+='<div>sum: <span class="sum_day"> 0</span> &nbsp;BYR</div>';
    day.append(template);
}
function fillPage(data) {
    index = 0;
    $(".day").each(function () {
        day = $(this);
        setIdDay(day,index);
        fillDates(data,day);
        addCategoriesAndDishes(data,day,index);
        index++;
    });

}
