package com.swp391.group3.utils;

import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Dell
 */
public class PasswordEncoder {

    public static String hashPassword(String rawPassword) {
        String hashed;
        String salt = BCrypt.gensalt();
        hashed = BCrypt.hashpw(rawPassword, salt);
        return hashed;
    }

    public static boolean checkPassword(String rawPasword, String hashed) {
        return BCrypt.checkpw(rawPasword, hashed);
    }
}
