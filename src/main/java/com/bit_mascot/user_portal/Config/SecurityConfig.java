package com.bit_mascot.user_portal.Config;

import com.bit_mascot.user_portal.Entity.CustomUserDetails;
import com.bit_mascot.user_portal.Service.EncryptionService;
import com.bit_mascot.user_portal.Service.UserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.servlet.http.HttpServletRequest;

@Configuration
@EnableWebSecurity
public class SecurityConfig  extends WebSecurityConfigurerAdapter {

    @Autowired
    UserDetailsService userDetailsService;
    @Autowired
    MyAuthenticationSuccessHandler myAuthenticationSuccessHandler;
    @Autowired
    EncryptionService encryptionService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        auth.userDetailsService(userDetailsService)
                .passwordEncoder(getPasswordEncoder());
    }
    private PasswordEncoder getPasswordEncoder() {
        return new PasswordEncoder() {
            @Override
            public String encode(CharSequence charSequence) {
                return charSequence.toString();
            }

            @Override
            public boolean matches(CharSequence charSequence, String s) {
                try {
                    String p = encryptionService.encrypt(charSequence.toString());
                    return p.equals(s);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return false;
            }
        };
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        HttpServletRequest request;
        http.authorizeRequests()
                .antMatchers("/", "/registration", "/is-unique-email").permitAll()
                .antMatchers("/profile").hasAnyAuthority("user")
                .antMatchers("/change-password").hasAnyAuthority("user")
                .antMatchers("/admin").hasAnyAuthority("admin")
                .and()
                .formLogin().loginPage("/").permitAll().usernameParameter("username").passwordParameter("password")
                .successHandler(myAuthenticationSuccessHandler)
                .and()
                .logout().logoutSuccessUrl("/").permitAll()
                .and()
                .csrf().disable();
    }
}
