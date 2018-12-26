var exec = require('cordova/exec');
    
exports.showMap = function ( success, error) {
    exec(success, error, 'cordova-plugin-XJMapSDK', 'showMap');
};
               
exports.naviTo = function (mapId, targetName, targetId, success, error) {
    exec(success, error, 'cordova-plugin-XJMapSDK', 'naviTo', [targetName, targetId] );
};
