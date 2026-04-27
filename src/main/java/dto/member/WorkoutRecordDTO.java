package dto.member;

import java.time.LocalDateTime;

public class WorkoutRecordDTO {
	private int id;
    private String email;   
    private String name;    
    private int weight;     
    private int reps;       
    private int sets;       
    private String date;
    
    private LocalDateTime workoutRecordTime;

	public WorkoutRecordDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WorkoutRecordDTO(int id, String email, String name, int weight, int reps, int sets, String date,
			LocalDateTime workoutRecordTime) {
		super();
		this.id = id;
		this.email = email;
		this.name = name;
		this.weight = weight;
		this.reps = reps;
		this.sets = sets;
		this.date = date;
		this.workoutRecordTime = workoutRecordTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getReps() {
		return reps;
	}

	public void setReps(int reps) {
		this.reps = reps;
	}

	public int getSets() {
		return sets;
	}

	public void setSets(int sets) {
		this.sets = sets;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public LocalDateTime getWorkoutRecordTime() {
		return workoutRecordTime;
	}

	public void setWorkoutRecordTime(LocalDateTime workoutRecordTime) {
		this.workoutRecordTime = workoutRecordTime;
	}
    
}