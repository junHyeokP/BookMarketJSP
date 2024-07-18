package book_oracle;

import java.sql.SQLException; 
import java.util.ArrayList;
import java.util.List;

import Book.Book;
import Book.BookDAO;
import common.OracleJDBConnection;

public class OracleBookDAO implements BookDAO {
	
	@Override
	public int insertBook(Book book) {
		
		OracleJDBConnection jdbc = new OracleJDBConnection();
		jdbc.OJDBConnection();
		
		
		int result = 0;
		// sql문 만들기
				String sql = new StringBuilder()
						.append("insert into book (bookID, name, author, publisher, instock, price)")
					    .append("values (book_seq.nextval, ?, ?, ?, ?, ?)") // 물음표는 위에서 받아온 매개변수로 대체됨
					    .toString();
				
		try {
		
			// PreparedStatement 객체 생성
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);
			
			// SQL문 매개변수에 값 추가
			jdbc.pstmt.setString(1, book.getBookname());
			jdbc.pstmt.setString(2, book.getAuthor());
			jdbc.pstmt.setString(3, book.getPublisher());
			jdbc.pstmt.setInt(4, book.getPrice());
			jdbc.pstmt.setInt(5, book.getInstock());
			
			// SQL문 실행
			
			result = jdbc.pstmt.executeUpdate(); // 영향을 받은 행의 수를 반환 
			if (result == 1) System.out.println(result + "행이 추가되었습니다.");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			
			jdbc.close();
				
			}
			
		   return result;
		}
		
		@Override
		public Book selectBook(int bookID) {
			Book book = null;
			
			OracleJDBConnection jdbc = new OracleJDBConnection();
			jdbc.OJDBConnection();
			
			String sql = "select * from book where bookID = ?";
			
			try {
				jdbc.pstmt = jdbc.conn.prepareStatement(sql);
				jdbc.pstmt.setInt(1, bookID);
				
				jdbc.rs = jdbc.pstmt.executeQuery();
				
				if (jdbc.rs.next()) {
					book = new Book(
							jdbc.rs.getString("name")
							,jdbc.rs.getString("author")
							,jdbc.rs.getString("publisher")
							,jdbc.rs.getInt("price")
							,jdbc.rs.getInt("instock"));
					book.setBookID(jdbc.rs.getInt("bookID"));
					book.setRegDate(jdbc.rs.getDate("regdate"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return book;
			
		}

		@Override
		public List<Book> selectBookAll() {
			
			OracleJDBConnection jdbc = new OracleJDBConnection();
			jdbc.OJDBConnection();
			
			String sql = "select * from book";
			
			// 결과를 저장할 List 객체 생성
			List<Book> bookList = new ArrayList<>();	
			
			try {
				// PreparedStatement 객체 생성 (명령문 준비)
				jdbc.pstmt = jdbc.conn.prepareStatement(sql);
				
				// sql문 실행 (쿼리 실행, 실행 결과를 ResultSet에 저장)
				jdbc.rs = jdbc.pstmt.executeQuery();
				
				// 결과값 출력
				System.out.println("<<맴버 상세정보>>");
				while (jdbc.rs.next()) {
					Book book = new Book(
							jdbc.rs.getString("name"),
							jdbc.rs.getString("author"),
							jdbc.rs.getString("publisher"),
							jdbc.rs.getInt("price"),
							jdbc.rs.getInt("instock")
						);
						book.setBookID(jdbc.rs.getInt("bookID"));
						book.setRegDate(jdbc.rs.getDate("regdate"));
						bookList.add(book);
					}
			} catch (SQLException e) {				
				e.printStackTrace();
			} finally {
				jdbc.close();
			}
			
			return bookList;
		}
		
		@Override
		public int updateBook(Book book) {
			
			OracleJDBConnection jdbc = new OracleJDBConnection();
			jdbc.OJDBConnection();
			
			String sql = new StringBuilder()
					.append("update book set ")
					.append("title=?, ")
					.append("author=?, ")
					.append("publisher=?, ")
					.append("price=?, ")
					.append("instock=? ")
					.append("where id=?")
					.toString();
			
			int result = 0;
			
			try {
				jdbc.pstmt = jdbc.conn.prepareStatement(sql);
				
				jdbc.pstmt.setString(1, book.getBookname());
				jdbc.pstmt.setString(2, book.getAuthor());
				jdbc.pstmt.setString(3, book.getPublisher());
				jdbc.pstmt.setInt(4, book.getPrice());
				jdbc.pstmt.setInt(5, book.getBookID());
				
				result = jdbc.pstmt.executeUpdate();
				System.out.println(result + "행이 수정되었습니다.");
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				jdbc.close();
			}
			
			return result;
		}
		
		public int deleteBook(int bookID) {
			
			OracleJDBConnection jdbc = new OracleJDBConnection();
			jdbc.OJDBConnection();
				
				int result = 0;
				
				
				jdbc.pstmt = null;
				
				String sql = "delete book where bookID = ?";
				
				
				
				try {
					jdbc.pstmt = jdbc.conn.prepareStatement(sql); // PrepareStatment 객체 생성, sql 명령문 준비
					
					jdbc.pstmt.setInt(1, bookID); // ? 부분에 매개변수 넣기
					
					result = jdbc.pstmt.executeUpdate();
					System.out.println(result + "행이 수정되었습니다.");
					
					
				} catch (SQLException e) {
					e.printStackTrace();
					
				} finally {
					jdbc.close();
				}
				
				return result;
		}	
		
	
}