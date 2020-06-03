package oracle.java.s20200502.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200502.room.dao.RoomImgDao;
import oracle.java.s20200502.room.model.Room;
import oracle.java.s20200502.room.model.RoomImg;

@Service
public class RoomImgServiceImpl implements RoomImgService {
	
	@Autowired
	private RoomImgDao rid;

	@Override
	public int insert(List<String> pathList, int ro_num) {
		System.out.println("RoomImgDaoImpl insert Start...");
		return rid.insert(pathList, ro_num);
	}

	@Override
	public List<RoomImg>  getRoomImg(int ro_num) {
		System.out.println("RoomImgDaoImpl getRoomImg Start...");
		return rid.getRoomImg(ro_num);
	}
}
