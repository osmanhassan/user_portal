package com.bit_mascot.user_portal.Service;

import com.bit_mascot.user_portal.DAO.RoleDao;
import com.bit_mascot.user_portal.DAO.UserDao;
import com.bit_mascot.user_portal.Entity.RoleEntity;
import com.bit_mascot.user_portal.Entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service
public class UpUserService {
    @Autowired
    UserDao userDao;
    @Autowired
    RoleDao roleDao;
    @Autowired
    EncryptionService encryptionService;

    public UserEntity saveUser(UserEntity user) throws Exception {
        RoleEntity role = roleDao.findById(2);
        user.setRoleByRoleId(role);
        user.setRoleId(2);
        LocalDate start = user.getDateOfBirth().toInstant()
                .atZone(ZoneId.of( "Asia/Dhaka" ))
                .toLocalDate();
        LocalDate stop = LocalDate.now( ZoneId.of( "Asia/Dhaka" ) );
        long years = java.time.temporal.ChronoUnit.YEARS.between( start , stop );
        user.setAge((int) years);
        user.setPassword(encryptionService.encrypt(user.getPassword()));
        return userDao.save(user);
    }

    public UserEntity saveUserPassword(HttpServletRequest request, String email) throws Exception {
        UserEntity user = userDao.findByEmailAndRoleId(email, 2);
        user.setPassword(encryptionService.encrypt(request.getParameter("newPassword")));
        return userDao.save(user);
    }
    public String isUniqueEmail(String email){
        if(! userDao.findByEmail(email).isPresent()){
            return "true";
        }
        return "false";
    }

    public String getChangePasswordErrorMessage(HttpServletRequest request, String email) throws Exception {
        String errorMessage = "";
        List<String> errorMessageList = new ArrayList<>();
        String storedPassword = userDao.findByEmailAndRoleId(email, 2).getPassword();
        String providedPreviousPassword = request.getParameter("previousPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        errorMessage = getStoredAndPorvidedPreviousPassMatchErrorMessage(storedPassword, providedPreviousPassword);
        errorMessageList.add(errorMessage);
        errorMessage = getNewAndConfirmPassMatchErrorMessage(newPassword, confirmPassword);
        errorMessageList.add(errorMessage);
        return getBeautifiedErrorMessage(errorMessageList);
    }

    String getStoredAndPorvidedPreviousPassMatchErrorMessage(String storedPassword, String providedPreviousPassword) throws Exception {
        String errorMessage = "";
        String encryptedProvidedPreviousPassword = encryptionService.encrypt(providedPreviousPassword);
        if(! storedPassword.equals(encryptedProvidedPreviousPassword)){
            errorMessage = "Invalid previous password.";
        }
        return errorMessage;
    }

    String getNewAndConfirmPassMatchErrorMessage(String newPassword, String confirmPassword){
        String errorMessage = "";
        if(! newPassword.equals(confirmPassword)){
            errorMessage += "New Password does not match with confirm password.";
        }
        return errorMessage;
    }

    String getBeautifiedErrorMessage(List<String> errorMessages){
        String beautifiedErrorMessage = "";
        Iterator iterator = errorMessages.iterator();
        while (iterator.hasNext()){
            String errorMessage = (String) iterator.next();
            if(! errorMessage.equals("")) {
                beautifiedErrorMessage += errorMessage + "<br/>";
            }
        }
        return beautifiedErrorMessage;
    }
}
