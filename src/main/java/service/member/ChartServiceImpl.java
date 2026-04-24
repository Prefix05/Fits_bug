package service.member;

import java.util.ArrayList;
import java.util.List;

import dao.member.FoodRecordDAO;
import dao.member.FoodRecordDAOImpl;
import dao.member.InbodyRecordDAO;
import dao.member.InbodyRecordDAOImpl;
import dao.member.WorkoutRecordDAO;
import dao.member.WorkoutRecordDAOImpl;
import dto.member.ChartDTO;
import dto.member.FoodRecordDTO;
import dto.member.InbodyRecordDTO;
import dto.member.WorkoutRecordDTO;

public class ChartServiceImpl implements ChartService {

    private WorkoutRecordDAO workoutDao = new WorkoutRecordDAOImpl();
    private FoodRecordDAO foodDao = new FoodRecordDAOImpl();
    private InbodyRecordDAO inbodyDao = new InbodyRecordDAOImpl();

    // 운동 → ChartDTO
    @Override
    public List<ChartDTO> getWorkoutChart(String email) {

        List<WorkoutRecordDTO> records = workoutDao.getRecords(email);
        List<ChartDTO> list = new ArrayList<>();

        for(WorkoutRecordDTO r : records){
            ChartDTO dto = new ChartDTO();

            dto.setDate(r.getDate());

            // 볼륨 계산
            double volume = r.getWeight() * r.getReps() * r.getSets();
            dto.setValue(volume);

            list.add(dto);
        }

        return list;
    }

    // 식단 → ChartDTO
    @Override
    public List<ChartDTO> getFoodChart(String email) {

        List<FoodRecordDTO> records = foodDao.getRecords(email);
        List<ChartDTO> list = new ArrayList<>();

        for(FoodRecordDTO r : records){
            ChartDTO dto = new ChartDTO();

            dto.setDate(r.getRecordDate());
            dto.setValue(r.getCalorie());

            list.add(dto);
        }

        return list;
    }

    // 인바디 → ChartDTO (체중 기준)
    @Override
    public List<ChartDTO> getInbodyChart(String email) {

        List<InbodyRecordDTO> records = inbodyDao.getRecords(email);
        List<ChartDTO> list = new ArrayList<>();

        for(InbodyRecordDTO r : records){
            ChartDTO dto = new ChartDTO();

            dto.setDate(r.getRecordDate());
            dto.setValue(r.getWeight()); // 기본 체중

            list.add(dto);
        }

        return list;
    }
}