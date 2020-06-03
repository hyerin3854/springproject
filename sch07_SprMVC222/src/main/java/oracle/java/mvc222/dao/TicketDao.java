package oracle.java.mvc222.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import oracle.java.mvc222.dto.TicketDto;


public class TicketDao {

	JdbcTemplate template;// 데이터 베이스에 access
	// I/F
	PlatformTransactionManager transactionManager;
	// PlatformTransactionManager transactionManager = new PlatformTransactionManager();
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public void setTransactionManager( PlatformTransactionManager transactionManager) {
		this.transactionManager = transactionManager;
	}
	
	public TicketDao() {
		System.out.println(template);
	}
	
	public void buyTicket(final TicketDto dto) {
		System.out.println("buyTicket()");
		System.out.println("dto.getConsumerId() : " + dto.getConsumerId());
		System.out.println("dto.getAmount() : " + dto.getAmount());
		System.out.println("dto.getCountnum() : " + dto.getCountnum());
		
		TransactionDefinition definition = new DefaultTransactionDefinition(); //트랜잭션을 구동하는데 필요한 기본 객체 생성
		TransactionStatus status = transactionManager.getTransaction(definition);
		
		try {
			template.update(new PreparedStatementCreator() {
				@Override
				public PreparedStatement createPreparedStatement(Connection con)
						throws SQLException {
					String query = "insert into card(consumerId,amount) values (?, ?)";
					PreparedStatement pstmt = con.prepareStatement(query);
					pstmt.setString(1, dto.getConsumerId());
					pstmt.setString(2, dto.getAmount());
					return pstmt;
				}
			});
			
			template.update(new PreparedStatementCreator() {
				@Override
				public PreparedStatement createPreparedStatement(Connection con)
						throws SQLException {
					String query = "insert into ticket(consumerId,countnum) values (?, ?)";
					PreparedStatement pstmt = con.prepareStatement(query);
					pstmt.setString(1, dto.getConsumerId());
					pstmt.setString(2, dto.getCountnum());
					return pstmt;
				}
			});
			transactionManager.commit(status);
		} catch (Exception e) {
			e.printStackTrace();
			transactionManager.rollback(status);
		}
	}
	
}
