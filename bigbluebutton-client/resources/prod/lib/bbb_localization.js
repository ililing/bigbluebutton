// Check locale
var localeChain = "zh_CN";

if (navigator.language)
        localeChain = navigator.language;
else if (navigator.browserLanguage)
        localeChain = navigator.browserLanguage;

if(/^([a-z]+)-([a-z]+)$/i.test(localeChain)){
        var matches = /^([a-z]+)-([a-z]+)$/i.exec(localeChain);
        localeChain = matches[1].toLowerCase() + "_" + matches[2].toUpperCase();
}
else if(/^en$/i.test(localeChain)){
        localeChain = "zh_CN";
}
else if(/^([a-z]+)$/i.test(localeChain)){
        var matches = /^([a-z]+)$/i.exec(localeChain);
        localeChain = matches[1].toLowerCase() + "_" + matches[1].toUpperCase();
}
else{
        localeChain = "zh_CN";
}

function getLanguage(){
        return localeChain;
}

