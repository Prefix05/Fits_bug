package dao;

import dto.ClientDTO;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ClientDAO {

    // ──────────────────────────────────────────────────────
    // 임시 더미 데이터 (나중에 MyBatis mapper로 교체)
    // ──────────────────────────────────────────────────────
    private static final List<ClientDTO> ALL_CLIENTS = new ArrayList<>();

    static {
        ALL_CLIENTS.add(make(1, "김길동", "체중 감량,근력 증강", "오늘 오후 6:00", 2, "4/28", "review"));
        ALL_CLIENTS.add(make(2, "허실동", "유연성 향상", "(목) 4/11 오전 10:00", 12, "3/27", "all"));
        ALL_CLIENTS.add(make(3, "이길동", "코어 강화,재활 운동", "(수) 4/10 오전 08:00", 8, "3/29", "all"));
        ALL_CLIENTS.add(make(4, "박길동", "바디 프로필,식단 조절", "내일 오후 7:30", 24, "3/30", "today"));
        ALL_CLIENTS.add(make(5, "홍길동", "기초 체력", "(금) 4/5 오후 02:00", 4, "3/22", "all"));
        ALL_CLIENTS.add(make(6, "사길동", "체중 감량", "(금) 4/5 오후 04:00", 4, "3/22", "review"));
        ALL_CLIENTS.add(make(7, "윤길동", "체중 감량", "(금) 4/5 오후 04:00", 5, "3/22", "review"));
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

    // ──────────────────────────────────────────────────────
    // 페이지네이션 + 필터 조회
    // ──────────────────────────────────────────────────────
    public List<ClientDTO> selectClients(int offset, int limit, String filter) {
        List<ClientDTO> filtered = applyFilter(filter);
        int to = Math.min(offset + limit, filtered.size());
        if (offset >= filtered.size()) return new ArrayList<>();
        return filtered.subList(offset, to);
    }

    // 전체 개수 (페이지 수 계산용)
    public int countClients(String filter) {
        return applyFilter(filter).size();
    }

    // clientId로 단건 조회 (대시보드용)
    public ClientDTO selectClientById(int clientId) {
        return ALL_CLIENTS.stream()
                .filter(c -> c.getClientId() == clientId)
                .findFirst()
                .orElse(null);
    }

    // 이름으로 단건 조회 (대시보드 lessonDTO의 memberName 매칭용)
    public ClientDTO selectClientByName(String name) {
        return ALL_CLIENTS.stream()
                .filter(c -> c.getName().equals(name))
                .findFirst()
                .orElse(null);
    }

    // ──────────────────────────────────────────────────────
    // 내부 필터 헬퍼
    // ──────────────────────────────────────────────────────
    private List<ClientDTO> applyFilter(String filter) {
        if (filter == null || filter.equals("all")) {
            return ALL_CLIENTS;
        }
        return ALL_CLIENTS.stream()
                .filter(c -> c.getStatus().equals(filter))
                .collect(Collectors.toList());
    }
}