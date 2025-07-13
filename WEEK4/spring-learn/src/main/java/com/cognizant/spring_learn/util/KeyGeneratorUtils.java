package com.cognizant.spring_learn.util;

import io.jsonwebtoken.io.Encoders;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

public class KeyGeneratorUtils{
    public static void main(String[] args) throws Exception {
        // Use Java's KeyGenerator to create a 256-bit HMAC key
        KeyGenerator keyGen = KeyGenerator.getInstance("HmacSHA256");
        keyGen.init(256); // 256-bit key
        SecretKey secretKey = keyGen.generateKey();

        // Encode the key in Base64 to store in properties file
        String base64Key = Encoders.BASE64.encode(secretKey.getEncoded());
        System.out.println("Secure JWT key (Base64):\n" + base64Key);

    }
}
