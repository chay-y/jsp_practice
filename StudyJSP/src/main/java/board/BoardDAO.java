package board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

//데이터베이스에 접근해서 CRUD작업을 수행하기 위한 객체
public class BoardDAO extends JDBConnect{

	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	//게시글의 개수를 계산하는 메서드
	public int selectCount(Map<String,Object> map) {
		
		//결과를 저장할 변수(게시글 수)
		int totalCount=0;
		
		//게시글의 개수를 세기 위한 sql문
		String query = "SELECT * COUNT(*) FROM board";
		
		//검색어가 있는 경우 where절 추가
		if(map.get("searchWord")!=null) {
			query+=" WHERE "+ map.get("searchField")
				 +" LIKE '%"+map.get("searchWord")+"%'";
		}
			
		try {
			//정적 쿼리문 실행하기 위해 statement 생성
			stmt = con.createStatement();
			
			//쿼리 실행
			rs = stmt.executeQuery(query);
			
			//커서를 첫번째 행으로 이동
			rs.next();
				
			totalCount=rs.getInt(1);
			
		}catch(Exception e) {
			System.out.println("게시글의 수를 구하는 도중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	//게시글 목록 가져오기
	public List<BoardDTO> selectList(Map<String, Object>map){
		List <BoardDTO> bbs = new ArrayList<BoardDTO>();
		
		String query = "SELECT * FROM board";
		
		if(map.get("searchWord") != null) {
			query+=" WHERE "+ map.get("searchField")
			 +" LIKE '%"+map.get("searchWord")+"%'";
		}
		
		//최근게시글이 제일 상단에 표시되도록 일련변호를 기준으로 내림차순 정렬함
		query +=" ORDER BY num DESC ";
		
		try {
	
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitecount(rs.getString("visitecount"));
				
				bbs.add(dto);
				}
			}catch(Exception e) {
				System.out.println("게시글의 수를 구하는 도중 예외 발생");
				e.printStackTrace();
			}
			return bbs;
			
	}
	
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO board("+"title, content, id, visitecount)"+"VALUES(?,?,?,0)";
			
			pstmt=con.prepareStatement(query);
			
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getId());
			
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("게시글 입력 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		
		String query = "Select B.*, M.*" + "FROM member M INNER JOIN BOARD B" + "ON M.id = B.id" + "WHERE num=?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitecount(rs.getString("visitecount"));
				dto.setName(rs.getString("name"));
			}
		}catch(Exception e) {
			System.out.println("게시글 상세보기 중 예외발생");
			e.printStackTrace();
		}
		return dto;
	}
	public void updateVisiteCount(String num) {
		//조회수를 변경할 쿼리문 작성
		String query = "UPDATE board"
						+ "SET visitecount = visitecount+1"
						+ "WHERE num=?";
	
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시글 조회수 증가 중 예외발생");
			e.printStackTrace();
		}

	}
	
	public int UpDateEdit(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "UpDate board"+"SET title=?, content=?"+"WHERE num=?";
			
			pstmt=con.prepareStatement(query);
			
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getNum());
			
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("게시글 수정 중 예외발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int deletePost(BoardDTO dto) {
		int result=0;
		
		try {
			String query = "DELETE FROM board WHERE num=?";
			
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, dto.getNum());
			
			result=pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("게시글 삭제 중 예외발생");
			e.printStackTrace();
		}
		return result;
	
	}
	
}
