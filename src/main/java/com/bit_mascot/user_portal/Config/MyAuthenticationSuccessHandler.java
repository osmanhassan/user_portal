package com.bit_mascot.user_portal.Config;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit_mascot.user_portal.Entity.CustomUserDetails;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

@Component
public class MyAuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    public MyAuthenticationSuccessHandler() {
        super();
        setUseReferer(true);
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException, ServletException {

        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        request.getSession().setAttribute("FULL_NAME", userDetails.getFirstName() + " " + userDetails.getLastName());
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        authorities.forEach(authority -> {
            SavedRequest savedRequest = (SavedRequest)request.getSession().getAttribute("SPRING_SECURITY_SAVED_REQUEST");
            if (savedRequest != null) {
                String url = savedRequest.getRedirectUrl();
                try {
                    response.sendRedirect(url);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            else {

                if (authority.getAuthority().equals("user")) {
                    try {
                        redirectStrategy.sendRedirect(request, response, "/profile");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else if (authority.getAuthority().equals("admin")) {
                    try {
                        redirectStrategy.sendRedirect(request, response, "/admin");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else {
                    throw new IllegalStateException();
                }
            }
        });

    }

}
