package com.hunau.service;

import com.hunau.entity.Page;
import com.hunau.entity.Pow;
import com.infopublic.util.PageData;

import java.util.List;

public interface PowManager {
	public List<Pow> getPowlist(PageData pd)throws Exception;
	public Pow getnowPow(PageData pd)throws Exception;
	public List<Pow> getOrgnzdata(Page page) throws Exception; //
	public List<Pow> getdataview(PageData pd)throws Exception;
}
