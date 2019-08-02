function getCorrectImagesFolder() {
    var loc = window.location.pathname;
    var dir = loc.substring(0, loc.lastIndexOf('/'));

    var dir_level = dir.split('/').length - 1;
    var prefix = "";
    for (var i = 1; i < dir_level; i++) {
        prefix = prefix.concat("../");
    }

    return prefix + "images/";
}