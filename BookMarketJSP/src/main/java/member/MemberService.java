package member;

import java.util.List;

public interface MemberService {
	
	public boolean regist(Member member);
	
	public Member read(int no);
	
	public List<Member> listAll();
	
	public boolean edit(Member member, String oldPassword);
	
	public boolean remove(int no);
	
	Member login(String id, String pwd);
	
	boolean editAdditionalInfo(int no, String mobile, String email, String address);
}
