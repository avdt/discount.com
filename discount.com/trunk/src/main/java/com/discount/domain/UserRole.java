package com.discount.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "role", uniqueConstraints = {
		@UniqueConstraint(columnNames = "id"),
		@UniqueConstraint(columnNames = "role") })
public class UserRole implements Serializable {

	private static final long serialVersionUID = 9132208605802998639L;

	@Id
	@SequenceGenerator(name = "id_seq", sequenceName = "user_role_id_seq")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "id_seq")
	private Integer id;

	@Column(name = "role", unique = true, nullable = false, length = 100)
	private String role;

	@ManyToMany(fetch = FetchType.EAGER, mappedBy = "roles")
	private List<User> users;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	@Override
	public boolean equals(Object obj) {
		boolean result = false;
		UserRole userRole;
		if (obj instanceof UserRole) {
			userRole = (UserRole) obj;

			if (this.getRole().equals(userRole.getRole())) {
				result = true;
			}
		}
		return result;
	}
}
