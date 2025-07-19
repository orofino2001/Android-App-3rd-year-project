package com.example.myapplication;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;

public class reg_page extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_reg_page);  // Make sure this matches the correct XML layout file

        // Initialize UI components (make sure the IDs match your XML)
        EditText usernameInput = findViewById(R.id.username_input);  // ID: username_input
        EditText emailInput = findViewById(R.id.email_input);        // ID: email_input
        EditText passwordInput = findViewById(R.id.password_input);  // ID: password_input
        EditText confirmPasswordInput = findViewById(R.id.confirm_password_input);  // ID: confirm_password_input
        Button registerButton = findViewById(R.id.registerBTN);      // ID: registerBTN
        ImageButton backButton = findViewById(R.id.backBTN);          // ID: backBTN

        // Back button click listener (navigate back to login page)
        backButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Go back to the login page
                Intent intent = new Intent(reg_page.this, MainActivity.class);
                startActivity(intent);
                finish();
            }
        });

        // Register button click listener (validate inputs)
        registerButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Get user input
                String username = usernameInput.getText().toString();
                String email = emailInput.getText().toString();
                String password = passwordInput.getText().toString();
                String confirmPassword = confirmPasswordInput.getText().toString();

                // Perform validation
                if (username.isEmpty() || email.isEmpty() || password.isEmpty() || confirmPassword.isEmpty()) {
                    // Show error if any field is empty
                    Toast.makeText(reg_page.this, "Please fill all fields", Toast.LENGTH_SHORT).show();
                } else if (!password.equals(confirmPassword)) {
                    // Show error if passwords do not match
                    Toast.makeText(reg_page.this, "Passwords do not match", Toast.LENGTH_SHORT).show();
                } else {
                    // Proceed with registration (e.g., save to database or call API)
                    registerUser(username, email, password);
                }
            }
        });
    }

    // This method simulates registering the user (you would replace this with your actual registration logic)
    private void registerUser(String username, String email, String password) {
        // Here you would typically send the data to a backend or database
        // For now, we simulate successful registration with a Toast message.

        // Simulating successful registration:
        Toast.makeText(reg_page.this, "Registration successful", Toast.LENGTH_SHORT).show();

        // Redirect the user to the login screen after successful registration:
        Intent intent = new Intent(reg_page.this, MainActivity.class);
        startActivity(intent);
        finish();  // Close the registration activity
    }
}
