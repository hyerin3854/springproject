package oracle.java.s20200502.room.dao;

import java.util.List;

import oracle.java.s20200502.main.model.Member;
import oracle.java.s20200502.room.model.Reservation;
import oracle.java.s20200502.room.model.Room;

public interface RoomDao {

	int insert(Room room);

	int titleToNum(String ro_title);

	int total();

	List<Room> getList(Room room);

	Room getRoomContent(int ro_num);

	void upHit(int ro_num);

	Member getMemberContent(int m_num);


	
	

}

