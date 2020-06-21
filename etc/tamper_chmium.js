// ==UserScript==
// @name         Google cal3(Tasks)
// @match        *://tasks.google.com/*
// @require http://code.jquery.com/jquery-3.4.1.min.js
// ==/UserScript==
var currentPage = location.href;
var isredirect_prepare = 0;

setInterval(function () {
    if (currentPage != location.href) {
        // page has changed, set new page as 'current'
        currentPage = location.href;

        // do your thing...
        //alert('changed');
        if (isredirect_prepare) {
            setTimeout(function () {
                location.href = "https://tasks.google.com/embed/?origin=https://calendar.google.com&fullWidth=1";
            }, 2000);
            isredirect_prepare = 0;
        }

    }
}, 500);

function doc_keyUp(e) {
    if (e.ctrlKey && e.altKey && e.keyCode == 79) { //^!o = !+d
        $('div[aria-label="Remove date and time"]')[0].click();
    }
    else if (e.ctrlKey && e.altKey && e.keyCode == 57) { //!^9 =!z Task list상에서 ... 택하기
        //alert('success');
        var button6 = $('span[title="More"]');
        //triggerClickEvent(button6);
        button6.click()
        //alert(button6.innerHTML);
    }
    else if (e.ctrlKey && e.altKey && e.keyCode == 73) { //^!i = !+d, Tasks의 세부정보항에서  날짜 선택
        var button20 = $('button:contains("Add date/time")')[0];
        var button21 = $('div[role="button"]:contains("월"):contains("일")')[0];
        if (button20) {
            button20.click();
        }
        else {
            button21.click();
        }
    }
    else if (e.ctrlKey && e.keyCode == 13) { //^Enter = ^F1 세부리스트 내부에서 하위 할일 추가
        var button3 = $("span").filter(function () { return ($(this).text() === 'Add subtasks') });
        button3.click()
    }
    else if (e.ctrlKey && e.altKey && e.keyCode == 80) { //^!p  = !1  Task 어디서든 list 꺼내기

        var button50 = $('div[aria-haspopup="true"][role="button"]')[0];//Tasks list 화살표 꺼내기
        //alert(button50.innerHTML);
        var button30 = $("span").filter(function () { return ($(this).text() === 'Add subtasks') });

        if (button50) {
            //alert('hello');
            //triggerClickEvent(button50.lastElementChild);
            var button500 = button50.lastElementChild.lastElementChild.lastElementChild;
            //var button501=button500.filter(function(){return ($(this).attr('aria-hidden')=='true')});
            //alert(button500.innerHTML);
            //button500.click();
            button50.lastElementChild.lastElementChild.lastElementChild.click();
            isredirect_prepare = 1;
            //triggerClickEvent(button500);
        }
        if (button30) {
            //alert('hello');
            var button51 = $('div[aria-label="Move task to another task list"]')[0];//Tasks 세부정보항에서 화살표 꺼내기
            triggerClickEvent(button51.firstElementChild);
        }

    }
    else if (e.ctrlKey && e.altKey && e.keyCode == 78) { //!^n =!t task list상에서 할일 추가

        var button8 = $('div[role="button"]:contains("Add a task")')[0];
        button8.click();
        //alert('success');
        //alert(button8.innerHTML);
    }
    else if (e.ctrlKey && e.altKey && e.keyCode == 72) { //^!h = %+a Task 어디서든 완료 표시
        $('div[aria-label="완료로 표시"][role="button"]')[0].click();
    }
    else if (e.ctrlKey && e.altKey && e.keyCode == 49) { //^!1
        var button10 = $("span").filter(function () { return ($(this).text() === 'OK') });
        if (button10) {
            //triggerClickEvent(button9);
            button10.click();
        }
    }
}

//document.addEventListener('keyup', doc_keyUp, false);
window.addEventListener('keyup', doc_keyUp, false);

function triggerMouseEvent(node, eventType) {
    var clickEvent = document.createEvent('MouseEvents');
    clickEvent.initEvent(eventType, true, true);
    node.dispatchEvent(clickEvent);
}

function triggerClickEvent(node) {
    triggerMouseEvent(node, "mouseover");
    triggerMouseEvent(node, "mousedown");
    triggerMouseEvent(node, "mouseup");
}