package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	
	//db와 연결하기 위해서 부모의 생성자를 호출
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	//아이디와 패스워드가 일치하는 회원을 찾아서 리턴
	public MemberDTO getMemberDTO(String uid, String upass) {

		//DTO 객체 생성
		MemberDTO dto = new MemberDTO();		
		//아이디와 패스워드가 일치하는 회원을 검색
		String query = "SELECT * FROM member WHERE id=? AND pass=?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,uid);
			pstmt.setString(2,upass);
			
			//쿼리실행
			rs=pstmt.executeQuery();
			
			//결과 출력
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString("regidate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
