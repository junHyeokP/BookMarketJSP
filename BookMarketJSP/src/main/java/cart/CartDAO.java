package cart;

import java.util.List;

public interface CartDAO {
	
	// C
	int insert(CartItem item);
	
	//R 
	CartItem select(int cartid, int loggedMemberNo);
	CartItem selectByBookId(int loggedMemberNo, int bookID);
	List<CartItem> selectByBookId(int bookID);
	List<CartItem> selectAll(int loggedMemberNo);
	
	//U
	int update(int cartid, int loggedMemberNo, int quantity);
	
	//D
	int delete(int cartid, int loggedMemberNo);
	int deleteAll(int loggedMemberNo);
	int deleteByBookId(int bookId);
}
