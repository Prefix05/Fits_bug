package service.member;

import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import dao.member.WorkoutRecordDAO;
import dao.member.WorkoutRecordDAOImpl;
import dto.member.WorkoutLogDTO;

public class HotTimeServiceImpl implements HotTimeService {

    private WorkoutRecordDAO dao = new WorkoutRecordDAOImpl();

    @Override
    public String getHotTimeData(String email) {

        List<WorkoutLogDTO> list = dao.getRecords(email);

        Map<String, Integer> dayMap = new LinkedHashMap<>();
        String[] days = {"Mon","Tue","Wed","Thu","Fri","Sat","Sun"};

        for(String d : days) dayMap.put(d, 0);

        Map<Integer, Integer> timeMap = new LinkedHashMap<>();
        for(int i=0;i<24;i++) timeMap.put(i, 0);

        for (WorkoutLogDTO w : list) {

            // null 체크
            if (w.getDate() == null || w.getStartTime() == null) continue;

            // ✅ 날짜 + 시간 합치기
            LocalDateTime dt = LocalDateTime.of(w.getDate(), w.getStartTime());

            // 요일 (Mon, Tue...)
            String day = dt.getDayOfWeek().toString().substring(0,3);

            // 시간 (0~23)
            int hour = dt.getHour();

            dayMap.put(day, dayMap.get(day) + 1);
            timeMap.put(hour, timeMap.get(hour) + 1);
        }

        // 🔥 JSON 생성
        StringBuilder json = new StringBuilder();
        json.append("{");

        json.append("\"dayData\":[");
        for(String d : dayMap.keySet()){
            json.append("{\"day\":\"").append(d)
                .append("\",\"count\":").append(dayMap.get(d))
                .append("},");
        }
        json.deleteCharAt(json.length()-1);
        json.append("],");

        json.append("\"timeData\":[");
        for(Integer t : timeMap.keySet()){
            json.append("{\"time\":\"").append(t)
                .append("\",\"count\":").append(timeMap.get(t))
                .append("},");
        }
        json.deleteCharAt(json.length()-1);
        json.append("]");

        json.append("}");

        return json.toString();
    }
}