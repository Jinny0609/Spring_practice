package org.hj.mapper;

import org.hj.model.LoginVO;

public interface LoginMapper {
	public void memreg(LoginVO member);
	public LoginVO login(LoginVO member);
	
}
