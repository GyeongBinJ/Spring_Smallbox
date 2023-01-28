package com.project.Smallbox.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Smallbox.mapper.LoginMapper;

@Service
public class LoginService {

	@Autowired
	private LoginMapper mapper;
	
	public String getPasswd(String id) {
		return mapper.selectPasswd(id);
	}
}
