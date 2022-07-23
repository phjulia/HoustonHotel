package com.pjatk.dao;
/**
 * @author Yuliia Likhytska
 */
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import com.pjatk.helpers.EmpNotFoundException;
import com.pjatk.models.Emp;
import com.pjatk.models.Login;

public interface EmpDAO {
public Emp validateEmp(Login login);
public Integer findByEmail(String email);
public Integer findByResetPasswordToken(String token);
public String setResetPasswordToken(String email) throws EmpNotFoundException;
public void updateEmp(Emp emp);
public String updatePass(int emp_id,String password);
public Emp getEmp(int id);
public void addEmp(Emp emp);
public Boolean isTokenExpired(String token);
public Emp findEmpByEmail(String email);
public String getEmpRole(int emp_id);
public int findByPesel(String pesel);
public List<String> getAllJobs();
public Page<Emp> findAll(Pageable pageable);
public Page<Emp> findAll(String parameter, PageRequest pageable);
}
