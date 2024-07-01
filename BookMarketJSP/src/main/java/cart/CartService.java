package cart;

import java.util.List;

public interface CartService {
	
	public boolean add(CartItem item);
	
	//CartItem read(int loggedMemberNo);
	List<CartItem> readByBookId(int book_id);
	//CartItem readByBookId(int loggedMemberNo, int book_id);
	
	public List<CartItem> listAll(int loggedMemberNo);
	
	public boolean update(int id,int loggedMemberNo, int quantity);
	
	public boolean remove(int id, int loggedMemberNo);
	
	public boolean removeByBookId(int bookId);
	
	public boolean clear(int loggedMemberNo);
	
	
}
