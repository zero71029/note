@SpringBootApplication//主程式
public class springBoot {
    
    public static void main(String[] args) {
        //返回ioc容器
        ConfigurableApplicationContext run = SpringApplication.run(MainApplication.Class,args);//宣告BOOT
        run.getBean();
    }

}

@ComponentScan("com.AAA")指定掃描路徑



@RestController
public class AAA{


    @RequsetMapping("/AAA")
    public String ha01(){
        return "AAAAAA"; 
    }
}

@Configuration//配置類
public class BBB{
    @Bean
    public User user(){
        return new User(AAA,BBB); 
    }
}

@ImportResource("classpath:beans.xml")//原生配置文件引入
@Conditional//滿足謀些條件時才注入
@ConfigurationProperties(prefix = "xxx")//配置屬性