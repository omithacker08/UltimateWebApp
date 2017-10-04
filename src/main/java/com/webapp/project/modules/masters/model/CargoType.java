package com.webapp.project.modules.masters.model;
// Generated Jul 9, 2017 1:44:32 AM by Hibernate Tools 4.3.1.Final

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.webapp.project.modules.jobcard.model.Jobcard;

/**
 * Cargotypemaster generated by hbm2java
 */
@Entity
@Table(name = "cargotypemaster", catalog = "websystique")
public class CargoType implements java.io.Serializable {

	private long cargoTypeId;
	private String cargoTypeCode;
	private String cargoTypeName;
	private String cargoTypeDescription;
	private Set<Jobcard> jobcards = new HashSet<Jobcard>(0);

	public CargoType() {
	}

	public CargoType(long cargoTypeId) {
		this.cargoTypeId = cargoTypeId;
	}

	public CargoType(long cargoTypeId, String cargoTypeCode, String cargoTypeName, String cargoTypeDescription,
			Set<Jobcard> jobcards) {
		this.cargoTypeId = cargoTypeId;
		this.cargoTypeCode = cargoTypeCode;
		this.cargoTypeName = cargoTypeName;
		this.cargoTypeDescription = cargoTypeDescription;
		this.jobcards = jobcards;
	}

	@Id

	@Column(name = "cargoTypeId", unique = true, nullable = false)
	public long getCargoTypeId() {
		return this.cargoTypeId;
	}

	public void setCargoTypeId(long cargoTypeId) {
		this.cargoTypeId = cargoTypeId;
	}

	@Column(name = "cargoTypeCode", length = 65)
	public String getCargoTypeCode() {
		return this.cargoTypeCode;
	}

	public void setCargoTypeCode(String cargoTypeCode) {
		this.cargoTypeCode = cargoTypeCode;
	}

	@Column(name = "cargoTypeName", length = 200)
	public String getCargoTypeName() {
		return this.cargoTypeName;
	}

	public void setCargoTypeName(String cargoTypeName) {
		this.cargoTypeName = cargoTypeName;
	}

	@Column(name = "cargoTypeDescription", length = 200)
	public String getCargoTypeDescription() {
		return this.cargoTypeDescription;
	}

	public void setCargoTypeDescription(String cargoTypeDescription) {
		this.cargoTypeDescription = cargoTypeDescription;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cargoType")
	public Set<Jobcard> getJobcards() {
		return this.jobcards;
	}

	public void setJobcards(Set<Jobcard> jobcards) {
		this.jobcards = jobcards;
	}

}
