package config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import interceptor.CheckLoginInterceptor;

/**
 * 创建人：HDX 创建日期：2019年7月17日
 */
@SpringBootConfiguration // 声明此类为springboot配置文件类
public class SpringbootConfig extends WebMvcConfigurerAdapter {
	@Autowired
	private CheckLoginInterceptor checkLoginInterceptor;

	// 注册拦截器
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(checkLoginInterceptor).addPathPatterns("/user/login");
	}
}