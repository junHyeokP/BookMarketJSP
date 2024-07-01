package book_oracle;

import java.util.List;

import Book.Book;
import Book.BookDAO;
import Book.BookService;
import cart.CartItem;
import cart.CartService;
import cart.OracleCartDAO;
import cart.OracleCartService;

public class OracleBookService implements BookService{
	
	private BookDAO bookDAO;
	
	public OracleBookService(BookDAO bookDAO) {
		this.bookDAO = bookDAO;
	}
	
	public boolean add(Book book) {
		if(book == null) {
			return false;
		}
		int result = bookDAO.insertBook(book);
		
		return (result == 1) ? true : false;
	}
	
	
	public Book read(int bookID) {
		Book book = bookDAO.selectBook(bookID);
		return book;
	}
	
	public List<Book> listAll() {
		List<Book> bookList = bookDAO.selectBookAll();
		return bookList;
	}
	
	public boolean edit(Book book) {
		if (book == null) {
			System.out.println("책이 없거나 내용이 비어있습니다.");
			return false;
		}
		
		//Book bookInfo = bookDAO.selectBook(book.getBookID()); // 변경 전 book
		
		int result = 0;
		
		result = bookDAO.updateBook(book);
		
		//if(book != bookInfo) {
		//	result = bookDAO.updateBook(book);
		//}
		
		return result == 1 ? true : false;
	}
	
	public boolean remove(int bookID) {
		
		if (bookDAO.selectBook(bookID) == null) return false;
		
		CartService cartService = new OracleCartService(new OracleCartDAO());
		List<CartItem> itemList = cartService.readByBookId(bookID);
		
		if (itemList.size() > 0) {
			cartService.removeByBookId(bookID);
		}
		
		int result = bookDAO.deleteBook(bookID);
		
		return result == 1? true : false;
	}
}
