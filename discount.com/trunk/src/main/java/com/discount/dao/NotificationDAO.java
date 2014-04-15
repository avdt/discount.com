package com.discount.dao;

import com.discount.domain.Notification;
import com.discount.domain.NotificationType;

public interface NotificationDAO extends GenericDAO<Notification> {
	Notification findByType(NotificationType type);
}
