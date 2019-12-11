package com.krt.sys.mapper;

import com.krt.common.base.BaseMapper;
import com.krt.sys.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

/**
 * 用户映射层
 *
 * @author 殷帅
 * @version 1.0
 * @date 2017年03月9:44日
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

    /**
     * 根据用户名查用户
     * @param username
     * @return
     */
    Map selectByUsername(String username);
}
