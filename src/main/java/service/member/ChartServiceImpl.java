package service.member;

import java.util.*;

import dao.member.FoodRecordDAO;
import dao.member.FoodRecordDAOImpl;
import dao.member.InbodyRecordDAO;
import dao.member.InbodyRecordDAOImpl;
import dao.member.WorkoutRecordDAO;
import dao.member.WorkoutRecordDAOImpl;
import dto.member.ChartDTO;
import dto.member.MealLogDTO;
import dto.member.InbodyLogDTO;
import dto.member.WorkoutLogDTO;
import dto.member.WorkoutDetailDTO;

public class ChartServiceImpl implements ChartService {

    private WorkoutRecordDAO workoutDao = new WorkoutRecordDAOImpl();
    private FoodRecordDAO foodDao = new FoodRecordDAOImpl();
    private InbodyRecordDAO inbodyDao = new InbodyRecordDAOImpl();

    // =========================
    // 운동 차트 (날짜별 합계)
    // =========================
    @Override
    public List<ChartDTO> getWorkoutChart(String email) {

        List<WorkoutLogDTO> records = workoutDao.getRecords(email);

        Map<String, Double> map = new TreeMap<>();

        for (WorkoutLogDTO log : records) {

            // 🔥 LocalDate → String 변환
            String date = log.getDate().toString();

            double totalVolume = 0;

            // 🔥 핵심: detail 반복
            if (log.getDetails() != null) {
                for (WorkoutDetailDTO d : log.getDetails()) {
                    totalVolume += d.getWeight() * d.getRep() * d.getSet();
                }
            }

            map.put(date, map.getOrDefault(date, 0.0) + totalVolume);
        }

        return convertMapToChart(map);
    }

    // =========================
    // 식단 차트 (날짜별 칼로리 합)
    // =========================
    @Override
    public List<ChartDTO> getFoodChart(String email) {

        List<MealLogDTO> records = foodDao.getRecords(email);

        Map<String, Double> map = new TreeMap<>();

        for (MealLogDTO r : records) {

            String date = r.getRecordDate();

            map.put(date, map.getOrDefault(date, 0.0) + r.getCalorie());
        }

        return convertMapToChart(map);
    }

    // =========================
    // 인바디 차트 (날짜별 체중)
    // =========================
    @Override
    public List<ChartDTO> getInbodyChart(String email) {

        List<InbodyLogDTO> records = inbodyDao.getRecords(email);

        Map<String, Double> map = new TreeMap<>();

        for (InbodyLogDTO r : records) {

            String date = r.getRecordDate();

            map.put(date, r.getWeight()); // 마지막 값 유지
        }

        return convertMapToChart(map);
    }

    // =========================
    // 공통 변환 메서드
    // =========================
    private List<ChartDTO> convertMapToChart(Map<String, Double> map) {

        List<ChartDTO> list = new ArrayList<>();

        for (String date : map.keySet()) {
            ChartDTO dto = new ChartDTO();
            dto.setDate(date);
            dto.setValue(map.get(date));
            list.add(dto);
        }

        return list;
    }
}