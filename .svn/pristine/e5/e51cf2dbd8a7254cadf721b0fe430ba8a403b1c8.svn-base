package com.krt.sys.service.impl;

import com.krt.common.base.BaseServiceImpl;
import com.krt.common.util.DateUtils;
import com.krt.common.util.Md5Utils;
import com.krt.common.util.RandomUtils;
import com.krt.sys.entity.Token;
import com.krt.sys.mapper.TokenMapper;
import com.krt.sys.service.ITokenService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.framework.AopContext;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
public class TokenServiceImpl extends BaseServiceImpl<TokenMapper, Token> implements ITokenService {
    /**
     * 12小时后过期
     */
    private final static int EXPIRE = 3600 * 12;

    protected Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private TokenMapper tokenMapper;

    /**
     * 创建token
     *
     * @param userId
     * @return
     */
    @Override
    public Map<String, Object> createToken(Integer userId) {
        //生成一个token
        String accessToken = Md5Utils.encoderByMd5With32Bit(userId + DateUtils.dateToString("yyyyMMddHHmmsss", new Date()) + RandomUtils.getRandomStr(10));
        String refreshToken = Md5Utils.encoderByMd5With32Bit(userId + DateUtils.dateToString("yyyyMMddHHmmsss", new Date()) + RandomUtils.getRandomStr(11));
        //当前时间
        Date now = new Date();
        //过期时间
        Date expireTime = new Date(now.getTime() + EXPIRE * 1000);
        //判断是否生成过token
        Token oldToken = tokenMapper.selectByUserId(userId);
        Token newToken = new Token();
        if (oldToken == null) {
            newToken.setUserId(userId);
            newToken.setAccessToken(accessToken);
            newToken.setRefreshToken(refreshToken);
            newToken.setInsertTime(now);
            newToken.setUpdateTime(now);
            newToken.setExpireTime(expireTime);
            //保存token
            insert(newToken);
        } else {
            newToken.setId(oldToken.getId());
            newToken.setAccessToken(accessToken);
            newToken.setRefreshToken(refreshToken);
            newToken.setExpireTime(expireTime);
            newToken.setUpdateTime(now);
            //更新token
            ((ITokenService) AopContext.currentProxy()).updateToken(newToken, oldToken);
        }
        Map<String, Object> map = new HashMap<>(2);
        map.put("accessToken", accessToken);
//        map.put("refreshToken", refreshToken);
        map.put("expire", EXPIRE);
        return map;
    }

    /**
     * 更新token
     *
     * @param newToken
     * @param oldToken
     */
    @Override
    @Caching(
            evict = {
                    @CacheEvict(value = "accessTokenCache", key = "#oldToken.accessToken"),
                    @CacheEvict(value = "refreshTokenCache", key = "#oldToken.refreshToken")
            }
    )
    public void updateToken(Token newToken, Token oldToken) {
        updateById(newToken);

    }

    /**
     * 根据accessToken查询token实体
     *
     * @param accessToken
     * @return
     */
    @Override
    @Cacheable(value = "accessTokenCache", key = "#accessToken", unless = "#result == null")
    public Token selectEntityByAccessToken(String accessToken) {
        return tokenMapper.selectEntityByAccessToken(accessToken);
    }

    /**
     * 根据refreshToken查询token实体
     *
     * @param refreshToken
     * @return
     */
    @Override
    @Cacheable(value = "refreshTokenCache", key = "#refreshToken", unless = "#result == null")
    public Token selectEntityByRefreshToken(String refreshToken) {
        return tokenMapper.selectEntityByRefreshToken(refreshToken);
    }
}
