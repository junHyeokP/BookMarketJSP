package cart;

import java.util.List;

public class CartTest {

	public static void main(String[] args) {
		
		CartService service = new OracleCartService(new ListCartDAO());
		List<CartItem> itemList;
		
//		// C
		service.add(new CartItem(2, 3, 2));
//		service.add(new CartItem(1, 3));
//		
//		
//		System.out.println();
//		// C
//		service.add(new CartItem(2, 6));
//		service.add(new CartItem(1, 4));
//		
		
		// R
		itemList = service.listAll(3);
		for (CartItem item : itemList) {
			System.out.println(item.toString());
		}
		
//		System.out.println();
//		// U
//		service.update(2, 3);
//		service.update(1, 2);
//		
//		itemList = service.listAll();
//		for (CartItem item : itemList) {
//			System.out.println(item.toString());
//		}
//		System.out.println();
//		// D
//		if (service.clear()) {
//			System.out.println("책 비움");
//		} else {
//			System.out.println("비우기 실패");
//		}
		
	}

}
