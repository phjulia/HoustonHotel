package com.pjatk.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.pjatk.dao.EmpDAO;
import com.pjatk.helpers.Constants;
import com.pjatk.models.Emp;
/**
 * @author Yuliia Likhytska
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	 
	@Autowired
	private EmpDAO empDAO;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
		 Emp emp = empDAO.findEmpByEmail(email);
		  if(emp.getPassword().equals(Constants.GENERIC_PASSWORD)) {
	        	emp.setIsEnabled(false);
	        }else{
	        	emp.setIsEnabled(true);
	        };
	       
	        String role = emp.getRole();
	        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
	         authorities.add(new SimpleGrantedAuthority(role));
	      
	        UserDetails userDetails = User.withUsername(emp.getEmail())
                    .password(emp.getPassword()).disabled(!emp.getIsEnabled())
                    .authorities(authorities).build();

	        return userDetails;
	}
	
 
}
