package cordovaPluginXJMapSDK;

//import com.locnavi.map.XJMapSDK;
//import com.orhanobut.logger.Logger;

import com.locnavi.map.XJMapSDK;
import com.orhanobut.logger.Logger;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * This class echoes a string called from JavaScript.
 */
public class cordovaPluginXJMapSDK extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("showMap")) {
            showMap("",callbackContext);
            return true;
        }
        Logger.e("1111 ");

        if (action.equals("naviTo")) {
            Logger.e("2222 ");
            String mapid = args.getString(0);
            String name = args.getString(1);
            Logger.e("mapid  "+ mapid +" name "+name+" length:"+args.length());
            if (args.length() >=2){
//                String targetId = args.getString(2);
                String targetId = "3aBi8Pl1oy";
                Logger.d("targetId "+targetId);
                Logger.e("3333 "+"targetId "+targetId);
                naviTo(targetId,callbackContext);

                return true;
            }

        }

        if (action.equals("location")) {
            location(callbackContext);
            return true;
        }


        return false;
    }

    private void showMap(String message, CallbackContext callbackContext) {
        final String map_id = "3aBi8Pl1oy";
        XJMapSDK.openXJMapActivity(this.cordova.getActivity(), map_id);
        callbackContext.success("showMap");
    }


    private void naviTo(String targetId, CallbackContext callbackContext) {

        final String map_id = "3aBi8Pl1oy";
        XJMapSDK.openXJMapActivity(this.cordova.getActivity(), map_id,targetId);
        callbackContext.success("naviTo:"+targetId);
    }
    private void location( CallbackContext callbackContext) {
//        Logger.d("未实现此方法");
    }
}

