package dao.trainer;

import dto.trainer.ClientDTO;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import util.MybatisSqlSessionFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ClientDAOImpl implements ClientDAO {

    @Override
    public List<ClientDTO> selectClients(SqlSession session, int offset, int limit, String filter, int trainerId) {
        Map<String, Object> params = new HashMap<>();
        params.put("offset", offset);
        params.put("limit", limit);
        params.put("filter", filter);
        params.put("trainerId", trainerId);

        return session.selectList("dao.ClientMapper.selectClients", params);
    }

    @Override
    public int selectClientCount(SqlSession session, String filter, int trainerId) {
        Map<String, Object> params = new HashMap<>();
        params.put("filter", filter);
        params.put("trainerId", trainerId);

        return session.selectOne("dao.ClientMapper.countClients", params);
    }

    @Override
    public ClientDTO selectClientDetail(SqlSession session, int clientId) {
            return session.selectOne("dao.ClientMapper.getClientDetail", clientId);
    }

    // ID로 단건 조회
    public ClientDTO selectClientById(SqlSession session, int clientId) {
            return session.selectOne("dao.ClientMapper.selectClientById", clientId);
    }
}

//DAO     → select / insert / update (SQL language)
//Service → get / create / update   (business language)