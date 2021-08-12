// web.xml
// <servlet-name>mvc</servlet-name>
// <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
// <load-on-startup>1</load-on-startup>
// </servlet>
// <servlet-mapping>
// <servlet-name>mvc</servlet-name>
// <url-pattern>/</url-pattern>
// </servlet-mapping>


// mvc.servlet.xml
// <?xml version="1.0" encoding="UTF-8"?>
// <beans xmlns="http://www.springframework.org/schema/beans"
// 	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
// 	xmlns:context="http://www.springframework.org/schema/context"
// 	xsi:schemaLocation="http://www.springframework.org/schema/beans
//                 http://www.springframework.org/schema/beans/spring-beans-3.0.xsd 
//                 http://www.springframework.org/schema/context 
//                 http://www.springframework.org/schema/context/spring-context-3.0.xsd
//                 http://www.springframework.org/schema/mvc            
//                 http://www.springframework.org/schema/mvc/spring-mvc-3.0.xsd"
// 	default-autowire="byName">
// 	<context:annotation-config></context:annotation-config>
// 	<context:component-scan
// 		base-package="controller"></context:component-scan>
// </beans>

@Controller
public class SpringMVC {
    
    @RequestMapping(path={"/hello.controller"})
	public String method(String name){
        System.out.println(name);
        return "redirect:/success.jsp";
    }
}

// <context:annotation-config></context:annotation-config>
// <context:component-scan base-package="controller"></context:component-scan>
// <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
//     <property name="prefix" value="/WEB-INF/views/"></property>
//     <property name="suffix" value=".jsp"></property>
// </bean>