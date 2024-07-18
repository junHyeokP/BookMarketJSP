package cart;

import java.util.LinkedList;
import java.util.List;

public class ListCartDAO implements CartDAO {

	static List<CartItem> itemList = new LinkedList<>();
	static int cart_seq = 0;
	
	@Override
	public int insert(CartItem item) {
		int result = 0;
		
		item.setId(++cart_seq);
		
		if (itemList.add(item)) result = 1;
		
		return result;
	}

	@Override
	public CartItem select(int id, int loggedMemberNo) {
		
		for (CartItem item : itemList) {
			if (item.getId() == id && item.getMemberNo() == loggedMemberNo)
				return item;
		}
		return null;
	}

	@Override
	public CartItem selectByBookId(int loggedMemberNo,int bookID) {
		
		for (CartItem item : itemList) {
			if (item.getBookID() == bookID && item.getMemberNo() == loggedMemberNo)
				return item;
		}
		return null;
	}

	@Override
	public List<CartItem> selectAll(int loggedMemberNo) {
		
		List<CartItem> resultList = new LinkedList<>();
		
		for (CartItem item : itemList) {
			if (item.getMemberNo() == loggedMemberNo) {
				resultList.add(item);
			}
		}
		
		return resultList;
	}

	@Override
	public int update(int id,int loggedMemberNo, int quantity) {
		
		int result = 0;
		
		CartItem item = select(id, loggedMemberNo);
		if(item != null) {
			System.out.println("update (" + id + ")" + quantity);
			item.setQuantity(quantity);
			result = 1;
		}
		
		return result;
	}

	@Override
	public int delete(int id, int loggedMemberNo) {
		
		int result = 0;
		
		CartItem item = select(id, loggedMemberNo);
		if (item != null && itemList.remove(item)) {
			result = 1;
		}
		return result;
	}

	@Override
	public int deleteAll(int loggedMemberNo) {
		
		int result = itemList.size();
		
		for (CartItem item : itemList) {
			if (item.getMemberNo() == loggedMemberNo) {
			itemList.remove(item);
			result++;
			}
		}
		
		return result;
	}

	@Override
	public List<CartItem> selectByBookId(int bookID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteByBookId(int bookId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
