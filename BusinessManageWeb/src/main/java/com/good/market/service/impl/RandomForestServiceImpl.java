package com.good.market.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.good.market.service.RandomForestService;
import com.good.sys.ServiceException;
import com.good.sys.bean.Operator;


@Service
public class RandomForestServiceImpl implements RandomForestService {

    private static Logger logger = LoggerFactory.getLogger(RandomForestServiceImpl.class);


	@Override
	public void uploadToHdfs(Operator oper, String systemId) throws ServiceException {
		
	}
}
