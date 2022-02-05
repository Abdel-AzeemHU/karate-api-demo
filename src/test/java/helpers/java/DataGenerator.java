package helpers.java;

import com.github.javafaker.Faker;
import net.minidev.json.JSONObject;

public class DataGenerator {


    public static JSONObject getRandomUserDetails() {
        Faker faker = new Faker();
        String name = faker.name().firstName();
        String job = faker.name().title();
        JSONObject json = new JSONObject();
        json.put("name", name);
        json.put("job",job);
        return json;
    }
}
