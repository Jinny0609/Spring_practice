package org.hj.service;

import org.hj.model.LoginVO;

public interface LoginService {
	public void memreg(LoginVO member);
	public LoginVO login(LoginVO member);
}
