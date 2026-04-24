package dao.trainer;

import dto.trainer.ClientDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import util.MybatisSqlSessionFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ClientDAOImpl implements ClientDAO {

    private final SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();

    // 페이지네이션 + 필터 조회
    public List<ClientDTO> selectClients(int offset, int limit, String filter) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            Map<String, Object> params = new HashMap<>();
            params.put("offset", offset);
            params.put("limit", limit);
            params.put("filter", filter);
            return session.selectList("dao.ClientMapper.selectClients", params);
        }
    }

    private static ClientDTO make(int id, String name, String goals,
                                  String next, int count, String last, String status) {
        ClientDTO c = new ClientDTO();
        c.setClientId(id);
        c.setName(name);
        c.setGoals(goals);
        c.setNextSession(next);
        c.setLessonCount(count);
        c.setLastSession(last);
        c.setStatus(status);
        return c;
    }


    // 전체 개수
    public int countClients(String filter) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            Map<String, Object> params = new HashMap<>();
            params.put("filter", filter);
            return session.selectOne("dao.ClientMapper.countClients", params);
        }
    }

    public ClientDTO selectClientByName(String name) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne("dao.ClientMapper.selectClientByName", name);
        }
    }

    // ID로 단건 조회
    public ClientDTO selectClientById(int clientId) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectOne("dao.ClientMapper.selectClientById", clientId);
        }
    }
}