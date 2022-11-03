package View;

import java.util.Scanner;

public class Main {
	static Scanner sc = new Scanner(System.in);

	public static void main(String[] args) throws Exception {

		MenuImpl start = new MenuImpl();
		start.loginMenu();
	}
}
