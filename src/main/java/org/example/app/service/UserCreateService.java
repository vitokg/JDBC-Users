package org.example.app.service;

import org.example.app.entity.User;
import org.example.app.exceptions.CreateException;
import org.example.app.repository.UserCreateRepository;
import org.example.app.utils.Constants;
import org.example.app.utils.EmailValidator;
import org.example.app.utils.PhoneValidator;

import java.util.HashMap;
import java.util.Map;

public class UserCreateService {

   UserCreateRepository repository;

    public UserCreateService(UserCreateRepository repository) {
        this.repository = repository;
    }

    public String createUser(String[] data) {

        Map<String, String> errors = validateData(data);

        if (!errors.isEmpty()) {
            try {
                throw new CreateException("Check inputs", errors);
            } catch (CreateException ce) {
                return ce.getErrors(errors);
            }
        }

        return repository.createUser(convertData(data));
    }

    private Map<String, String> validateData(String[] data) {
        // Map для помилок
        Map<String, String> errors = new HashMap<>();

        if (data[0].isEmpty())
            errors.put("first name", Constants.INPUT_REQ_MSG);

        if (data[1].isEmpty())
            errors.put("last name", Constants.INPUT_REQ_MSG);

        if (EmailValidator.isEmailValid(data[2]))
            errors.put("email", Constants.WRONG_EMAIL_MSG);

        return errors;
    }

    private User convertData(String[] data) {
        User user = new User();
        user.setFirstName(data[0]);
        user.setLastName(data[1]);
        user.setEmail(data[2]);
        return user;
    }
}
