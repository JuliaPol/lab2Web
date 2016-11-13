function show(par) {
    var elem = document.getElementsByClassName('menu');
    for (i = 0; i < elem.length; i++) {
        elem[i].style.color = '#953bd6';
    }
    var elem1 = document.getElementsByClassName('specification');
    for (i = 0; i < elem1.length; i++) {
        elem1[i].style.display = 'none';
    }
    switch (par) {
        case '1':
            document.getElementById('view1').style.display = 'block';
            document.getElementById('a1').style.color = '#600083';
            break;
        case '2':
            document.getElementById('characteristics').style.display = 'block';
            document.getElementById('a2').style.color = '#600083';
            break;
        case '3':
            document.getElementById('reviews').style.display = 'block';
            document.getElementById('a3').style.color = '#600083';
            break;
    }
}
function show1(par) {
    var elem = document.getElementsByClassName('menu1');
    for (i = 0; i < elem.length; i++) {
        elem[i].style.color = '#953bd6';
    }
    var elem1 = document.getElementsByClassName('specification1');
    for (i = 0; i < elem1.length; i++) {
        elem1[i].style.display = 'none';
    }
    switch (par) {
        case '1':
            document.getElementById('takeAway').style.display = 'block';
            document.getElementById('navBarA1').style.color = '#600083';
            break;
        case '2':
            document.getElementById('delivery').style.display = 'block';
            document.getElementById('navBarA2').style.color = '#600083';
            break;
    }
}

function itemsChanged() {
    var value = document.getElementsByTagName('select')[0].value;
    window.location = '?type=' + value;
}

function addCookie(lang1) {
    document.cookie = "lang=" + lang1;
}

function initialize(coordX, coordY, address, shop, id) {
    var myLatlng = new google.maps.LatLng(59.970960891326854, 30.319606160730018);
    var myOptions = {
        zoom: 10,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    for (var i = 0; i < address.length; i++) {
        mark(coordX[i], coordY[i], address[i], shop[i], map, id[i]);
    }
}
function mark(coordX, coordY, address, shop, map, id) {
    var contentString = '<div id="content">' + address + '</div>';
    var infowindow = new google.maps.InfoWindow({
        content: contentString
    });
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(coordX, coordY),
        map: map,
        title: shop
    });
    var onchange = function () {
        map.setCenter(new google.maps.LatLng(coordX, coordY));
        map.setZoom(15);
    }
    google.maps.event.addListener(marker, 'click', function () {
        var elem1 = document.getElementById('radio' + id);
        elem1.checked = true;
        infowindow.open(map, marker);
    });
    var radio = document.getElementById('radio' + id);
    radio.addEventListener("change", function () {
        onchange();
    });
}
function loadXMLDoc() {
    var xmlhttp;
    var elem = document.getElementById('comment').value;
        if (window.XMLHttpRequest)
            xmlhttp = new XMLHttpRequest();
        else
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    document.getElementById("RESULT").innerHTML = xmlhttp.responseText;
        }
        xmlhttp.open("GET", "/s5?comment=" + elem, true);
        xmlhttp.send();
}
function myTimer(lang) {
    var now = new Date();
    var now1;
    var options = {
        era: 'long',
        year: 'numeric',
        month: 'numeric',
        day: 'numeric',
        weekday: 'long',
        timezone: 'UTC',
        hour: 'numeric',
        minute: 'numeric',
        second: 'numeric'
    };
    switch (lang) {
        case 'ru_RU':
            now1 = new Intl.DateTimeFormat("ru", options);
            break;
        case 'en_GB':
            now1 = new Intl.DateTimeFormat("en-GB", options);
            break;
        case 'be_BY':
            var options1 = {
                year: 'numeric',
                month: 'numeric',
                day: 'numeric',
                timezone: 'UTC',
                hour: 'numeric',
                minute: 'numeric',
                second: 'numeric'
            };
            now1 = new Intl.DateTimeFormat("be-BY", options1);
            break;
        default:
            now1 = new Intl.DateTimeFormat("ru", options);
            break;
    }
    var date = document.getElementById('date');
    date.innerHTML = '<p>' + now1.format(now) + '</p>';
}