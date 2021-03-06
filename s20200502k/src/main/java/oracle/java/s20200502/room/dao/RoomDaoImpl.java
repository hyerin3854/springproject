package oracle.java.s20200502.room.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20200502.main.model.Member;
import oracle.java.s20200502.room.model.Room;

@Repository
public class RoomDaoImpl implements RoomDao {

	@Autowired
	private SqlSession session;

	@Override
	public int insert(Room room) {
		System.out.println("RoomDaoImpl insert Start...");
		return session.insert("insert", room);
	}

	@Override
	public int titleToNum(String ro_title) {
		System.out.println("RoomDaoImpl titleToNum Start...");
		return session.selectOne("titleToNum", ro_title);
	}

	@Override
	public int total() {
		return session.selectOne("total");
	}

	@Override
	public List<Room> getList(Room room) {
		System.out.println("RoomDaoImpl getList Start...");
		return session.selectList("getList", room);
	}

	@Override
	public Room getRoomContent(int ro_num) {
		System.out.println("RoomDaoImpl getRoomContent Start...");
		return session.selectOne("getRoomContent", ro_num);
	}

	@Override
	public void upHit(int ro_num) {
		session.update("upHit", ro_num);
	}

	@Override
	public Member getMemberContent(int m_num) {
		// TODO Auto-generated method stub
		return session.selectOne("getMemberContent", m_num);
	}

	

	
}
