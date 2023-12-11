package javaBasic3.ch06.sec14;

public class Account {

	String 계좌번호;
	String 계좌주;
	int 초기입금액;
	int 출금액;
	int 잔고;
	int 예금액;
	public Account() {
		super();
	}
	public Account(String 계좌번호, String 계좌주, int 초기입금액, int 출금액, int 잔고, int 예금액) {
		super();
		this.계좌번호 = 계좌번호;
		this.계좌주 = 계좌주;
		this.초기입금액 = 초기입금액;
		this.출금액 = 출금액;
		this.잔고 = 잔고;
		this.예금액 = 예금액;
	}
	public String get계좌번호() {
		return 계좌번호;
	}
	public void set계좌번호(String 계좌번호) {
		this.계좌번호 = 계좌번호;
	}
	public String get계좌주() {
		return 계좌주;
	}
	public void set계좌주(String 계좌주) {
		this.계좌주 = 계좌주;
	}
	public int get초기입금액() {
		return 초기입금액;
	}
	public void set초기입금액(int 초기입금액) {
		this.초기입금액 = 초기입금액;
	}
	public int get출금액() {
		return 출금액;
	}
	public void set출금액(int 출금액) {
		this.출금액 = 출금액;
	}
	public int get잔고() {
		return 잔고;
	}
	public void set찬고(int 잔고) {
		this.잔고 = 잔고;
	}
	public int get예금액() {
		return 예금액;
	}
	public void set예금액(int 예금액) {
		this.예금액 = 예금액;
	}
	
	
}
