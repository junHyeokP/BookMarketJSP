package Book;

import java.sql.Date;

public class Book {
	
	private int bookID;
	private String bookname;
	private String author;
	private String publisher;
	private int price;
	private int instock;
	private Date regDate;
	
	public Book(String bookname, String author, String publisher, int price, int instock) {
		this.bookname = bookname;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.instock = instock;
		
	}


	public int getBookID() {
		return bookID;
	}

	public void setBookID(int bookID) {
		this.bookID = bookID;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	
	@Override
	public String toString() {
		return "Book [bookID=" + bookID + ", bookname=" + bookname + ", author=" + author + ", publisher=" + publisher
				+ ", price=" + price + ", instock=" + instock + ", regDate=" + regDate + "]";
	}

	public int getInstock() {
		return instock;
	}

	public void setInstock(int instock) {
		this.instock = instock;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
