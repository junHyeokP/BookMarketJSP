package member;

import java.util.List;


public interface MemberDAO  {

	int insertMember(Member member);

	Member SelectMember(int no);
	
	Member SelectMember(String id, String pwd);

	List<Member> selectAllMember();

	int updateMember(Member member);
	
	int updateAdditionalInfo(Member member);

	int deleteMember(int no);
	
}
