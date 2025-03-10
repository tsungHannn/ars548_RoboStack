;; Auto-generated. Do not edit!


(when (boundp 'ars548_messages::Object)
  (if (not (find-package "ARS548_MESSAGES"))
    (make-package "ARS548_MESSAGES"))
  (shadow 'Object (find-package "ARS548_MESSAGES")))
(unless (find-package "ARS548_MESSAGES::OBJECT")
  (make-package "ARS548_MESSAGES::OBJECT"))

(in-package "ROS")
;;//! \htmlinclude Object.msg.html


(defclass ars548_messages::Object
  :super ros::object
  :slots (_u_statussensor _u_id _u_age _u_statusmeasurement _u_statusmovement _u_position_invalidflags _u_position_reference _u_position_x _u_position_x_std _u_position_y _u_position_y_std _u_position_z _u_position_z_std _u_position_covariancexy _u_position_orientation _u_position_orientation_std _u_existence_invalidflags _u_existence_probability _u_existence_ppv _u_classification_car _u_classification_truck _u_classification_motorcycle _u_classification_bicycle _u_classification_pedestrian _u_classification_animal _u_classification_hazard _u_classification_unknown _u_classification_overdrivable _u_classification_underdrivable _u_dynamics_absvel_invalidflags _f_dynamics_absvel_x _f_dynamics_absvel_x_std _f_dynamics_absvel_y _f_dynamics_absvel_y_std _f_dynamics_absvel_covariancexy _u_dynamics_relvel_invalidflags _f_dynamics_relvel_x _f_dynamics_relvel_x_std _f_dynamics_relvel_y _f_dynamics_relvel_y_std _f_dynamics_relvel_covariancexy _u_dynamics_absaccel_invalidflags _f_dynamics_absaccel_x _f_dynamics_absaccel_x_std _f_dynamics_absaccel_y _f_dynamics_absaccel_y_std _f_dynamics_absaccel_covariancexy _u_dynamics_relaccel_invalidflags _f_dynamics_relaccel_x _f_dynamics_relaccel_x_std _f_dynamics_relaccel_y _f_dynamics_relaccel_y_std _f_dynamics_relaccel_covariancexy _u_dynamics_orientation_invalidflags _u_dynamics_orientation_rate_mean _u_dynamics_orientation_rate_std _u_shape_length_status _u_shape_length_edge_invalidflags _u_shape_length_edge_mean _u_shape_length_edge_std _u_shape_width_status _u_shape_width_edge_invalidflags _u_shape_width_edge_mean _u_shape_width_edge_std ))

(defmethod ars548_messages::Object
  (:init
   (&key
    ((:u_statussensor __u_statussensor) 0)
    ((:u_id __u_id) 0)
    ((:u_age __u_age) 0)
    ((:u_statusmeasurement __u_statusmeasurement) 0)
    ((:u_statusmovement __u_statusmovement) 0)
    ((:u_position_invalidflags __u_position_invalidflags) 0)
    ((:u_position_reference __u_position_reference) 0)
    ((:u_position_x __u_position_x) 0.0)
    ((:u_position_x_std __u_position_x_std) 0.0)
    ((:u_position_y __u_position_y) 0.0)
    ((:u_position_y_std __u_position_y_std) 0.0)
    ((:u_position_z __u_position_z) 0.0)
    ((:u_position_z_std __u_position_z_std) 0.0)
    ((:u_position_covariancexy __u_position_covariancexy) 0.0)
    ((:u_position_orientation __u_position_orientation) 0.0)
    ((:u_position_orientation_std __u_position_orientation_std) 0.0)
    ((:u_existence_invalidflags __u_existence_invalidflags) 0)
    ((:u_existence_probability __u_existence_probability) 0.0)
    ((:u_existence_ppv __u_existence_ppv) 0.0)
    ((:u_classification_car __u_classification_car) 0)
    ((:u_classification_truck __u_classification_truck) 0)
    ((:u_classification_motorcycle __u_classification_motorcycle) 0)
    ((:u_classification_bicycle __u_classification_bicycle) 0)
    ((:u_classification_pedestrian __u_classification_pedestrian) 0)
    ((:u_classification_animal __u_classification_animal) 0)
    ((:u_classification_hazard __u_classification_hazard) 0)
    ((:u_classification_unknown __u_classification_unknown) 0)
    ((:u_classification_overdrivable __u_classification_overdrivable) 0)
    ((:u_classification_underdrivable __u_classification_underdrivable) 0)
    ((:u_dynamics_absvel_invalidflags __u_dynamics_absvel_invalidflags) 0)
    ((:f_dynamics_absvel_x __f_dynamics_absvel_x) 0.0)
    ((:f_dynamics_absvel_x_std __f_dynamics_absvel_x_std) 0.0)
    ((:f_dynamics_absvel_y __f_dynamics_absvel_y) 0.0)
    ((:f_dynamics_absvel_y_std __f_dynamics_absvel_y_std) 0.0)
    ((:f_dynamics_absvel_covariancexy __f_dynamics_absvel_covariancexy) 0.0)
    ((:u_dynamics_relvel_invalidflags __u_dynamics_relvel_invalidflags) 0)
    ((:f_dynamics_relvel_x __f_dynamics_relvel_x) 0.0)
    ((:f_dynamics_relvel_x_std __f_dynamics_relvel_x_std) 0.0)
    ((:f_dynamics_relvel_y __f_dynamics_relvel_y) 0.0)
    ((:f_dynamics_relvel_y_std __f_dynamics_relvel_y_std) 0.0)
    ((:f_dynamics_relvel_covariancexy __f_dynamics_relvel_covariancexy) 0.0)
    ((:u_dynamics_absaccel_invalidflags __u_dynamics_absaccel_invalidflags) 0)
    ((:f_dynamics_absaccel_x __f_dynamics_absaccel_x) 0.0)
    ((:f_dynamics_absaccel_x_std __f_dynamics_absaccel_x_std) 0.0)
    ((:f_dynamics_absaccel_y __f_dynamics_absaccel_y) 0.0)
    ((:f_dynamics_absaccel_y_std __f_dynamics_absaccel_y_std) 0.0)
    ((:f_dynamics_absaccel_covariancexy __f_dynamics_absaccel_covariancexy) 0.0)
    ((:u_dynamics_relaccel_invalidflags __u_dynamics_relaccel_invalidflags) 0)
    ((:f_dynamics_relaccel_x __f_dynamics_relaccel_x) 0.0)
    ((:f_dynamics_relaccel_x_std __f_dynamics_relaccel_x_std) 0.0)
    ((:f_dynamics_relaccel_y __f_dynamics_relaccel_y) 0.0)
    ((:f_dynamics_relaccel_y_std __f_dynamics_relaccel_y_std) 0.0)
    ((:f_dynamics_relaccel_covariancexy __f_dynamics_relaccel_covariancexy) 0.0)
    ((:u_dynamics_orientation_invalidflags __u_dynamics_orientation_invalidflags) 0)
    ((:u_dynamics_orientation_rate_mean __u_dynamics_orientation_rate_mean) 0.0)
    ((:u_dynamics_orientation_rate_std __u_dynamics_orientation_rate_std) 0.0)
    ((:u_shape_length_status __u_shape_length_status) 0)
    ((:u_shape_length_edge_invalidflags __u_shape_length_edge_invalidflags) 0)
    ((:u_shape_length_edge_mean __u_shape_length_edge_mean) 0.0)
    ((:u_shape_length_edge_std __u_shape_length_edge_std) 0.0)
    ((:u_shape_width_status __u_shape_width_status) 0)
    ((:u_shape_width_edge_invalidflags __u_shape_width_edge_invalidflags) 0)
    ((:u_shape_width_edge_mean __u_shape_width_edge_mean) 0.0)
    ((:u_shape_width_edge_std __u_shape_width_edge_std) 0.0)
    )
   (send-super :init)
   (setq _u_statussensor (round __u_statussensor))
   (setq _u_id (round __u_id))
   (setq _u_age (round __u_age))
   (setq _u_statusmeasurement (round __u_statusmeasurement))
   (setq _u_statusmovement (round __u_statusmovement))
   (setq _u_position_invalidflags (round __u_position_invalidflags))
   (setq _u_position_reference (round __u_position_reference))
   (setq _u_position_x (float __u_position_x))
   (setq _u_position_x_std (float __u_position_x_std))
   (setq _u_position_y (float __u_position_y))
   (setq _u_position_y_std (float __u_position_y_std))
   (setq _u_position_z (float __u_position_z))
   (setq _u_position_z_std (float __u_position_z_std))
   (setq _u_position_covariancexy (float __u_position_covariancexy))
   (setq _u_position_orientation (float __u_position_orientation))
   (setq _u_position_orientation_std (float __u_position_orientation_std))
   (setq _u_existence_invalidflags (round __u_existence_invalidflags))
   (setq _u_existence_probability (float __u_existence_probability))
   (setq _u_existence_ppv (float __u_existence_ppv))
   (setq _u_classification_car (round __u_classification_car))
   (setq _u_classification_truck (round __u_classification_truck))
   (setq _u_classification_motorcycle (round __u_classification_motorcycle))
   (setq _u_classification_bicycle (round __u_classification_bicycle))
   (setq _u_classification_pedestrian (round __u_classification_pedestrian))
   (setq _u_classification_animal (round __u_classification_animal))
   (setq _u_classification_hazard (round __u_classification_hazard))
   (setq _u_classification_unknown (round __u_classification_unknown))
   (setq _u_classification_overdrivable (round __u_classification_overdrivable))
   (setq _u_classification_underdrivable (round __u_classification_underdrivable))
   (setq _u_dynamics_absvel_invalidflags (round __u_dynamics_absvel_invalidflags))
   (setq _f_dynamics_absvel_x (float __f_dynamics_absvel_x))
   (setq _f_dynamics_absvel_x_std (float __f_dynamics_absvel_x_std))
   (setq _f_dynamics_absvel_y (float __f_dynamics_absvel_y))
   (setq _f_dynamics_absvel_y_std (float __f_dynamics_absvel_y_std))
   (setq _f_dynamics_absvel_covariancexy (float __f_dynamics_absvel_covariancexy))
   (setq _u_dynamics_relvel_invalidflags (round __u_dynamics_relvel_invalidflags))
   (setq _f_dynamics_relvel_x (float __f_dynamics_relvel_x))
   (setq _f_dynamics_relvel_x_std (float __f_dynamics_relvel_x_std))
   (setq _f_dynamics_relvel_y (float __f_dynamics_relvel_y))
   (setq _f_dynamics_relvel_y_std (float __f_dynamics_relvel_y_std))
   (setq _f_dynamics_relvel_covariancexy (float __f_dynamics_relvel_covariancexy))
   (setq _u_dynamics_absaccel_invalidflags (round __u_dynamics_absaccel_invalidflags))
   (setq _f_dynamics_absaccel_x (float __f_dynamics_absaccel_x))
   (setq _f_dynamics_absaccel_x_std (float __f_dynamics_absaccel_x_std))
   (setq _f_dynamics_absaccel_y (float __f_dynamics_absaccel_y))
   (setq _f_dynamics_absaccel_y_std (float __f_dynamics_absaccel_y_std))
   (setq _f_dynamics_absaccel_covariancexy (float __f_dynamics_absaccel_covariancexy))
   (setq _u_dynamics_relaccel_invalidflags (round __u_dynamics_relaccel_invalidflags))
   (setq _f_dynamics_relaccel_x (float __f_dynamics_relaccel_x))
   (setq _f_dynamics_relaccel_x_std (float __f_dynamics_relaccel_x_std))
   (setq _f_dynamics_relaccel_y (float __f_dynamics_relaccel_y))
   (setq _f_dynamics_relaccel_y_std (float __f_dynamics_relaccel_y_std))
   (setq _f_dynamics_relaccel_covariancexy (float __f_dynamics_relaccel_covariancexy))
   (setq _u_dynamics_orientation_invalidflags (round __u_dynamics_orientation_invalidflags))
   (setq _u_dynamics_orientation_rate_mean (float __u_dynamics_orientation_rate_mean))
   (setq _u_dynamics_orientation_rate_std (float __u_dynamics_orientation_rate_std))
   (setq _u_shape_length_status (round __u_shape_length_status))
   (setq _u_shape_length_edge_invalidflags (round __u_shape_length_edge_invalidflags))
   (setq _u_shape_length_edge_mean (float __u_shape_length_edge_mean))
   (setq _u_shape_length_edge_std (float __u_shape_length_edge_std))
   (setq _u_shape_width_status (round __u_shape_width_status))
   (setq _u_shape_width_edge_invalidflags (round __u_shape_width_edge_invalidflags))
   (setq _u_shape_width_edge_mean (float __u_shape_width_edge_mean))
   (setq _u_shape_width_edge_std (float __u_shape_width_edge_std))
   self)
  (:u_statussensor
   (&optional __u_statussensor)
   (if __u_statussensor (setq _u_statussensor __u_statussensor)) _u_statussensor)
  (:u_id
   (&optional __u_id)
   (if __u_id (setq _u_id __u_id)) _u_id)
  (:u_age
   (&optional __u_age)
   (if __u_age (setq _u_age __u_age)) _u_age)
  (:u_statusmeasurement
   (&optional __u_statusmeasurement)
   (if __u_statusmeasurement (setq _u_statusmeasurement __u_statusmeasurement)) _u_statusmeasurement)
  (:u_statusmovement
   (&optional __u_statusmovement)
   (if __u_statusmovement (setq _u_statusmovement __u_statusmovement)) _u_statusmovement)
  (:u_position_invalidflags
   (&optional __u_position_invalidflags)
   (if __u_position_invalidflags (setq _u_position_invalidflags __u_position_invalidflags)) _u_position_invalidflags)
  (:u_position_reference
   (&optional __u_position_reference)
   (if __u_position_reference (setq _u_position_reference __u_position_reference)) _u_position_reference)
  (:u_position_x
   (&optional __u_position_x)
   (if __u_position_x (setq _u_position_x __u_position_x)) _u_position_x)
  (:u_position_x_std
   (&optional __u_position_x_std)
   (if __u_position_x_std (setq _u_position_x_std __u_position_x_std)) _u_position_x_std)
  (:u_position_y
   (&optional __u_position_y)
   (if __u_position_y (setq _u_position_y __u_position_y)) _u_position_y)
  (:u_position_y_std
   (&optional __u_position_y_std)
   (if __u_position_y_std (setq _u_position_y_std __u_position_y_std)) _u_position_y_std)
  (:u_position_z
   (&optional __u_position_z)
   (if __u_position_z (setq _u_position_z __u_position_z)) _u_position_z)
  (:u_position_z_std
   (&optional __u_position_z_std)
   (if __u_position_z_std (setq _u_position_z_std __u_position_z_std)) _u_position_z_std)
  (:u_position_covariancexy
   (&optional __u_position_covariancexy)
   (if __u_position_covariancexy (setq _u_position_covariancexy __u_position_covariancexy)) _u_position_covariancexy)
  (:u_position_orientation
   (&optional __u_position_orientation)
   (if __u_position_orientation (setq _u_position_orientation __u_position_orientation)) _u_position_orientation)
  (:u_position_orientation_std
   (&optional __u_position_orientation_std)
   (if __u_position_orientation_std (setq _u_position_orientation_std __u_position_orientation_std)) _u_position_orientation_std)
  (:u_existence_invalidflags
   (&optional __u_existence_invalidflags)
   (if __u_existence_invalidflags (setq _u_existence_invalidflags __u_existence_invalidflags)) _u_existence_invalidflags)
  (:u_existence_probability
   (&optional __u_existence_probability)
   (if __u_existence_probability (setq _u_existence_probability __u_existence_probability)) _u_existence_probability)
  (:u_existence_ppv
   (&optional __u_existence_ppv)
   (if __u_existence_ppv (setq _u_existence_ppv __u_existence_ppv)) _u_existence_ppv)
  (:u_classification_car
   (&optional __u_classification_car)
   (if __u_classification_car (setq _u_classification_car __u_classification_car)) _u_classification_car)
  (:u_classification_truck
   (&optional __u_classification_truck)
   (if __u_classification_truck (setq _u_classification_truck __u_classification_truck)) _u_classification_truck)
  (:u_classification_motorcycle
   (&optional __u_classification_motorcycle)
   (if __u_classification_motorcycle (setq _u_classification_motorcycle __u_classification_motorcycle)) _u_classification_motorcycle)
  (:u_classification_bicycle
   (&optional __u_classification_bicycle)
   (if __u_classification_bicycle (setq _u_classification_bicycle __u_classification_bicycle)) _u_classification_bicycle)
  (:u_classification_pedestrian
   (&optional __u_classification_pedestrian)
   (if __u_classification_pedestrian (setq _u_classification_pedestrian __u_classification_pedestrian)) _u_classification_pedestrian)
  (:u_classification_animal
   (&optional __u_classification_animal)
   (if __u_classification_animal (setq _u_classification_animal __u_classification_animal)) _u_classification_animal)
  (:u_classification_hazard
   (&optional __u_classification_hazard)
   (if __u_classification_hazard (setq _u_classification_hazard __u_classification_hazard)) _u_classification_hazard)
  (:u_classification_unknown
   (&optional __u_classification_unknown)
   (if __u_classification_unknown (setq _u_classification_unknown __u_classification_unknown)) _u_classification_unknown)
  (:u_classification_overdrivable
   (&optional __u_classification_overdrivable)
   (if __u_classification_overdrivable (setq _u_classification_overdrivable __u_classification_overdrivable)) _u_classification_overdrivable)
  (:u_classification_underdrivable
   (&optional __u_classification_underdrivable)
   (if __u_classification_underdrivable (setq _u_classification_underdrivable __u_classification_underdrivable)) _u_classification_underdrivable)
  (:u_dynamics_absvel_invalidflags
   (&optional __u_dynamics_absvel_invalidflags)
   (if __u_dynamics_absvel_invalidflags (setq _u_dynamics_absvel_invalidflags __u_dynamics_absvel_invalidflags)) _u_dynamics_absvel_invalidflags)
  (:f_dynamics_absvel_x
   (&optional __f_dynamics_absvel_x)
   (if __f_dynamics_absvel_x (setq _f_dynamics_absvel_x __f_dynamics_absvel_x)) _f_dynamics_absvel_x)
  (:f_dynamics_absvel_x_std
   (&optional __f_dynamics_absvel_x_std)
   (if __f_dynamics_absvel_x_std (setq _f_dynamics_absvel_x_std __f_dynamics_absvel_x_std)) _f_dynamics_absvel_x_std)
  (:f_dynamics_absvel_y
   (&optional __f_dynamics_absvel_y)
   (if __f_dynamics_absvel_y (setq _f_dynamics_absvel_y __f_dynamics_absvel_y)) _f_dynamics_absvel_y)
  (:f_dynamics_absvel_y_std
   (&optional __f_dynamics_absvel_y_std)
   (if __f_dynamics_absvel_y_std (setq _f_dynamics_absvel_y_std __f_dynamics_absvel_y_std)) _f_dynamics_absvel_y_std)
  (:f_dynamics_absvel_covariancexy
   (&optional __f_dynamics_absvel_covariancexy)
   (if __f_dynamics_absvel_covariancexy (setq _f_dynamics_absvel_covariancexy __f_dynamics_absvel_covariancexy)) _f_dynamics_absvel_covariancexy)
  (:u_dynamics_relvel_invalidflags
   (&optional __u_dynamics_relvel_invalidflags)
   (if __u_dynamics_relvel_invalidflags (setq _u_dynamics_relvel_invalidflags __u_dynamics_relvel_invalidflags)) _u_dynamics_relvel_invalidflags)
  (:f_dynamics_relvel_x
   (&optional __f_dynamics_relvel_x)
   (if __f_dynamics_relvel_x (setq _f_dynamics_relvel_x __f_dynamics_relvel_x)) _f_dynamics_relvel_x)
  (:f_dynamics_relvel_x_std
   (&optional __f_dynamics_relvel_x_std)
   (if __f_dynamics_relvel_x_std (setq _f_dynamics_relvel_x_std __f_dynamics_relvel_x_std)) _f_dynamics_relvel_x_std)
  (:f_dynamics_relvel_y
   (&optional __f_dynamics_relvel_y)
   (if __f_dynamics_relvel_y (setq _f_dynamics_relvel_y __f_dynamics_relvel_y)) _f_dynamics_relvel_y)
  (:f_dynamics_relvel_y_std
   (&optional __f_dynamics_relvel_y_std)
   (if __f_dynamics_relvel_y_std (setq _f_dynamics_relvel_y_std __f_dynamics_relvel_y_std)) _f_dynamics_relvel_y_std)
  (:f_dynamics_relvel_covariancexy
   (&optional __f_dynamics_relvel_covariancexy)
   (if __f_dynamics_relvel_covariancexy (setq _f_dynamics_relvel_covariancexy __f_dynamics_relvel_covariancexy)) _f_dynamics_relvel_covariancexy)
  (:u_dynamics_absaccel_invalidflags
   (&optional __u_dynamics_absaccel_invalidflags)
   (if __u_dynamics_absaccel_invalidflags (setq _u_dynamics_absaccel_invalidflags __u_dynamics_absaccel_invalidflags)) _u_dynamics_absaccel_invalidflags)
  (:f_dynamics_absaccel_x
   (&optional __f_dynamics_absaccel_x)
   (if __f_dynamics_absaccel_x (setq _f_dynamics_absaccel_x __f_dynamics_absaccel_x)) _f_dynamics_absaccel_x)
  (:f_dynamics_absaccel_x_std
   (&optional __f_dynamics_absaccel_x_std)
   (if __f_dynamics_absaccel_x_std (setq _f_dynamics_absaccel_x_std __f_dynamics_absaccel_x_std)) _f_dynamics_absaccel_x_std)
  (:f_dynamics_absaccel_y
   (&optional __f_dynamics_absaccel_y)
   (if __f_dynamics_absaccel_y (setq _f_dynamics_absaccel_y __f_dynamics_absaccel_y)) _f_dynamics_absaccel_y)
  (:f_dynamics_absaccel_y_std
   (&optional __f_dynamics_absaccel_y_std)
   (if __f_dynamics_absaccel_y_std (setq _f_dynamics_absaccel_y_std __f_dynamics_absaccel_y_std)) _f_dynamics_absaccel_y_std)
  (:f_dynamics_absaccel_covariancexy
   (&optional __f_dynamics_absaccel_covariancexy)
   (if __f_dynamics_absaccel_covariancexy (setq _f_dynamics_absaccel_covariancexy __f_dynamics_absaccel_covariancexy)) _f_dynamics_absaccel_covariancexy)
  (:u_dynamics_relaccel_invalidflags
   (&optional __u_dynamics_relaccel_invalidflags)
   (if __u_dynamics_relaccel_invalidflags (setq _u_dynamics_relaccel_invalidflags __u_dynamics_relaccel_invalidflags)) _u_dynamics_relaccel_invalidflags)
  (:f_dynamics_relaccel_x
   (&optional __f_dynamics_relaccel_x)
   (if __f_dynamics_relaccel_x (setq _f_dynamics_relaccel_x __f_dynamics_relaccel_x)) _f_dynamics_relaccel_x)
  (:f_dynamics_relaccel_x_std
   (&optional __f_dynamics_relaccel_x_std)
   (if __f_dynamics_relaccel_x_std (setq _f_dynamics_relaccel_x_std __f_dynamics_relaccel_x_std)) _f_dynamics_relaccel_x_std)
  (:f_dynamics_relaccel_y
   (&optional __f_dynamics_relaccel_y)
   (if __f_dynamics_relaccel_y (setq _f_dynamics_relaccel_y __f_dynamics_relaccel_y)) _f_dynamics_relaccel_y)
  (:f_dynamics_relaccel_y_std
   (&optional __f_dynamics_relaccel_y_std)
   (if __f_dynamics_relaccel_y_std (setq _f_dynamics_relaccel_y_std __f_dynamics_relaccel_y_std)) _f_dynamics_relaccel_y_std)
  (:f_dynamics_relaccel_covariancexy
   (&optional __f_dynamics_relaccel_covariancexy)
   (if __f_dynamics_relaccel_covariancexy (setq _f_dynamics_relaccel_covariancexy __f_dynamics_relaccel_covariancexy)) _f_dynamics_relaccel_covariancexy)
  (:u_dynamics_orientation_invalidflags
   (&optional __u_dynamics_orientation_invalidflags)
   (if __u_dynamics_orientation_invalidflags (setq _u_dynamics_orientation_invalidflags __u_dynamics_orientation_invalidflags)) _u_dynamics_orientation_invalidflags)
  (:u_dynamics_orientation_rate_mean
   (&optional __u_dynamics_orientation_rate_mean)
   (if __u_dynamics_orientation_rate_mean (setq _u_dynamics_orientation_rate_mean __u_dynamics_orientation_rate_mean)) _u_dynamics_orientation_rate_mean)
  (:u_dynamics_orientation_rate_std
   (&optional __u_dynamics_orientation_rate_std)
   (if __u_dynamics_orientation_rate_std (setq _u_dynamics_orientation_rate_std __u_dynamics_orientation_rate_std)) _u_dynamics_orientation_rate_std)
  (:u_shape_length_status
   (&optional __u_shape_length_status)
   (if __u_shape_length_status (setq _u_shape_length_status __u_shape_length_status)) _u_shape_length_status)
  (:u_shape_length_edge_invalidflags
   (&optional __u_shape_length_edge_invalidflags)
   (if __u_shape_length_edge_invalidflags (setq _u_shape_length_edge_invalidflags __u_shape_length_edge_invalidflags)) _u_shape_length_edge_invalidflags)
  (:u_shape_length_edge_mean
   (&optional __u_shape_length_edge_mean)
   (if __u_shape_length_edge_mean (setq _u_shape_length_edge_mean __u_shape_length_edge_mean)) _u_shape_length_edge_mean)
  (:u_shape_length_edge_std
   (&optional __u_shape_length_edge_std)
   (if __u_shape_length_edge_std (setq _u_shape_length_edge_std __u_shape_length_edge_std)) _u_shape_length_edge_std)
  (:u_shape_width_status
   (&optional __u_shape_width_status)
   (if __u_shape_width_status (setq _u_shape_width_status __u_shape_width_status)) _u_shape_width_status)
  (:u_shape_width_edge_invalidflags
   (&optional __u_shape_width_edge_invalidflags)
   (if __u_shape_width_edge_invalidflags (setq _u_shape_width_edge_invalidflags __u_shape_width_edge_invalidflags)) _u_shape_width_edge_invalidflags)
  (:u_shape_width_edge_mean
   (&optional __u_shape_width_edge_mean)
   (if __u_shape_width_edge_mean (setq _u_shape_width_edge_mean __u_shape_width_edge_mean)) _u_shape_width_edge_mean)
  (:u_shape_width_edge_std
   (&optional __u_shape_width_edge_std)
   (if __u_shape_width_edge_std (setq _u_shape_width_edge_std __u_shape_width_edge_std)) _u_shape_width_edge_std)
  (:serialization-length
   ()
   (+
    ;; uint16 _u_statussensor
    2
    ;; uint32 _u_id
    4
    ;; uint16 _u_age
    2
    ;; uint8 _u_statusmeasurement
    1
    ;; uint8 _u_statusmovement
    1
    ;; uint16 _u_position_invalidflags
    2
    ;; uint8 _u_position_reference
    1
    ;; float32 _u_position_x
    4
    ;; float32 _u_position_x_std
    4
    ;; float32 _u_position_y
    4
    ;; float32 _u_position_y_std
    4
    ;; float32 _u_position_z
    4
    ;; float32 _u_position_z_std
    4
    ;; float32 _u_position_covariancexy
    4
    ;; float32 _u_position_orientation
    4
    ;; float32 _u_position_orientation_std
    4
    ;; uint8 _u_existence_invalidflags
    1
    ;; float32 _u_existence_probability
    4
    ;; float32 _u_existence_ppv
    4
    ;; uint8 _u_classification_car
    1
    ;; uint8 _u_classification_truck
    1
    ;; uint8 _u_classification_motorcycle
    1
    ;; uint8 _u_classification_bicycle
    1
    ;; uint8 _u_classification_pedestrian
    1
    ;; uint8 _u_classification_animal
    1
    ;; uint8 _u_classification_hazard
    1
    ;; uint8 _u_classification_unknown
    1
    ;; uint8 _u_classification_overdrivable
    1
    ;; uint8 _u_classification_underdrivable
    1
    ;; uint8 _u_dynamics_absvel_invalidflags
    1
    ;; float32 _f_dynamics_absvel_x
    4
    ;; float32 _f_dynamics_absvel_x_std
    4
    ;; float32 _f_dynamics_absvel_y
    4
    ;; float32 _f_dynamics_absvel_y_std
    4
    ;; float32 _f_dynamics_absvel_covariancexy
    4
    ;; uint8 _u_dynamics_relvel_invalidflags
    1
    ;; float32 _f_dynamics_relvel_x
    4
    ;; float32 _f_dynamics_relvel_x_std
    4
    ;; float32 _f_dynamics_relvel_y
    4
    ;; float32 _f_dynamics_relvel_y_std
    4
    ;; float32 _f_dynamics_relvel_covariancexy
    4
    ;; uint8 _u_dynamics_absaccel_invalidflags
    1
    ;; float32 _f_dynamics_absaccel_x
    4
    ;; float32 _f_dynamics_absaccel_x_std
    4
    ;; float32 _f_dynamics_absaccel_y
    4
    ;; float32 _f_dynamics_absaccel_y_std
    4
    ;; float32 _f_dynamics_absaccel_covariancexy
    4
    ;; uint8 _u_dynamics_relaccel_invalidflags
    1
    ;; float32 _f_dynamics_relaccel_x
    4
    ;; float32 _f_dynamics_relaccel_x_std
    4
    ;; float32 _f_dynamics_relaccel_y
    4
    ;; float32 _f_dynamics_relaccel_y_std
    4
    ;; float32 _f_dynamics_relaccel_covariancexy
    4
    ;; uint8 _u_dynamics_orientation_invalidflags
    1
    ;; float32 _u_dynamics_orientation_rate_mean
    4
    ;; float32 _u_dynamics_orientation_rate_std
    4
    ;; uint32 _u_shape_length_status
    4
    ;; uint8 _u_shape_length_edge_invalidflags
    1
    ;; float32 _u_shape_length_edge_mean
    4
    ;; float32 _u_shape_length_edge_std
    4
    ;; uint32 _u_shape_width_status
    4
    ;; uint8 _u_shape_width_edge_invalidflags
    1
    ;; float32 _u_shape_width_edge_mean
    4
    ;; float32 _u_shape_width_edge_std
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _u_statussensor
       (write-word _u_statussensor s)
     ;; uint32 _u_id
       (write-long _u_id s)
     ;; uint16 _u_age
       (write-word _u_age s)
     ;; uint8 _u_statusmeasurement
       (write-byte _u_statusmeasurement s)
     ;; uint8 _u_statusmovement
       (write-byte _u_statusmovement s)
     ;; uint16 _u_position_invalidflags
       (write-word _u_position_invalidflags s)
     ;; uint8 _u_position_reference
       (write-byte _u_position_reference s)
     ;; float32 _u_position_x
       (sys::poke _u_position_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _u_position_x_std
       (sys::poke _u_position_x_std (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _u_position_y
       (sys::poke _u_position_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _u_position_y_std
       (sys::poke _u_position_y_std (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _u_position_z
       (sys::poke _u_position_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _u_position_z_std
       (sys::poke _u_position_z_std (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _u_position_covariancexy
       (sys::poke _u_position_covariancexy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _u_position_orientation
       (sys::poke _u_position_orientation (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _u_position_orientation_std
       (sys::poke _u_position_orientation_std (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _u_existence_invalidflags
       (write-byte _u_existence_invalidflags s)
     ;; float32 _u_existence_probability
       (sys::poke _u_existence_probability (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _u_existence_ppv
       (sys::poke _u_existence_ppv (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _u_classification_car
       (write-byte _u_classification_car s)
     ;; uint8 _u_classification_truck
       (write-byte _u_classification_truck s)
     ;; uint8 _u_classification_motorcycle
       (write-byte _u_classification_motorcycle s)
     ;; uint8 _u_classification_bicycle
       (write-byte _u_classification_bicycle s)
     ;; uint8 _u_classification_pedestrian
       (write-byte _u_classification_pedestrian s)
     ;; uint8 _u_classification_animal
       (write-byte _u_classification_animal s)
     ;; uint8 _u_classification_hazard
       (write-byte _u_classification_hazard s)
     ;; uint8 _u_classification_unknown
       (write-byte _u_classification_unknown s)
     ;; uint8 _u_classification_overdrivable
       (write-byte _u_classification_overdrivable s)
     ;; uint8 _u_classification_underdrivable
       (write-byte _u_classification_underdrivable s)
     ;; uint8 _u_dynamics_absvel_invalidflags
       (write-byte _u_dynamics_absvel_invalidflags s)
     ;; float32 _f_dynamics_absvel_x
       (sys::poke _f_dynamics_absvel_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_dynamics_absvel_x_std
       (sys::poke _f_dynamics_absvel_x_std (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_dynamics_absvel_y
       (sys::poke _f_dynamics_absvel_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_dynamics_absvel_y_std
       (sys::poke _f_dynamics_absvel_y_std (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_dynamics_absvel_covariancexy
       (sys::poke _f_dynamics_absvel_covariancexy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _u_dynamics_relvel_invalidflags
       (write-byte _u_dynamics_relvel_invalidflags s)
     ;; float32 _f_dynamics_relvel_x
       (sys::poke _f_dynamics_relvel_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_dynamics_relvel_x_std
       (sys::poke _f_dynamics_relvel_x_std (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_dynamics_relvel_y
       (sys::poke _f_dynamics_relvel_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_dynamics_relvel_y_std
       (sys::poke _f_dynamics_relvel_y_std (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_dynamics_relvel_covariancexy
       (sys::poke _f_dynamics_relvel_covariancexy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _u_dynamics_absaccel_invalidflags
       (write-byte _u_dynamics_absaccel_invalidflags s)
     ;; float32 _f_dynamics_absaccel_x
       (sys::poke _f_dynamics_absaccel_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_dynamics_absaccel_x_std
       (sys::poke _f_dynamics_absaccel_x_std (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_dynamics_absaccel_y
       (sys::poke _f_dynamics_absaccel_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_dynamics_absaccel_y_std
       (sys::poke _f_dynamics_absaccel_y_std (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_dynamics_absaccel_covariancexy
       (sys::poke _f_dynamics_absaccel_covariancexy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _u_dynamics_relaccel_invalidflags
       (write-byte _u_dynamics_relaccel_invalidflags s)
     ;; float32 _f_dynamics_relaccel_x
       (sys::poke _f_dynamics_relaccel_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_dynamics_relaccel_x_std
       (sys::poke _f_dynamics_relaccel_x_std (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_dynamics_relaccel_y
       (sys::poke _f_dynamics_relaccel_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_dynamics_relaccel_y_std
       (sys::poke _f_dynamics_relaccel_y_std (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f_dynamics_relaccel_covariancexy
       (sys::poke _f_dynamics_relaccel_covariancexy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _u_dynamics_orientation_invalidflags
       (write-byte _u_dynamics_orientation_invalidflags s)
     ;; float32 _u_dynamics_orientation_rate_mean
       (sys::poke _u_dynamics_orientation_rate_mean (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _u_dynamics_orientation_rate_std
       (sys::poke _u_dynamics_orientation_rate_std (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint32 _u_shape_length_status
       (write-long _u_shape_length_status s)
     ;; uint8 _u_shape_length_edge_invalidflags
       (write-byte _u_shape_length_edge_invalidflags s)
     ;; float32 _u_shape_length_edge_mean
       (sys::poke _u_shape_length_edge_mean (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _u_shape_length_edge_std
       (sys::poke _u_shape_length_edge_std (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint32 _u_shape_width_status
       (write-long _u_shape_width_status s)
     ;; uint8 _u_shape_width_edge_invalidflags
       (write-byte _u_shape_width_edge_invalidflags s)
     ;; float32 _u_shape_width_edge_mean
       (sys::poke _u_shape_width_edge_mean (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _u_shape_width_edge_std
       (sys::poke _u_shape_width_edge_std (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _u_statussensor
     (setq _u_statussensor (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint32 _u_id
     (setq _u_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16 _u_age
     (setq _u_age (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _u_statusmeasurement
     (setq _u_statusmeasurement (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _u_statusmovement
     (setq _u_statusmovement (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _u_position_invalidflags
     (setq _u_position_invalidflags (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _u_position_reference
     (setq _u_position_reference (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _u_position_x
     (setq _u_position_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _u_position_x_std
     (setq _u_position_x_std (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _u_position_y
     (setq _u_position_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _u_position_y_std
     (setq _u_position_y_std (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _u_position_z
     (setq _u_position_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _u_position_z_std
     (setq _u_position_z_std (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _u_position_covariancexy
     (setq _u_position_covariancexy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _u_position_orientation
     (setq _u_position_orientation (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _u_position_orientation_std
     (setq _u_position_orientation_std (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _u_existence_invalidflags
     (setq _u_existence_invalidflags (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _u_existence_probability
     (setq _u_existence_probability (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _u_existence_ppv
     (setq _u_existence_ppv (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _u_classification_car
     (setq _u_classification_car (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _u_classification_truck
     (setq _u_classification_truck (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _u_classification_motorcycle
     (setq _u_classification_motorcycle (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _u_classification_bicycle
     (setq _u_classification_bicycle (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _u_classification_pedestrian
     (setq _u_classification_pedestrian (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _u_classification_animal
     (setq _u_classification_animal (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _u_classification_hazard
     (setq _u_classification_hazard (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _u_classification_unknown
     (setq _u_classification_unknown (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _u_classification_overdrivable
     (setq _u_classification_overdrivable (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _u_classification_underdrivable
     (setq _u_classification_underdrivable (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _u_dynamics_absvel_invalidflags
     (setq _u_dynamics_absvel_invalidflags (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _f_dynamics_absvel_x
     (setq _f_dynamics_absvel_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_dynamics_absvel_x_std
     (setq _f_dynamics_absvel_x_std (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_dynamics_absvel_y
     (setq _f_dynamics_absvel_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_dynamics_absvel_y_std
     (setq _f_dynamics_absvel_y_std (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_dynamics_absvel_covariancexy
     (setq _f_dynamics_absvel_covariancexy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _u_dynamics_relvel_invalidflags
     (setq _u_dynamics_relvel_invalidflags (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _f_dynamics_relvel_x
     (setq _f_dynamics_relvel_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_dynamics_relvel_x_std
     (setq _f_dynamics_relvel_x_std (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_dynamics_relvel_y
     (setq _f_dynamics_relvel_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_dynamics_relvel_y_std
     (setq _f_dynamics_relvel_y_std (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_dynamics_relvel_covariancexy
     (setq _f_dynamics_relvel_covariancexy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _u_dynamics_absaccel_invalidflags
     (setq _u_dynamics_absaccel_invalidflags (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _f_dynamics_absaccel_x
     (setq _f_dynamics_absaccel_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_dynamics_absaccel_x_std
     (setq _f_dynamics_absaccel_x_std (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_dynamics_absaccel_y
     (setq _f_dynamics_absaccel_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_dynamics_absaccel_y_std
     (setq _f_dynamics_absaccel_y_std (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_dynamics_absaccel_covariancexy
     (setq _f_dynamics_absaccel_covariancexy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _u_dynamics_relaccel_invalidflags
     (setq _u_dynamics_relaccel_invalidflags (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _f_dynamics_relaccel_x
     (setq _f_dynamics_relaccel_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_dynamics_relaccel_x_std
     (setq _f_dynamics_relaccel_x_std (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_dynamics_relaccel_y
     (setq _f_dynamics_relaccel_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_dynamics_relaccel_y_std
     (setq _f_dynamics_relaccel_y_std (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f_dynamics_relaccel_covariancexy
     (setq _f_dynamics_relaccel_covariancexy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _u_dynamics_orientation_invalidflags
     (setq _u_dynamics_orientation_invalidflags (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _u_dynamics_orientation_rate_mean
     (setq _u_dynamics_orientation_rate_mean (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _u_dynamics_orientation_rate_std
     (setq _u_dynamics_orientation_rate_std (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint32 _u_shape_length_status
     (setq _u_shape_length_status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _u_shape_length_edge_invalidflags
     (setq _u_shape_length_edge_invalidflags (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _u_shape_length_edge_mean
     (setq _u_shape_length_edge_mean (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _u_shape_length_edge_std
     (setq _u_shape_length_edge_std (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint32 _u_shape_width_status
     (setq _u_shape_width_status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _u_shape_width_edge_invalidflags
     (setq _u_shape_width_edge_invalidflags (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _u_shape_width_edge_mean
     (setq _u_shape_width_edge_mean (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _u_shape_width_edge_std
     (setq _u_shape_width_edge_std (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ars548_messages::Object :md5sum-) "7a6bf48af76a68f467d67dd7b1137272")
(setf (get ars548_messages::Object :datatype-) "ars548_messages/Object")
(setf (get ars548_messages::Object :definition-)
      "uint16 u_statussensor #tbd
uint32 u_id #Unique ID of object
uint16 u_age #Age of object
uint8 u_statusmeasurement #Object Status
uint8 u_statusmovement #Object Movement Status
uint16 u_position_invalidflags #tbd
uint8 u_position_reference #Reference point position
float32 u_position_x #X Position of reference point
float32 u_position_x_std #X Position Std
float32 u_position_y #Y Position of reference point
float32 u_position_y_std #Y Position Std
float32 u_position_z #Z Position of reference point
float32 u_position_z_std #Z Position Std
float32 u_position_covariancexy #Covariance X Y
float32 u_position_orientation #Object Orientation
float32 u_position_orientation_std #Orientation Std
uint8 u_existence_invalidflags #unused
float32 u_existence_probability #Probability of Existence
float32 u_existence_ppv #unused
uint8 u_classification_car #Car Classification Probability
uint8 u_classification_truck #Truck Classification Probability
uint8 u_classification_motorcycle #Motorcycle Classification Probability
uint8 u_classification_bicycle #Bicycle Classification Probability
uint8 u_classification_pedestrian #Pedestrian Classification Probability
uint8 u_classification_animal #Animal Classification Probability
uint8 u_classification_hazard #Hazard Classification Probability
uint8 u_classification_unknown #Unknown Classification Probability
uint8 u_classification_overdrivable #unused
uint8 u_classification_underdrivable #unused
uint8 u_dynamics_absvel_invalidflags #unused
float32 f_dynamics_absvel_x #X Absolute Velocity
float32 f_dynamics_absvel_x_std #X Absolute Velocity Std
float32 f_dynamics_absvel_y #Y Absolute Velocity
float32 f_dynamics_absvel_y_std #Y Absolute Velocity Std
float32 f_dynamics_absvel_covariancexy #Covariance Absolute Velocity X Y
uint8 u_dynamics_relvel_invalidflags #unused
float32 f_dynamics_relvel_x #X Relative Velocity
float32 f_dynamics_relvel_x_std #X Relative Velocity Std
float32 f_dynamics_relvel_y #Y Relative Velocity
float32 f_dynamics_relvel_y_std #Y Relative Velocity Std
float32 f_dynamics_relvel_covariancexy #Covariance Relative Velocity X Y
uint8 u_dynamics_absaccel_invalidflags #unused
float32 f_dynamics_absaccel_x #X Absolute Acceleration
float32 f_dynamics_absaccel_x_std #X Absolute Acceleration Std
float32 f_dynamics_absaccel_y #Y Absolute Acceleration
float32 f_dynamics_absaccel_y_std #Y Absolute Acceleration Std
float32 f_dynamics_absaccel_covariancexy #Covariance Absolute Acceleration X Y
uint8 u_dynamics_relaccel_invalidflags #unused
float32 f_dynamics_relaccel_x #X Relative Acceleration
float32 f_dynamics_relaccel_x_std #X Relative Acceleration Std
float32 f_dynamics_relaccel_y #Y Relative Acceleration
float32 f_dynamics_relaccel_y_std #Y Relative Acceleration Std
float32 f_dynamics_relaccel_covariancexy #Covariance Relative Acceleration X Y
uint8 u_dynamics_orientation_invalidflags #unused
float32 u_dynamics_orientation_rate_mean #Object Orientation Rate
float32 u_dynamics_orientation_rate_std #Orientation Rate Std
uint32 u_shape_length_status #(unused) Shape Length Status
uint8 u_shape_length_edge_invalidflags #(unused) Invalid Flags Shape Length 
float32 u_shape_length_edge_mean #Mean Shape Length
float32 u_shape_length_edge_std #(unused) Shape Length Std
uint32 u_shape_width_status #(unused) Shape Width Status 
uint8 u_shape_width_edge_invalidflags #(unused) Invalid Flags Shape Width
float32 u_shape_width_edge_mean #Mean Shape Width
float32 u_shape_width_edge_std #(unused) Shape Width Std 
")



(provide :ars548_messages/Object "7a6bf48af76a68f467d67dd7b1137272")


