// ==UserScript==
// @name         Google cal3(Tasks)
// @match        *://tasks.google.com/*
// @require http://code.jquery.com/jquery-3.4.1.min.js
// ==/UserScript==

function doc_keyUp(e) {

    if (e.ctrlKey && e.altKey && e.keyCode == 57) { //!^9 =!z Task list상에서 ... 택하기
        alert('success');
        var button6 = $('span[title="More"]');
        //triggerClickEvent(button6);
        button6.click()
        //alert(button6.innerHTML);
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
