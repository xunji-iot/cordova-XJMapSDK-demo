var exec = require('cordova/exec');
    
exports.showMap = function (mapId, success, error) {
    exec(success, error, 'cordova-plugin-XJMapSDK', 'showMap', [mapId]);
};
               
exports.naviTo = function (mapId, targetName, targetId, success, error) {
    exec(success, error, 'cordova-plugin-XJMapSDK', 'naviTo', [mapId, targetName, targetId] );
};
