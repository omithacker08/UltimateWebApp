package com.webapp.project.modules.masters.model;
// Generated Jul 9, 2017 1:44:32 AM by Hibernate Tools 4.3.1.Final

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.webapp.project.framework.model.AppUser;

/**
 * Coloadermaster generated by hbm2java
 */
@Entity
@Table(name = "coloadermaster", catalog = "websystique")
public class CoLoader implements java.io.Serializable {

	private long coloaderId;
	private AppUser appUser;
	private String coloaderName;
	private String coloaderCode;
	private String address;
	private String contactNumber;
	private Date createDate;
	private Date modifiedDate;
	private Integer createUserId;
	private String createUsername;
	private String createUsertype;

	public CoLoader() {
	}

	public CoLoader(long coloaderId, Date modifiedDate) {
		this.coloaderId = coloaderId;
		this.modifiedDate = modifiedDate;
	}

	public CoLoader(long coloaderId, AppUser appUser, String coloaderName, String coloaderCode, String address,
			String contactNumber, Date createDate, Date modifiedDate, Integer createUserId, String createUsername,
			String createUsertype) {
		this.coloaderId = coloaderId;
		this.appUser = appUser;
		this.coloaderName = coloaderName;
		this.coloaderCode = coloaderCode;
		this.address = address;
		this.contactNumber = contactNumber;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
		this.createUserId = createUserId;
		this.createUsername = createUsername;
		this.createUsertype = createUsertype;
	}

	@Id

	@Column(name = "coloaderId", unique = true, nullable = false)
	public long getColoaderId() {
		return this.coloaderId;
	}

	public void setColoaderId(long coloaderId) {
		this.coloaderId = coloaderId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId")
	public AppUser getAppUser() {
		return this.appUser;
	}

	public void setAppUser(AppUser appUser) {
		this.appUser = appUser;
	}

	@Column(name = "coloaderName", length = 100)
	public String getColoaderName() {
		return this.coloaderName;
	}

	public void setColoaderName(String coloaderName) {
		this.coloaderName = coloaderName;
	}

	@Column(name = "coloaderCode", length = 65)
	public String getColoaderCode() {
		return this.coloaderCode;
	}

	public void setColoaderCode(String coloaderCode) {
		this.coloaderCode = coloaderCode;
	}

	@Column(name = "address", length = 200)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "contactNumber", length = 20)
	public String getContactNumber() {
		return this.contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date", length = 19)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "modified_date", nullable = false, length = 19)
	public Date getModifiedDate() {
		return this.modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	@Column(name = "create_userId")
	public Integer getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}

	@Column(name = "create_username", length = 65)
	public String getCreateUsername() {
		return this.createUsername;
	}

	public void setCreateUsername(String createUsername) {
		this.createUsername = createUsername;
	}

	@Column(name = "create_usertype", length = 20)
	public String getCreateUsertype() {
		return this.createUsertype;
	}

	public void setCreateUsertype(String createUsertype) {
		this.createUsertype = createUsertype;
	}

}