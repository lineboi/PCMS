package com.pcms.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Reporting")
public class Reporting {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private DeviceCategory deviceCategory;

    @Column(nullable = false)
    private int deviceId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private DeviceStatus status;

    @Temporal(TemporalType.DATE)
    @Column(nullable = false)
    private Date reportDate;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Location deviceLocation;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "technicianId")
    private User technician;

    @Column(columnDefinition = "TEXT")
    private String notes;

    public enum DeviceCategory { PC, Accessories, NetworkDevices }
    public enum DeviceStatus { Working, Not_working, Damaged, Old }
    public enum Location { Lab, Office }

    public Reporting() { this.reportDate = new Date(); }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public DeviceCategory getDeviceCategory() { return deviceCategory; }
    public void setDeviceCategory(DeviceCategory deviceCategory) { this.deviceCategory = deviceCategory; }
    public int getDeviceId() { return deviceId; }
    public void setDeviceId(int deviceId) { this.deviceId = deviceId; }
    public DeviceStatus getStatus() { return status; }
    public void setStatus(DeviceStatus status) { this.status = status; }
    public Date getReportDate() { return reportDate; }
    public void setReportDate(Date reportDate) { this.reportDate = reportDate; }
    public Location getDeviceLocation() { return deviceLocation; }
    public void setDeviceLocation(Location deviceLocation) { this.deviceLocation = deviceLocation; }
    public User getTechnician() { return technician; }
    public void setTechnician(User technician) { this.technician = technician; }
    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
}
