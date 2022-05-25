package models;

import java.time.LocalDate;

public class Booking {
    private Integer id;
    private LocalDate startTime;
    private LocalDate endTime;
    private Integer houseId;
    private Integer userId;
    private String status;
    private Float totalFee;

    public Booking() {
    }

    public Booking(Integer id, LocalDate startTime, LocalDate endTime, Integer houseId, Integer userId, String status, Float totalFee) {
        this.id = id;
        this.startTime = startTime;
        this.endTime = endTime;
        this.houseId = houseId;
        this.userId = userId;
        this.status = status;
        this.totalFee = totalFee;
    }

    public Float getTotalFee() {
        return totalFee;
    }

    public void setTotalFee(Float totalFee) {
        this.totalFee = totalFee;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public LocalDate getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalDate startTime) {
        this.startTime = startTime;
    }

    public LocalDate getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalDate endTime) {
        this.endTime = endTime;
    }

    public Integer getHouseId() {
        return houseId;
    }

    public void setHouseId(Integer houseId) {
        this.houseId = houseId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer useId) {
        this.userId = useId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
