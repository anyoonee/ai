package javaBasic4.ch07.sec16;

public class MainActivity extends Activity{

	@Override
	public void onCreate() {
        super.onCreate();  //부모에 있는 onCreate()
		System.out.println("추가적인 실행 내용");
	}
}
