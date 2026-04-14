package com.pcms.model;

import jakarta.persistence.*;

@Entity
@Table(name = "PC")
public class PC {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String brand;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private PCType pcType;

    private String hdd;
    private String ram;
    private String os;
    private int registrationYear;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Location location;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private DeviceStatus status;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "technicianId")
    private User technician;

    public enum PCType { Desktop, Laptop }
    public enum Location { Lab, Office }
    public enum DeviceStatus { Working, Not_working, Damaged, Old }

    public PC() { this.status = DeviceStatus.Working; }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }
    public PCType getPcType() { return pcType; }
    public void setPcType(PCType pcType) { this.pcType = pcType; }
    public String getHdd() { return hdd; }
    public void setHdd(String hdd) { this.hdd = hdd; }
    public String getRam() { return ram; }
    public void setRam(String ram) { this.ram = ram; }
    public String getOs() { return os; }
    public void setOs(String os) { this.os = os; }
    public int getRegistrationYear() { return registrationYear; }
    public void setRegistrationYear(int registrationYear) { this.registrationYear = registrationYear; }
    public Location getLocation() { return location; }
    public void setLocation(Location location) { this.location = location; }
    public DeviceStatus getStatus() { return status; }
    public void setStatus(DeviceStatus status) { this.status = status; }
    public User getTechnician() { return technician; }
    public void setTechnician(User technician) { this.technician = technician; }
}
