package com.krt.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.krt.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;


/**
 * @author 殷帅
 * @version 1.0
 * @Description: 用户token表实体类
 * @date 2017年04月28日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("sys_token")
public class Token extends BaseEntity {

	/**
	 * 用户id
	 */
	private Integer userId;
	/**
	 * token令牌
	 */
	private String accessToken;

	/**
     * 用于刷新Access Token 的 Refresh Token
	 */
	private String refreshToken;
	/**
	 * 过期时间
	 */
	private Date expireTime;
}