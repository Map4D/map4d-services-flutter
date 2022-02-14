package vn.map4d.services.map4d_services;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Map;

import io.flutter.plugin.common.MethodChannel;
import vn.map4d.services.MFServiceCallback;
import vn.map4d.services.MFServiceOptions;
import vn.map4d.services.MFServiceTask;
import vn.map4d.services.MFServices;
import vn.map4d.services.MFServicesOptions;

class SClient {

  static void fireRequest(MFServicesOptions options, MFServiceOptions serviceOptions, @NonNull MethodChannel.Result result) {
    MFServiceTask serviceTask = new MFServices(options)
      .request(serviceOptions, new MFServiceCallback<JSONObject>() {
        @Override
        public void onSuccess(@Nullable JSONObject json) {
          if (json == null) {
            result.success(null);
          }
          else {
            try {
              final Map<String, Object> data = SJsonUtils.jsonToMap(json);
              result.success(data);
            } catch (JSONException e) {
              result.error(
                "Map4dServices",
                "Error when parse JSON data result !",
                null);
            }
          }
        }

        @Override
        public void onError(String code, String message) {
          result.error(code, message, null);
        }
      });
  }
}
