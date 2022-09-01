package utilities;

import com.github.javafaker.Faker;

import java.util.LinkedHashMap;
import java.util.Map;

public class UserGenerator {

    public static Map<String, Object> newUserRegistration() {

        Faker faker = new Faker();

        String email = faker.internet().safeEmailAddress();
        String password = faker.internet().password();
        String name = faker.name().firstName();
        String google = "google";
        String facebook = "facebook";
        String github = "github";


        Map<String, Object> newUser = new LinkedHashMap<>();
        newUser.put("email", email);
        newUser.put("password", password);
        newUser.put("name", name);
        newUser.put("google", google);
        newUser.put("facebook", facebook);
        newUser.put("github", github);

        return newUser;
    }


}