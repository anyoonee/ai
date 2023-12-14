package javaBasic5.ch08.sec03;

public class CarExample {

	public static void main(String[] args) {
		
		CarRun carrun = new CarRun();
		Bus bus = new Bus();
		carrun.drive(bus);
		
		Taxi taxi = new Taxi();
		carrun.drive(taxi);
		
		Train train = new Train();
		carrun.drive(train);
		
		
	}

}
