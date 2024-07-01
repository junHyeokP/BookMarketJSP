package cart;

import java.sql.Date;

public class CartItem {
	private int id;
	private int memberNo;
	private int bookID;
	private int quantity;
	private Date addDate;
	
	public CartItem(int memberNo, int bookID, int quantity) {
		this.memberNo = memberNo;
		this.bookID = bookID;
		this.quantity = quantity;
	}
	
	public CartItem(int cartid, int memberNo,  int bookID, int quantity) {
		this.id = cartid;
		this.memberNo = memberNo;
		this.bookID = bookID;
		this.quantity = quantity;
	}
	
	public CartItem(int cartid, int memberNo,  int bookID, int quantity,Date addDate) {
		this.id = cartid;
		this.memberNo = memberNo;
		this.bookID = bookID;
		this.quantity = quantity;
		this.addDate = addDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBookID() {
		return bookID;
	}

	public void setBookID(int bookID) {
		this.bookID = bookID;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "CartItem [id=" + id + ", memberNo=" + memberNo + ", bookID=" + bookID + ", quantity=" + quantity
				+ ", addDate=" + addDate + "]";
	}
	
}
