package com.pcms.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Accessories")
public class Accessory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private AccessoryType accessoryType;

    private String brand;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Location location;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private DeviceStatus status;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "technicianId")
    private User technician;

    public enum AccessoryType { Mouse, Keyboard, Monitor, Projector }
    public enum Location { Lab, Office }
    public enum DeviceStatus { Working, Not_working, Damaged, Old }

    public Accessory() { this.status = DeviceStatus.Working; }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public AccessoryType getAccessoryType() { return accessoryType; }
    public void setAccessoryType(AccessoryType accessoryType) { this.accessoryType = accessoryType; }
    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }
    public Location getLocation() { return location; }
    public void setLocation(Location location) { this.location = location; }
    public DeviceStatus getStatus() { return status; }
    public void setStatus(DeviceStatus status) { this.status = status; }
    public User getTechnician() { return technician; }
    public void setTechnician(User technician) { this.technician = technician; }
}
