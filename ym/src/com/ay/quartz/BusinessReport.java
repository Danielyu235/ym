package com.ay.quartz;

import java.sql.CallableStatement;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.jdbc.core.JdbcTemplate;

public class BusinessReport 
{ 
    private JdbcTemplate jdbcTemplate;
    
    public JdbcTemplate getJdbcTemplate()
    {
        return jdbcTemplate;
    }
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
    {
        this.jdbcTemplate = jdbcTemplate;
    }
    @SuppressWarnings("unchecked")
    public void callPro(){
        String sql="{call proc_ygxypj()}";
        this.jdbcTemplate.execute(sql,new CallableStatementCallback(){  
        public Object doInCallableStatement(CallableStatement cs)
                    throws SQLException, DataAccessException {
          cs.execute();   
            return null;
            }           
        });
    }
    public void work(){
        System.out.println("启动定时打分");
        callPro();
        
    }
}
