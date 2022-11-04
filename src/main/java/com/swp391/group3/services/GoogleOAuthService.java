package com.swp391.group3.services;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.swp391.group3.user.GoogleUserPojo;
import com.swp391.group3.utils.AppConstants;
import java.io.IOException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author Dell
 */
public class GoogleOAuthService {

    public static String getAccessToken(String code) throws IOException {
        String response = Request.Post(AppConstants.SignInWithGoogleFeatures.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", AppConstants.SignInWithGoogleFeatures.GOOGLE_CLIENT_ID)
                        .add("client_secret", AppConstants.SignInWithGoogleFeatures.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", AppConstants.SignInWithGoogleFeatures.GOOGLE_REDIRECT_URI)
                        .add("code", code).add("grant_type", AppConstants.SignInWithGoogleFeatures.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        JsonObject jObject = new Gson().fromJson(response, JsonObject.class);

        System.out.println(response);
        String access_token = jObject.get("access_token").toString().replaceAll("\"", "");
        return access_token;
    }

    public static GoogleUserPojo getUserInformation(String access_token) throws IOException {
        String response = Request.Get(AppConstants.SignInWithGoogleFeatures.GOOGLE_LINK_GET_USER_INFO + access_token)
                .execute().returnContent().asString();
        System.out.println(response);
        GoogleUserPojo pojo = new Gson().fromJson(response, GoogleUserPojo.class);
        System.out.println(pojo);
        return pojo;
    }
}
