package news.chen.yu.ionic;

import org.apache.cordova.*;

import com.umeng.socialize.PlatformConfig;
import com.umeng.socialize.bean.SHARE_MEDIA;

public class UMShareQQ extends CordovaPlugin {

    private Boolean __init = false;

    private void init() {
        if(!this.__init) {
            this.__init = true;
            if(!UMShare.mediaList.contains(SHARE_MEDIA.QQ))
                UMShare.mediaList.add(SHARE_MEDIA.QQ);
            if(!UMShare.mediaList.contains(SHARE_MEDIA.QZONE))
                UMShare.mediaList.add(SHARE_MEDIA.QZONE);
            String appKey = preferences.getString("um_share_qq_android_id", "");
            String appSecret = preferences.getString("um_share_qq_android_key", "");
            PlatformConfig.setQQZone(appKey, appSecret);
        }
    }

    @Override
    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
        this.init();
    }
}