package Book;

import java.util.List;

public interface BookDAO {
	
	public int insertBook(Book book);
	
	public Book selectBook(int bookID);
	
	public List<Book> selectBookAll();
	
	public int updateBook(Book book);
	
	public int deleteBook(int bookID);
	
}
