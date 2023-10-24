package data;

import com.github.javafaker.Faker;

public class DataGenerator {

    public static String getEmail() {
        String email = "james.watt";
        int random = (int) (Math.random() * 93833);
        return email + random + "@tekschool.us";
    }


    public static String getFirstName() {
        char[] alphabet = {'A', 'B', 'C', 'D', 'E', 'F', 'e', 'g', 'e', 'z', 'l'};
        String name = "";
        for (int i = 0; i < 5; i++) {
            int index = (int) (Math.random() * alphabet.length);
            name += alphabet[index];
        }
        return name;

    }

    public static String fakeEmail() {
        Faker faker = new Faker();


        return faker.name().lastName() + "@tekschoo.us";

    }
}
