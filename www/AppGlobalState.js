var exec = require('cordova/exec');

module.exports = {
	getAppState:function(key, success, error){
		exec(success, error, "AppGlobalState", "getAppState", [key]);
	},
	setAppState:function(key, value){
		exec(null, null, "AppGlobalState", "setAppState", [key, value]);
	},
    loadUrl:function(url){
        exec(null, null, "AppGlobalState", "loadUrl", [url]);
    }
};
