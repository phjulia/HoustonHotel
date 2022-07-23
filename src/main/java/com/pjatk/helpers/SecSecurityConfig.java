package com.pjatk.helpers;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

import com.pjatk.service.UserDetailsServiceImpl;
/**
 * @author Yuliia Likhytska
 */
@Configuration
@EnableWebSecurity
public class SecSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Bean 
    public UserDetailsService userDetailsService() {
        return new UserDetailsServiceImpl();
    }
	
	@Bean 
	public PasswordEncoder passwordEncoder() { 
	    return new BCryptPasswordEncoder(); 
	}
    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }
    @Bean
    public AuthenticationFailureHandler authenticationFailureHandler() {
        return new CustomAuthenticationFailureHandler();
    }

    @Override
    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
    	auth.authenticationProvider(authenticationProvider());
    }

    @Override
    protected void configure(final HttpSecurity http) throws Exception {
    	  CharacterEncodingFilter filter = new CharacterEncodingFilter();
          filter.setEncoding("UTF-8");
          filter.setForceEncoding(true);
          http.addFilterBefore(filter,CsrfFilter.class);
    	http
        .csrf().disable()
        
        	.authorizeRequests()
        	.antMatchers("/userNotFound").permitAll()
        	.antMatchers("/passwordNotChanged").permitAll()
        	.antMatchers("/static_files/**").permitAll()
        	.antMatchers("/forgot_password").permitAll()
        	.antMatchers("/sendPasswordReminder").permitAll()
        	.antMatchers("/reset_password").permitAll()
        	.antMatchers("/task_list_emp").permitAll()
        	.antMatchers("/token").permitAll()
        	.antMatchers("/changePassword").permitAll()
        	.antMatchers("/passwordChanged").permitAll()
        	.antMatchers("/calendar/**").hasAnyAuthority("Recepcjonista","Pracownik")
            .antMatchers("/employees/**").hasAuthority("Manager")
            .antMatchers("/add_employee/**").hasAuthority("Manager")
            .antMatchers("/employee/**").hasAuthority("Manager")
            .antMatchers("/approval_request/**").hasAuthority("Manager")
            .antMatchers("/vacations/**").hasAuthority("Manager")
            .antMatchers("/rooms/**").hasAnyAuthority("Recepcjonista","Manager")
            .antMatchers("/task_list_emp/**").hasAnyAuthority("Recepcjonista","Manager","Pracownik")
            .antMatchers("/task_list/**").hasAnyAuthority("Recepcjonista","Manager")
            .antMatchers("/add_task/**").hasAnyAuthority("Recepcjonista","Manager")
            .antMatchers("/rooms/**").hasAnyAuthority("Recepcjonista","Manager")
            .antMatchers("/add_ordering/**").hasAnyAuthority("Recepcjonista","Manager")
            .antMatchers("/ordering_list/**").hasAnyAuthority("Recepcjonista","Manager")
            .antMatchers("/booking_list/**").hasAnyAuthority("Recepcjonista","Manager")
            .antMatchers("/booking/**").hasAnyAuthority("Manager","Recepcjonista")
            .antMatchers("/rooms/edit/**").hasAuthority("Manager")
            .antMatchers("/add_booking/**").hasAnyAuthority("Manager","Recepcjonista")
        .anyRequest().authenticated()
        .and()
        .formLogin()
	        .loginPage("/login")
	        .usernameParameter("email")
	        .permitAll()
        .loginProcessingUrl("/login")
        .defaultSuccessUrl("/home", true)
        .failureHandler(authenticationFailureHandler())
        .and()
        .logout()
        .logoutUrl("/logout").permitAll()
        .and()
        .exceptionHandling().accessDeniedPage("/unauthorized");
    }
}