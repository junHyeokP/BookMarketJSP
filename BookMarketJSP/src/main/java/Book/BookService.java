package Book;

import java.util.List;

public interface BookService {
	
	public boolean add(Book book);
	
	public Book read(int bookID);
	
	public List<Book> listAll();
	
	public boolean edit(Book book);
	
	public boolean remove(int bookID);
}
