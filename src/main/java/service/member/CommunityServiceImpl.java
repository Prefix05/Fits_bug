package service.member;

import java.util.List;

import dao.member.CommunityDAO;
import dao.member.CommunityDAOImpl;
import dto.member.CommunityDTO;

public class CommunityServiceImpl implements CommunityService {
    private CommunityDAO dao = new CommunityDAOImpl();

    @Override
    public List<CommunityDTO> getPostList() throws Exception {
        return dao.selectAll();
    }

    @Override
    public CommunityDTO getPost(int id) throws Exception {
        return dao.selectById(id);
    }
}