package dao.trainer;

import dto.trainer.ClientDTO;
import java.util.List;

public interface ClientDAO {

    // clients (list)
    List<ClientDTO> selectClients(int offset, int limit, String filter);
    int countClients(String filter);
    ClientDTO selectClientById(int clientId);
    ClientDTO selectClientByName(String name);


    // clientDetail
    ClientDTO getClientDetail(int clientId);
//    List<ProgressDTO> getClientProgress(int clientId);

}