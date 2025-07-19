package com.example.myapplication;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;  // Import Log for debugging
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import androidx.appcompat.app.AppCompatActivity;

import com.example.myapplication.api.Api;

public class MainActivity extends AppCompatActivity {
    private Api api = new Api();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button loginButton = findViewById(R.id.loginBTN);
        loginButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                EditText usernameText = findViewById(R.id.username_input);
                String username = usernameText.getText().toString().trim(); // Ensure no leading/trailing spaces
                EditText passwordText = findViewById(R.id.password_input);
                String password = passwordText.getText().toString().trim(); // Ensure no leading/trailing spaces

                // Log values to check if they're correctly retrieved
                Log.d("LoginData", "Username: " + username);
                Log.d("LoginData", "Password: " + password);

                // Check if username or password is empty
                if (username.isEmpty() || password.isEmpty()) {
                    Log.e("LoginError", "Username or Password is missing");
                    return; // Exit the method if either is empty
                }

                // If data is valid, proceed to API login
                Thread thread = new Thread(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            System.out.println(api.login(username, password));
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                });

                thread.start();
            }
        });

        // New button to navigate to another page
        Button navigateButton = findViewById(R.id.registerBTN);
        navigateButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, reg_page.class);
                startActivity(intent);
            }
        });
    }
}
