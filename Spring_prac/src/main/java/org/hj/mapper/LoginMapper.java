package org.hj.mapper;

import java.util.ArrayList;

import org.hj.model.LoginVO;

public interface LoginMapper {
	public void memreg(LoginVO member);
	public LoginVO login(LoginVO member);
	public ArrayList<LoginVO> memlist();
	public LoginVO memdetail(LoginVO login);
	public void memberModify(LoginVO login);
	public void memberRemove(LoginVO login);
}
