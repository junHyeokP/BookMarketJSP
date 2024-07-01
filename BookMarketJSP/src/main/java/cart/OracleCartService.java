package cart;

import java.util.List;

public class OracleCartService implements CartService{

	CartDAO cdao;
	
	public OracleCartService(CartDAO cdao) {
		this.cdao = cdao;
	}

	@Override
	public boolean add(CartItem item) {
		if (item == null) return false;
		
		int result = 0;
		
		// 장바구니에 같은 책이 있는지 확인한다 --> bookID로 확인
		CartItem initem = cdao.selectByBookId(item.getMemberNo(), item.getBookID());
		if (initem == null) {
			System.out.println("비어있으므로 새 책 추가");
			result = cdao.insert(item);
		} else {
			int quantity = item.getQuantity() + initem.getQuantity();
			System.out.println("수량 변경 :" + quantity);
			result = cdao.update(initem.getId(),item.getMemberNo() ,item.getQuantity() + item.getQuantity());
		}
		
		return result == 1 ? true : false;
	}
	
	public boolean removeByBookId(int bookId) {
	
		int result = cdao.delete(bookId);
		return result == 1? true : false;
	}
	
	@Override
	public List<CartItem> listAll(int loggedMemberNo) {
	
		return cdao.selectAll(loggedMemberNo);
	}	
	
	@Override
	public boolean update(int id,int loggedMemberNo ,int quantity) {
		
		int result = cdao.update(id,loggedMemberNo ,quantity);
		return result == 1 ? true : false;
		
	}

	@Override
	public boolean remove(int id, int loggedMemberNo) {
		
		int result = cdao.delete(id, loggedMemberNo);
		return result == 1? true : false;
	}

	@Override
	public boolean clear(int loggedMemberNo) {
		
		int result = cdao.deleteAll(loggedMemberNo);
		
		return result > 0 ? true : false;
	}

	@Override
	public List<CartItem> readByBookId(int bookID) {
		
		List<CartItem> itemList = cdao.selectByBookId(bookID);
		
		return itemList;
	}
}
