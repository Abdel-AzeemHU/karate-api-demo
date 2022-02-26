package helpers.java;

import com.github.javafaker.Faker;
import net.minidev.json.JSONObject;

public class DataGenerator {

    public static JSONObject getRandomUserDetails() {
        Faker faker = new Faker();
        String name = faker.name().firstName();
        String username = faker.name().name();
        String email = faker.internet().emailAddress();
        String street = faker.address().streetName();
        String suite = faker.address().state();
        String city = faker.address().city();
        String zipcode = faker.address().zipCode();
        String lat = faker.address().latitude();
        String lng = faker.address().longitude();
        String phone = faker.phoneNumber().phoneNumber();
        String website = faker.internet().domainName();
        String catchPhrase = faker.company().catchPhrase();
        String bs = faker.company().bs();
        String job = faker.name().title();
        JSONObject json = new JSONObject();
        json.put("name", name);
        json.put("job", job);
        json.put("username", username);
        json.put("email", email);
        json.put("street", street);
        json.put("suite", suite);
        json.put("city", city);
        json.put("zipcode", zipcode);
        json.put("lat", lat);
        json.put("lng", lng);
        json.put("phone", phone);
        json.put("website", website);
        json.put("catchPhrase", catchPhrase);
        json.put("bs", bs);
        return json;
    }


}
