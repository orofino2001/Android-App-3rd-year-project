package com.example.myapplication.api;

import android.util.Log;
import android.widget.Toast;


import com.example.myapplication.MainActivity;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class Api {
    private final String URL = "https://ado19.brighton.domains/api/fetch.php";
    public boolean login(String username, String password) throws JSONException {
        // Example PHP API URL
        OkHttpClient client = new OkHttpClient();
        JSONObject json = new JSONObject();
        json.put("username", username);
        json.put("password", password);
        MediaType JSON = MediaType.parse("application/json; charset=utf-8");
        RequestBody body = RequestBody.create(JSON, json.toString());
        Request loginRequest = new Request.Builder()
                .url(URL)
                .post(body)
                .build();

        try(Response response = client.newCall(loginRequest).execute()){

            return response.isSuccessful();
        } catch (IOException ex){
            return false;
        }


    }
}

