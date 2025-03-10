; Auto-generated. Do not edit!


(cl:in-package ars548_messages-msg)


;//! \htmlinclude Object.msg.html

(cl:defclass <Object> (roslisp-msg-protocol:ros-message)
  ((u_statussensor
    :reader u_statussensor
    :initarg :u_statussensor
    :type cl:fixnum
    :initform 0)
   (u_id
    :reader u_id
    :initarg :u_id
    :type cl:integer
    :initform 0)
   (u_age
    :reader u_age
    :initarg :u_age
    :type cl:fixnum
    :initform 0)
   (u_statusmeasurement
    :reader u_statusmeasurement
    :initarg :u_statusmeasurement
    :type cl:fixnum
    :initform 0)
   (u_statusmovement
    :reader u_statusmovement
    :initarg :u_statusmovement
    :type cl:fixnum
    :initform 0)
   (u_position_invalidflags
    :reader u_position_invalidflags
    :initarg :u_position_invalidflags
    :type cl:fixnum
    :initform 0)
   (u_position_reference
    :reader u_position_reference
    :initarg :u_position_reference
    :type cl:fixnum
    :initform 0)
   (u_position_x
    :reader u_position_x
    :initarg :u_position_x
    :type cl:float
    :initform 0.0)
   (u_position_x_std
    :reader u_position_x_std
    :initarg :u_position_x_std
    :type cl:float
    :initform 0.0)
   (u_position_y
    :reader u_position_y
    :initarg :u_position_y
    :type cl:float
    :initform 0.0)
   (u_position_y_std
    :reader u_position_y_std
    :initarg :u_position_y_std
    :type cl:float
    :initform 0.0)
   (u_position_z
    :reader u_position_z
    :initarg :u_position_z
    :type cl:float
    :initform 0.0)
   (u_position_z_std
    :reader u_position_z_std
    :initarg :u_position_z_std
    :type cl:float
    :initform 0.0)
   (u_position_covariancexy
    :reader u_position_covariancexy
    :initarg :u_position_covariancexy
    :type cl:float
    :initform 0.0)
   (u_position_orientation
    :reader u_position_orientation
    :initarg :u_position_orientation
    :type cl:float
    :initform 0.0)
   (u_position_orientation_std
    :reader u_position_orientation_std
    :initarg :u_position_orientation_std
    :type cl:float
    :initform 0.0)
   (u_existence_invalidflags
    :reader u_existence_invalidflags
    :initarg :u_existence_invalidflags
    :type cl:fixnum
    :initform 0)
   (u_existence_probability
    :reader u_existence_probability
    :initarg :u_existence_probability
    :type cl:float
    :initform 0.0)
   (u_existence_ppv
    :reader u_existence_ppv
    :initarg :u_existence_ppv
    :type cl:float
    :initform 0.0)
   (u_classification_car
    :reader u_classification_car
    :initarg :u_classification_car
    :type cl:fixnum
    :initform 0)
   (u_classification_truck
    :reader u_classification_truck
    :initarg :u_classification_truck
    :type cl:fixnum
    :initform 0)
   (u_classification_motorcycle
    :reader u_classification_motorcycle
    :initarg :u_classification_motorcycle
    :type cl:fixnum
    :initform 0)
   (u_classification_bicycle
    :reader u_classification_bicycle
    :initarg :u_classification_bicycle
    :type cl:fixnum
    :initform 0)
   (u_classification_pedestrian
    :reader u_classification_pedestrian
    :initarg :u_classification_pedestrian
    :type cl:fixnum
    :initform 0)
   (u_classification_animal
    :reader u_classification_animal
    :initarg :u_classification_animal
    :type cl:fixnum
    :initform 0)
   (u_classification_hazard
    :reader u_classification_hazard
    :initarg :u_classification_hazard
    :type cl:fixnum
    :initform 0)
   (u_classification_unknown
    :reader u_classification_unknown
    :initarg :u_classification_unknown
    :type cl:fixnum
    :initform 0)
   (u_classification_overdrivable
    :reader u_classification_overdrivable
    :initarg :u_classification_overdrivable
    :type cl:fixnum
    :initform 0)
   (u_classification_underdrivable
    :reader u_classification_underdrivable
    :initarg :u_classification_underdrivable
    :type cl:fixnum
    :initform 0)
   (u_dynamics_absvel_invalidflags
    :reader u_dynamics_absvel_invalidflags
    :initarg :u_dynamics_absvel_invalidflags
    :type cl:fixnum
    :initform 0)
   (f_dynamics_absvel_x
    :reader f_dynamics_absvel_x
    :initarg :f_dynamics_absvel_x
    :type cl:float
    :initform 0.0)
   (f_dynamics_absvel_x_std
    :reader f_dynamics_absvel_x_std
    :initarg :f_dynamics_absvel_x_std
    :type cl:float
    :initform 0.0)
   (f_dynamics_absvel_y
    :reader f_dynamics_absvel_y
    :initarg :f_dynamics_absvel_y
    :type cl:float
    :initform 0.0)
   (f_dynamics_absvel_y_std
    :reader f_dynamics_absvel_y_std
    :initarg :f_dynamics_absvel_y_std
    :type cl:float
    :initform 0.0)
   (f_dynamics_absvel_covariancexy
    :reader f_dynamics_absvel_covariancexy
    :initarg :f_dynamics_absvel_covariancexy
    :type cl:float
    :initform 0.0)
   (u_dynamics_relvel_invalidflags
    :reader u_dynamics_relvel_invalidflags
    :initarg :u_dynamics_relvel_invalidflags
    :type cl:fixnum
    :initform 0)
   (f_dynamics_relvel_x
    :reader f_dynamics_relvel_x
    :initarg :f_dynamics_relvel_x
    :type cl:float
    :initform 0.0)
   (f_dynamics_relvel_x_std
    :reader f_dynamics_relvel_x_std
    :initarg :f_dynamics_relvel_x_std
    :type cl:float
    :initform 0.0)
   (f_dynamics_relvel_y
    :reader f_dynamics_relvel_y
    :initarg :f_dynamics_relvel_y
    :type cl:float
    :initform 0.0)
   (f_dynamics_relvel_y_std
    :reader f_dynamics_relvel_y_std
    :initarg :f_dynamics_relvel_y_std
    :type cl:float
    :initform 0.0)
   (f_dynamics_relvel_covariancexy
    :reader f_dynamics_relvel_covariancexy
    :initarg :f_dynamics_relvel_covariancexy
    :type cl:float
    :initform 0.0)
   (u_dynamics_absaccel_invalidflags
    :reader u_dynamics_absaccel_invalidflags
    :initarg :u_dynamics_absaccel_invalidflags
    :type cl:fixnum
    :initform 0)
   (f_dynamics_absaccel_x
    :reader f_dynamics_absaccel_x
    :initarg :f_dynamics_absaccel_x
    :type cl:float
    :initform 0.0)
   (f_dynamics_absaccel_x_std
    :reader f_dynamics_absaccel_x_std
    :initarg :f_dynamics_absaccel_x_std
    :type cl:float
    :initform 0.0)
   (f_dynamics_absaccel_y
    :reader f_dynamics_absaccel_y
    :initarg :f_dynamics_absaccel_y
    :type cl:float
    :initform 0.0)
   (f_dynamics_absaccel_y_std
    :reader f_dynamics_absaccel_y_std
    :initarg :f_dynamics_absaccel_y_std
    :type cl:float
    :initform 0.0)
   (f_dynamics_absaccel_covariancexy
    :reader f_dynamics_absaccel_covariancexy
    :initarg :f_dynamics_absaccel_covariancexy
    :type cl:float
    :initform 0.0)
   (u_dynamics_relaccel_invalidflags
    :reader u_dynamics_relaccel_invalidflags
    :initarg :u_dynamics_relaccel_invalidflags
    :type cl:fixnum
    :initform 0)
   (f_dynamics_relaccel_x
    :reader f_dynamics_relaccel_x
    :initarg :f_dynamics_relaccel_x
    :type cl:float
    :initform 0.0)
   (f_dynamics_relaccel_x_std
    :reader f_dynamics_relaccel_x_std
    :initarg :f_dynamics_relaccel_x_std
    :type cl:float
    :initform 0.0)
   (f_dynamics_relaccel_y
    :reader f_dynamics_relaccel_y
    :initarg :f_dynamics_relaccel_y
    :type cl:float
    :initform 0.0)
   (f_dynamics_relaccel_y_std
    :reader f_dynamics_relaccel_y_std
    :initarg :f_dynamics_relaccel_y_std
    :type cl:float
    :initform 0.0)
   (f_dynamics_relaccel_covariancexy
    :reader f_dynamics_relaccel_covariancexy
    :initarg :f_dynamics_relaccel_covariancexy
    :type cl:float
    :initform 0.0)
   (u_dynamics_orientation_invalidflags
    :reader u_dynamics_orientation_invalidflags
    :initarg :u_dynamics_orientation_invalidflags
    :type cl:fixnum
    :initform 0)
   (u_dynamics_orientation_rate_mean
    :reader u_dynamics_orientation_rate_mean
    :initarg :u_dynamics_orientation_rate_mean
    :type cl:float
    :initform 0.0)
   (u_dynamics_orientation_rate_std
    :reader u_dynamics_orientation_rate_std
    :initarg :u_dynamics_orientation_rate_std
    :type cl:float
    :initform 0.0)
   (u_shape_length_status
    :reader u_shape_length_status
    :initarg :u_shape_length_status
    :type cl:integer
    :initform 0)
   (u_shape_length_edge_invalidflags
    :reader u_shape_length_edge_invalidflags
    :initarg :u_shape_length_edge_invalidflags
    :type cl:fixnum
    :initform 0)
   (u_shape_length_edge_mean
    :reader u_shape_length_edge_mean
    :initarg :u_shape_length_edge_mean
    :type cl:float
    :initform 0.0)
   (u_shape_length_edge_std
    :reader u_shape_length_edge_std
    :initarg :u_shape_length_edge_std
    :type cl:float
    :initform 0.0)
   (u_shape_width_status
    :reader u_shape_width_status
    :initarg :u_shape_width_status
    :type cl:integer
    :initform 0)
   (u_shape_width_edge_invalidflags
    :reader u_shape_width_edge_invalidflags
    :initarg :u_shape_width_edge_invalidflags
    :type cl:fixnum
    :initform 0)
   (u_shape_width_edge_mean
    :reader u_shape_width_edge_mean
    :initarg :u_shape_width_edge_mean
    :type cl:float
    :initform 0.0)
   (u_shape_width_edge_std
    :reader u_shape_width_edge_std
    :initarg :u_shape_width_edge_std
    :type cl:float
    :initform 0.0))
)

(cl:defclass Object (<Object>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Object>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Object)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ars548_messages-msg:<Object> is deprecated: use ars548_messages-msg:Object instead.")))

(cl:ensure-generic-function 'u_statussensor-val :lambda-list '(m))
(cl:defmethod u_statussensor-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_statussensor-val is deprecated.  Use ars548_messages-msg:u_statussensor instead.")
  (u_statussensor m))

(cl:ensure-generic-function 'u_id-val :lambda-list '(m))
(cl:defmethod u_id-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_id-val is deprecated.  Use ars548_messages-msg:u_id instead.")
  (u_id m))

(cl:ensure-generic-function 'u_age-val :lambda-list '(m))
(cl:defmethod u_age-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_age-val is deprecated.  Use ars548_messages-msg:u_age instead.")
  (u_age m))

(cl:ensure-generic-function 'u_statusmeasurement-val :lambda-list '(m))
(cl:defmethod u_statusmeasurement-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_statusmeasurement-val is deprecated.  Use ars548_messages-msg:u_statusmeasurement instead.")
  (u_statusmeasurement m))

(cl:ensure-generic-function 'u_statusmovement-val :lambda-list '(m))
(cl:defmethod u_statusmovement-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_statusmovement-val is deprecated.  Use ars548_messages-msg:u_statusmovement instead.")
  (u_statusmovement m))

(cl:ensure-generic-function 'u_position_invalidflags-val :lambda-list '(m))
(cl:defmethod u_position_invalidflags-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_position_invalidflags-val is deprecated.  Use ars548_messages-msg:u_position_invalidflags instead.")
  (u_position_invalidflags m))

(cl:ensure-generic-function 'u_position_reference-val :lambda-list '(m))
(cl:defmethod u_position_reference-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_position_reference-val is deprecated.  Use ars548_messages-msg:u_position_reference instead.")
  (u_position_reference m))

(cl:ensure-generic-function 'u_position_x-val :lambda-list '(m))
(cl:defmethod u_position_x-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_position_x-val is deprecated.  Use ars548_messages-msg:u_position_x instead.")
  (u_position_x m))

(cl:ensure-generic-function 'u_position_x_std-val :lambda-list '(m))
(cl:defmethod u_position_x_std-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_position_x_std-val is deprecated.  Use ars548_messages-msg:u_position_x_std instead.")
  (u_position_x_std m))

(cl:ensure-generic-function 'u_position_y-val :lambda-list '(m))
(cl:defmethod u_position_y-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_position_y-val is deprecated.  Use ars548_messages-msg:u_position_y instead.")
  (u_position_y m))

(cl:ensure-generic-function 'u_position_y_std-val :lambda-list '(m))
(cl:defmethod u_position_y_std-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_position_y_std-val is deprecated.  Use ars548_messages-msg:u_position_y_std instead.")
  (u_position_y_std m))

(cl:ensure-generic-function 'u_position_z-val :lambda-list '(m))
(cl:defmethod u_position_z-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_position_z-val is deprecated.  Use ars548_messages-msg:u_position_z instead.")
  (u_position_z m))

(cl:ensure-generic-function 'u_position_z_std-val :lambda-list '(m))
(cl:defmethod u_position_z_std-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_position_z_std-val is deprecated.  Use ars548_messages-msg:u_position_z_std instead.")
  (u_position_z_std m))

(cl:ensure-generic-function 'u_position_covariancexy-val :lambda-list '(m))
(cl:defmethod u_position_covariancexy-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_position_covariancexy-val is deprecated.  Use ars548_messages-msg:u_position_covariancexy instead.")
  (u_position_covariancexy m))

(cl:ensure-generic-function 'u_position_orientation-val :lambda-list '(m))
(cl:defmethod u_position_orientation-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_position_orientation-val is deprecated.  Use ars548_messages-msg:u_position_orientation instead.")
  (u_position_orientation m))

(cl:ensure-generic-function 'u_position_orientation_std-val :lambda-list '(m))
(cl:defmethod u_position_orientation_std-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_position_orientation_std-val is deprecated.  Use ars548_messages-msg:u_position_orientation_std instead.")
  (u_position_orientation_std m))

(cl:ensure-generic-function 'u_existence_invalidflags-val :lambda-list '(m))
(cl:defmethod u_existence_invalidflags-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_existence_invalidflags-val is deprecated.  Use ars548_messages-msg:u_existence_invalidflags instead.")
  (u_existence_invalidflags m))

(cl:ensure-generic-function 'u_existence_probability-val :lambda-list '(m))
(cl:defmethod u_existence_probability-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_existence_probability-val is deprecated.  Use ars548_messages-msg:u_existence_probability instead.")
  (u_existence_probability m))

(cl:ensure-generic-function 'u_existence_ppv-val :lambda-list '(m))
(cl:defmethod u_existence_ppv-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_existence_ppv-val is deprecated.  Use ars548_messages-msg:u_existence_ppv instead.")
  (u_existence_ppv m))

(cl:ensure-generic-function 'u_classification_car-val :lambda-list '(m))
(cl:defmethod u_classification_car-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_classification_car-val is deprecated.  Use ars548_messages-msg:u_classification_car instead.")
  (u_classification_car m))

(cl:ensure-generic-function 'u_classification_truck-val :lambda-list '(m))
(cl:defmethod u_classification_truck-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_classification_truck-val is deprecated.  Use ars548_messages-msg:u_classification_truck instead.")
  (u_classification_truck m))

(cl:ensure-generic-function 'u_classification_motorcycle-val :lambda-list '(m))
(cl:defmethod u_classification_motorcycle-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_classification_motorcycle-val is deprecated.  Use ars548_messages-msg:u_classification_motorcycle instead.")
  (u_classification_motorcycle m))

(cl:ensure-generic-function 'u_classification_bicycle-val :lambda-list '(m))
(cl:defmethod u_classification_bicycle-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_classification_bicycle-val is deprecated.  Use ars548_messages-msg:u_classification_bicycle instead.")
  (u_classification_bicycle m))

(cl:ensure-generic-function 'u_classification_pedestrian-val :lambda-list '(m))
(cl:defmethod u_classification_pedestrian-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_classification_pedestrian-val is deprecated.  Use ars548_messages-msg:u_classification_pedestrian instead.")
  (u_classification_pedestrian m))

(cl:ensure-generic-function 'u_classification_animal-val :lambda-list '(m))
(cl:defmethod u_classification_animal-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_classification_animal-val is deprecated.  Use ars548_messages-msg:u_classification_animal instead.")
  (u_classification_animal m))

(cl:ensure-generic-function 'u_classification_hazard-val :lambda-list '(m))
(cl:defmethod u_classification_hazard-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_classification_hazard-val is deprecated.  Use ars548_messages-msg:u_classification_hazard instead.")
  (u_classification_hazard m))

(cl:ensure-generic-function 'u_classification_unknown-val :lambda-list '(m))
(cl:defmethod u_classification_unknown-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_classification_unknown-val is deprecated.  Use ars548_messages-msg:u_classification_unknown instead.")
  (u_classification_unknown m))

(cl:ensure-generic-function 'u_classification_overdrivable-val :lambda-list '(m))
(cl:defmethod u_classification_overdrivable-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_classification_overdrivable-val is deprecated.  Use ars548_messages-msg:u_classification_overdrivable instead.")
  (u_classification_overdrivable m))

(cl:ensure-generic-function 'u_classification_underdrivable-val :lambda-list '(m))
(cl:defmethod u_classification_underdrivable-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_classification_underdrivable-val is deprecated.  Use ars548_messages-msg:u_classification_underdrivable instead.")
  (u_classification_underdrivable m))

(cl:ensure-generic-function 'u_dynamics_absvel_invalidflags-val :lambda-list '(m))
(cl:defmethod u_dynamics_absvel_invalidflags-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_dynamics_absvel_invalidflags-val is deprecated.  Use ars548_messages-msg:u_dynamics_absvel_invalidflags instead.")
  (u_dynamics_absvel_invalidflags m))

(cl:ensure-generic-function 'f_dynamics_absvel_x-val :lambda-list '(m))
(cl:defmethod f_dynamics_absvel_x-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_absvel_x-val is deprecated.  Use ars548_messages-msg:f_dynamics_absvel_x instead.")
  (f_dynamics_absvel_x m))

(cl:ensure-generic-function 'f_dynamics_absvel_x_std-val :lambda-list '(m))
(cl:defmethod f_dynamics_absvel_x_std-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_absvel_x_std-val is deprecated.  Use ars548_messages-msg:f_dynamics_absvel_x_std instead.")
  (f_dynamics_absvel_x_std m))

(cl:ensure-generic-function 'f_dynamics_absvel_y-val :lambda-list '(m))
(cl:defmethod f_dynamics_absvel_y-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_absvel_y-val is deprecated.  Use ars548_messages-msg:f_dynamics_absvel_y instead.")
  (f_dynamics_absvel_y m))

(cl:ensure-generic-function 'f_dynamics_absvel_y_std-val :lambda-list '(m))
(cl:defmethod f_dynamics_absvel_y_std-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_absvel_y_std-val is deprecated.  Use ars548_messages-msg:f_dynamics_absvel_y_std instead.")
  (f_dynamics_absvel_y_std m))

(cl:ensure-generic-function 'f_dynamics_absvel_covariancexy-val :lambda-list '(m))
(cl:defmethod f_dynamics_absvel_covariancexy-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_absvel_covariancexy-val is deprecated.  Use ars548_messages-msg:f_dynamics_absvel_covariancexy instead.")
  (f_dynamics_absvel_covariancexy m))

(cl:ensure-generic-function 'u_dynamics_relvel_invalidflags-val :lambda-list '(m))
(cl:defmethod u_dynamics_relvel_invalidflags-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_dynamics_relvel_invalidflags-val is deprecated.  Use ars548_messages-msg:u_dynamics_relvel_invalidflags instead.")
  (u_dynamics_relvel_invalidflags m))

(cl:ensure-generic-function 'f_dynamics_relvel_x-val :lambda-list '(m))
(cl:defmethod f_dynamics_relvel_x-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_relvel_x-val is deprecated.  Use ars548_messages-msg:f_dynamics_relvel_x instead.")
  (f_dynamics_relvel_x m))

(cl:ensure-generic-function 'f_dynamics_relvel_x_std-val :lambda-list '(m))
(cl:defmethod f_dynamics_relvel_x_std-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_relvel_x_std-val is deprecated.  Use ars548_messages-msg:f_dynamics_relvel_x_std instead.")
  (f_dynamics_relvel_x_std m))

(cl:ensure-generic-function 'f_dynamics_relvel_y-val :lambda-list '(m))
(cl:defmethod f_dynamics_relvel_y-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_relvel_y-val is deprecated.  Use ars548_messages-msg:f_dynamics_relvel_y instead.")
  (f_dynamics_relvel_y m))

(cl:ensure-generic-function 'f_dynamics_relvel_y_std-val :lambda-list '(m))
(cl:defmethod f_dynamics_relvel_y_std-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_relvel_y_std-val is deprecated.  Use ars548_messages-msg:f_dynamics_relvel_y_std instead.")
  (f_dynamics_relvel_y_std m))

(cl:ensure-generic-function 'f_dynamics_relvel_covariancexy-val :lambda-list '(m))
(cl:defmethod f_dynamics_relvel_covariancexy-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_relvel_covariancexy-val is deprecated.  Use ars548_messages-msg:f_dynamics_relvel_covariancexy instead.")
  (f_dynamics_relvel_covariancexy m))

(cl:ensure-generic-function 'u_dynamics_absaccel_invalidflags-val :lambda-list '(m))
(cl:defmethod u_dynamics_absaccel_invalidflags-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_dynamics_absaccel_invalidflags-val is deprecated.  Use ars548_messages-msg:u_dynamics_absaccel_invalidflags instead.")
  (u_dynamics_absaccel_invalidflags m))

(cl:ensure-generic-function 'f_dynamics_absaccel_x-val :lambda-list '(m))
(cl:defmethod f_dynamics_absaccel_x-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_absaccel_x-val is deprecated.  Use ars548_messages-msg:f_dynamics_absaccel_x instead.")
  (f_dynamics_absaccel_x m))

(cl:ensure-generic-function 'f_dynamics_absaccel_x_std-val :lambda-list '(m))
(cl:defmethod f_dynamics_absaccel_x_std-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_absaccel_x_std-val is deprecated.  Use ars548_messages-msg:f_dynamics_absaccel_x_std instead.")
  (f_dynamics_absaccel_x_std m))

(cl:ensure-generic-function 'f_dynamics_absaccel_y-val :lambda-list '(m))
(cl:defmethod f_dynamics_absaccel_y-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_absaccel_y-val is deprecated.  Use ars548_messages-msg:f_dynamics_absaccel_y instead.")
  (f_dynamics_absaccel_y m))

(cl:ensure-generic-function 'f_dynamics_absaccel_y_std-val :lambda-list '(m))
(cl:defmethod f_dynamics_absaccel_y_std-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_absaccel_y_std-val is deprecated.  Use ars548_messages-msg:f_dynamics_absaccel_y_std instead.")
  (f_dynamics_absaccel_y_std m))

(cl:ensure-generic-function 'f_dynamics_absaccel_covariancexy-val :lambda-list '(m))
(cl:defmethod f_dynamics_absaccel_covariancexy-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_absaccel_covariancexy-val is deprecated.  Use ars548_messages-msg:f_dynamics_absaccel_covariancexy instead.")
  (f_dynamics_absaccel_covariancexy m))

(cl:ensure-generic-function 'u_dynamics_relaccel_invalidflags-val :lambda-list '(m))
(cl:defmethod u_dynamics_relaccel_invalidflags-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_dynamics_relaccel_invalidflags-val is deprecated.  Use ars548_messages-msg:u_dynamics_relaccel_invalidflags instead.")
  (u_dynamics_relaccel_invalidflags m))

(cl:ensure-generic-function 'f_dynamics_relaccel_x-val :lambda-list '(m))
(cl:defmethod f_dynamics_relaccel_x-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_relaccel_x-val is deprecated.  Use ars548_messages-msg:f_dynamics_relaccel_x instead.")
  (f_dynamics_relaccel_x m))

(cl:ensure-generic-function 'f_dynamics_relaccel_x_std-val :lambda-list '(m))
(cl:defmethod f_dynamics_relaccel_x_std-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_relaccel_x_std-val is deprecated.  Use ars548_messages-msg:f_dynamics_relaccel_x_std instead.")
  (f_dynamics_relaccel_x_std m))

(cl:ensure-generic-function 'f_dynamics_relaccel_y-val :lambda-list '(m))
(cl:defmethod f_dynamics_relaccel_y-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_relaccel_y-val is deprecated.  Use ars548_messages-msg:f_dynamics_relaccel_y instead.")
  (f_dynamics_relaccel_y m))

(cl:ensure-generic-function 'f_dynamics_relaccel_y_std-val :lambda-list '(m))
(cl:defmethod f_dynamics_relaccel_y_std-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_relaccel_y_std-val is deprecated.  Use ars548_messages-msg:f_dynamics_relaccel_y_std instead.")
  (f_dynamics_relaccel_y_std m))

(cl:ensure-generic-function 'f_dynamics_relaccel_covariancexy-val :lambda-list '(m))
(cl:defmethod f_dynamics_relaccel_covariancexy-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:f_dynamics_relaccel_covariancexy-val is deprecated.  Use ars548_messages-msg:f_dynamics_relaccel_covariancexy instead.")
  (f_dynamics_relaccel_covariancexy m))

(cl:ensure-generic-function 'u_dynamics_orientation_invalidflags-val :lambda-list '(m))
(cl:defmethod u_dynamics_orientation_invalidflags-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_dynamics_orientation_invalidflags-val is deprecated.  Use ars548_messages-msg:u_dynamics_orientation_invalidflags instead.")
  (u_dynamics_orientation_invalidflags m))

(cl:ensure-generic-function 'u_dynamics_orientation_rate_mean-val :lambda-list '(m))
(cl:defmethod u_dynamics_orientation_rate_mean-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_dynamics_orientation_rate_mean-val is deprecated.  Use ars548_messages-msg:u_dynamics_orientation_rate_mean instead.")
  (u_dynamics_orientation_rate_mean m))

(cl:ensure-generic-function 'u_dynamics_orientation_rate_std-val :lambda-list '(m))
(cl:defmethod u_dynamics_orientation_rate_std-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_dynamics_orientation_rate_std-val is deprecated.  Use ars548_messages-msg:u_dynamics_orientation_rate_std instead.")
  (u_dynamics_orientation_rate_std m))

(cl:ensure-generic-function 'u_shape_length_status-val :lambda-list '(m))
(cl:defmethod u_shape_length_status-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_shape_length_status-val is deprecated.  Use ars548_messages-msg:u_shape_length_status instead.")
  (u_shape_length_status m))

(cl:ensure-generic-function 'u_shape_length_edge_invalidflags-val :lambda-list '(m))
(cl:defmethod u_shape_length_edge_invalidflags-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_shape_length_edge_invalidflags-val is deprecated.  Use ars548_messages-msg:u_shape_length_edge_invalidflags instead.")
  (u_shape_length_edge_invalidflags m))

(cl:ensure-generic-function 'u_shape_length_edge_mean-val :lambda-list '(m))
(cl:defmethod u_shape_length_edge_mean-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_shape_length_edge_mean-val is deprecated.  Use ars548_messages-msg:u_shape_length_edge_mean instead.")
  (u_shape_length_edge_mean m))

(cl:ensure-generic-function 'u_shape_length_edge_std-val :lambda-list '(m))
(cl:defmethod u_shape_length_edge_std-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_shape_length_edge_std-val is deprecated.  Use ars548_messages-msg:u_shape_length_edge_std instead.")
  (u_shape_length_edge_std m))

(cl:ensure-generic-function 'u_shape_width_status-val :lambda-list '(m))
(cl:defmethod u_shape_width_status-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_shape_width_status-val is deprecated.  Use ars548_messages-msg:u_shape_width_status instead.")
  (u_shape_width_status m))

(cl:ensure-generic-function 'u_shape_width_edge_invalidflags-val :lambda-list '(m))
(cl:defmethod u_shape_width_edge_invalidflags-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_shape_width_edge_invalidflags-val is deprecated.  Use ars548_messages-msg:u_shape_width_edge_invalidflags instead.")
  (u_shape_width_edge_invalidflags m))

(cl:ensure-generic-function 'u_shape_width_edge_mean-val :lambda-list '(m))
(cl:defmethod u_shape_width_edge_mean-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_shape_width_edge_mean-val is deprecated.  Use ars548_messages-msg:u_shape_width_edge_mean instead.")
  (u_shape_width_edge_mean m))

(cl:ensure-generic-function 'u_shape_width_edge_std-val :lambda-list '(m))
(cl:defmethod u_shape_width_edge_std-val ((m <Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ars548_messages-msg:u_shape_width_edge_std-val is deprecated.  Use ars548_messages-msg:u_shape_width_edge_std instead.")
  (u_shape_width_edge_std m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Object>) ostream)
  "Serializes a message object of type '<Object>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_statussensor)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_statussensor)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'u_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'u_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_age)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_age)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_statusmeasurement)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_statusmovement)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_position_invalidflags)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_position_invalidflags)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_position_reference)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_position_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_position_x_std))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_position_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_position_y_std))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_position_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_position_z_std))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_position_covariancexy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_position_orientation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_position_orientation_std))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_existence_invalidflags)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_existence_probability))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_existence_ppv))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_car)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_truck)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_motorcycle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_bicycle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_pedestrian)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_animal)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_hazard)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_unknown)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_overdrivable)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_underdrivable)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_dynamics_absvel_invalidflags)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_absvel_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_absvel_x_std))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_absvel_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_absvel_y_std))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_absvel_covariancexy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_dynamics_relvel_invalidflags)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_relvel_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_relvel_x_std))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_relvel_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_relvel_y_std))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_relvel_covariancexy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_dynamics_absaccel_invalidflags)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_absaccel_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_absaccel_x_std))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_absaccel_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_absaccel_y_std))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_absaccel_covariancexy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_dynamics_relaccel_invalidflags)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_relaccel_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_relaccel_x_std))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_relaccel_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_relaccel_y_std))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'f_dynamics_relaccel_covariancexy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_dynamics_orientation_invalidflags)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_dynamics_orientation_rate_mean))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_dynamics_orientation_rate_std))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_shape_length_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_shape_length_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'u_shape_length_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'u_shape_length_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_shape_length_edge_invalidflags)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_shape_length_edge_mean))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_shape_length_edge_std))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_shape_width_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_shape_width_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'u_shape_width_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'u_shape_width_status)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_shape_width_edge_invalidflags)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_shape_width_edge_mean))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'u_shape_width_edge_std))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Object>) istream)
  "Deserializes a message object of type '<Object>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_statussensor)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_statussensor)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'u_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'u_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_age)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_age)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_statusmeasurement)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_statusmovement)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_position_invalidflags)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_position_invalidflags)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_position_reference)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_position_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_position_x_std) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_position_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_position_y_std) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_position_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_position_z_std) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_position_covariancexy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_position_orientation) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_position_orientation_std) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_existence_invalidflags)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_existence_probability) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_existence_ppv) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_car)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_truck)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_motorcycle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_bicycle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_pedestrian)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_animal)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_hazard)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_unknown)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_overdrivable)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_classification_underdrivable)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_dynamics_absvel_invalidflags)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_absvel_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_absvel_x_std) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_absvel_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_absvel_y_std) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_absvel_covariancexy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_dynamics_relvel_invalidflags)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_relvel_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_relvel_x_std) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_relvel_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_relvel_y_std) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_relvel_covariancexy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_dynamics_absaccel_invalidflags)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_absaccel_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_absaccel_x_std) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_absaccel_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_absaccel_y_std) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_absaccel_covariancexy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_dynamics_relaccel_invalidflags)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_relaccel_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_relaccel_x_std) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_relaccel_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_relaccel_y_std) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'f_dynamics_relaccel_covariancexy) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_dynamics_orientation_invalidflags)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_dynamics_orientation_rate_mean) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_dynamics_orientation_rate_std) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_shape_length_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_shape_length_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'u_shape_length_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'u_shape_length_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_shape_length_edge_invalidflags)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_shape_length_edge_mean) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_shape_length_edge_std) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_shape_width_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'u_shape_width_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'u_shape_width_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'u_shape_width_status)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'u_shape_width_edge_invalidflags)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_shape_width_edge_mean) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'u_shape_width_edge_std) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Object>)))
  "Returns string type for a message object of type '<Object>"
  "ars548_messages/Object")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Object)))
  "Returns string type for a message object of type 'Object"
  "ars548_messages/Object")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Object>)))
  "Returns md5sum for a message object of type '<Object>"
  "7a6bf48af76a68f467d67dd7b1137272")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Object)))
  "Returns md5sum for a message object of type 'Object"
  "7a6bf48af76a68f467d67dd7b1137272")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Object>)))
  "Returns full string definition for message of type '<Object>"
  (cl:format cl:nil "uint16 u_statussensor #tbd~%uint32 u_id #Unique ID of object~%uint16 u_age #Age of object~%uint8 u_statusmeasurement #Object Status~%uint8 u_statusmovement #Object Movement Status~%uint16 u_position_invalidflags #tbd~%uint8 u_position_reference #Reference point position~%float32 u_position_x #X Position of reference point~%float32 u_position_x_std #X Position Std~%float32 u_position_y #Y Position of reference point~%float32 u_position_y_std #Y Position Std~%float32 u_position_z #Z Position of reference point~%float32 u_position_z_std #Z Position Std~%float32 u_position_covariancexy #Covariance X Y~%float32 u_position_orientation #Object Orientation~%float32 u_position_orientation_std #Orientation Std~%uint8 u_existence_invalidflags #unused~%float32 u_existence_probability #Probability of Existence~%float32 u_existence_ppv #unused~%uint8 u_classification_car #Car Classification Probability~%uint8 u_classification_truck #Truck Classification Probability~%uint8 u_classification_motorcycle #Motorcycle Classification Probability~%uint8 u_classification_bicycle #Bicycle Classification Probability~%uint8 u_classification_pedestrian #Pedestrian Classification Probability~%uint8 u_classification_animal #Animal Classification Probability~%uint8 u_classification_hazard #Hazard Classification Probability~%uint8 u_classification_unknown #Unknown Classification Probability~%uint8 u_classification_overdrivable #unused~%uint8 u_classification_underdrivable #unused~%uint8 u_dynamics_absvel_invalidflags #unused~%float32 f_dynamics_absvel_x #X Absolute Velocity~%float32 f_dynamics_absvel_x_std #X Absolute Velocity Std~%float32 f_dynamics_absvel_y #Y Absolute Velocity~%float32 f_dynamics_absvel_y_std #Y Absolute Velocity Std~%float32 f_dynamics_absvel_covariancexy #Covariance Absolute Velocity X Y~%uint8 u_dynamics_relvel_invalidflags #unused~%float32 f_dynamics_relvel_x #X Relative Velocity~%float32 f_dynamics_relvel_x_std #X Relative Velocity Std~%float32 f_dynamics_relvel_y #Y Relative Velocity~%float32 f_dynamics_relvel_y_std #Y Relative Velocity Std~%float32 f_dynamics_relvel_covariancexy #Covariance Relative Velocity X Y~%uint8 u_dynamics_absaccel_invalidflags #unused~%float32 f_dynamics_absaccel_x #X Absolute Acceleration~%float32 f_dynamics_absaccel_x_std #X Absolute Acceleration Std~%float32 f_dynamics_absaccel_y #Y Absolute Acceleration~%float32 f_dynamics_absaccel_y_std #Y Absolute Acceleration Std~%float32 f_dynamics_absaccel_covariancexy #Covariance Absolute Acceleration X Y~%uint8 u_dynamics_relaccel_invalidflags #unused~%float32 f_dynamics_relaccel_x #X Relative Acceleration~%float32 f_dynamics_relaccel_x_std #X Relative Acceleration Std~%float32 f_dynamics_relaccel_y #Y Relative Acceleration~%float32 f_dynamics_relaccel_y_std #Y Relative Acceleration Std~%float32 f_dynamics_relaccel_covariancexy #Covariance Relative Acceleration X Y~%uint8 u_dynamics_orientation_invalidflags #unused~%float32 u_dynamics_orientation_rate_mean #Object Orientation Rate~%float32 u_dynamics_orientation_rate_std #Orientation Rate Std~%uint32 u_shape_length_status #(unused) Shape Length Status~%uint8 u_shape_length_edge_invalidflags #(unused) Invalid Flags Shape Length ~%float32 u_shape_length_edge_mean #Mean Shape Length~%float32 u_shape_length_edge_std #(unused) Shape Length Std~%uint32 u_shape_width_status #(unused) Shape Width Status ~%uint8 u_shape_width_edge_invalidflags #(unused) Invalid Flags Shape Width~%float32 u_shape_width_edge_mean #Mean Shape Width~%float32 u_shape_width_edge_std #(unused) Shape Width Std ~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Object)))
  "Returns full string definition for message of type 'Object"
  (cl:format cl:nil "uint16 u_statussensor #tbd~%uint32 u_id #Unique ID of object~%uint16 u_age #Age of object~%uint8 u_statusmeasurement #Object Status~%uint8 u_statusmovement #Object Movement Status~%uint16 u_position_invalidflags #tbd~%uint8 u_position_reference #Reference point position~%float32 u_position_x #X Position of reference point~%float32 u_position_x_std #X Position Std~%float32 u_position_y #Y Position of reference point~%float32 u_position_y_std #Y Position Std~%float32 u_position_z #Z Position of reference point~%float32 u_position_z_std #Z Position Std~%float32 u_position_covariancexy #Covariance X Y~%float32 u_position_orientation #Object Orientation~%float32 u_position_orientation_std #Orientation Std~%uint8 u_existence_invalidflags #unused~%float32 u_existence_probability #Probability of Existence~%float32 u_existence_ppv #unused~%uint8 u_classification_car #Car Classification Probability~%uint8 u_classification_truck #Truck Classification Probability~%uint8 u_classification_motorcycle #Motorcycle Classification Probability~%uint8 u_classification_bicycle #Bicycle Classification Probability~%uint8 u_classification_pedestrian #Pedestrian Classification Probability~%uint8 u_classification_animal #Animal Classification Probability~%uint8 u_classification_hazard #Hazard Classification Probability~%uint8 u_classification_unknown #Unknown Classification Probability~%uint8 u_classification_overdrivable #unused~%uint8 u_classification_underdrivable #unused~%uint8 u_dynamics_absvel_invalidflags #unused~%float32 f_dynamics_absvel_x #X Absolute Velocity~%float32 f_dynamics_absvel_x_std #X Absolute Velocity Std~%float32 f_dynamics_absvel_y #Y Absolute Velocity~%float32 f_dynamics_absvel_y_std #Y Absolute Velocity Std~%float32 f_dynamics_absvel_covariancexy #Covariance Absolute Velocity X Y~%uint8 u_dynamics_relvel_invalidflags #unused~%float32 f_dynamics_relvel_x #X Relative Velocity~%float32 f_dynamics_relvel_x_std #X Relative Velocity Std~%float32 f_dynamics_relvel_y #Y Relative Velocity~%float32 f_dynamics_relvel_y_std #Y Relative Velocity Std~%float32 f_dynamics_relvel_covariancexy #Covariance Relative Velocity X Y~%uint8 u_dynamics_absaccel_invalidflags #unused~%float32 f_dynamics_absaccel_x #X Absolute Acceleration~%float32 f_dynamics_absaccel_x_std #X Absolute Acceleration Std~%float32 f_dynamics_absaccel_y #Y Absolute Acceleration~%float32 f_dynamics_absaccel_y_std #Y Absolute Acceleration Std~%float32 f_dynamics_absaccel_covariancexy #Covariance Absolute Acceleration X Y~%uint8 u_dynamics_relaccel_invalidflags #unused~%float32 f_dynamics_relaccel_x #X Relative Acceleration~%float32 f_dynamics_relaccel_x_std #X Relative Acceleration Std~%float32 f_dynamics_relaccel_y #Y Relative Acceleration~%float32 f_dynamics_relaccel_y_std #Y Relative Acceleration Std~%float32 f_dynamics_relaccel_covariancexy #Covariance Relative Acceleration X Y~%uint8 u_dynamics_orientation_invalidflags #unused~%float32 u_dynamics_orientation_rate_mean #Object Orientation Rate~%float32 u_dynamics_orientation_rate_std #Orientation Rate Std~%uint32 u_shape_length_status #(unused) Shape Length Status~%uint8 u_shape_length_edge_invalidflags #(unused) Invalid Flags Shape Length ~%float32 u_shape_length_edge_mean #Mean Shape Length~%float32 u_shape_length_edge_std #(unused) Shape Length Std~%uint32 u_shape_width_status #(unused) Shape Width Status ~%uint8 u_shape_width_edge_invalidflags #(unused) Invalid Flags Shape Width~%float32 u_shape_width_edge_mean #Mean Shape Width~%float32 u_shape_width_edge_std #(unused) Shape Width Std ~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Object>))
  (cl:+ 0
     2
     4
     2
     1
     1
     2
     1
     4
     4
     4
     4
     4
     4
     4
     4
     4
     1
     4
     4
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     4
     4
     4
     4
     4
     1
     4
     4
     4
     4
     4
     1
     4
     4
     4
     4
     4
     1
     4
     4
     4
     4
     4
     1
     4
     4
     4
     1
     4
     4
     4
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Object>))
  "Converts a ROS message object to a list"
  (cl:list 'Object
    (cl:cons ':u_statussensor (u_statussensor msg))
    (cl:cons ':u_id (u_id msg))
    (cl:cons ':u_age (u_age msg))
    (cl:cons ':u_statusmeasurement (u_statusmeasurement msg))
    (cl:cons ':u_statusmovement (u_statusmovement msg))
    (cl:cons ':u_position_invalidflags (u_position_invalidflags msg))
    (cl:cons ':u_position_reference (u_position_reference msg))
    (cl:cons ':u_position_x (u_position_x msg))
    (cl:cons ':u_position_x_std (u_position_x_std msg))
    (cl:cons ':u_position_y (u_position_y msg))
    (cl:cons ':u_position_y_std (u_position_y_std msg))
    (cl:cons ':u_position_z (u_position_z msg))
    (cl:cons ':u_position_z_std (u_position_z_std msg))
    (cl:cons ':u_position_covariancexy (u_position_covariancexy msg))
    (cl:cons ':u_position_orientation (u_position_orientation msg))
    (cl:cons ':u_position_orientation_std (u_position_orientation_std msg))
    (cl:cons ':u_existence_invalidflags (u_existence_invalidflags msg))
    (cl:cons ':u_existence_probability (u_existence_probability msg))
    (cl:cons ':u_existence_ppv (u_existence_ppv msg))
    (cl:cons ':u_classification_car (u_classification_car msg))
    (cl:cons ':u_classification_truck (u_classification_truck msg))
    (cl:cons ':u_classification_motorcycle (u_classification_motorcycle msg))
    (cl:cons ':u_classification_bicycle (u_classification_bicycle msg))
    (cl:cons ':u_classification_pedestrian (u_classification_pedestrian msg))
    (cl:cons ':u_classification_animal (u_classification_animal msg))
    (cl:cons ':u_classification_hazard (u_classification_hazard msg))
    (cl:cons ':u_classification_unknown (u_classification_unknown msg))
    (cl:cons ':u_classification_overdrivable (u_classification_overdrivable msg))
    (cl:cons ':u_classification_underdrivable (u_classification_underdrivable msg))
    (cl:cons ':u_dynamics_absvel_invalidflags (u_dynamics_absvel_invalidflags msg))
    (cl:cons ':f_dynamics_absvel_x (f_dynamics_absvel_x msg))
    (cl:cons ':f_dynamics_absvel_x_std (f_dynamics_absvel_x_std msg))
    (cl:cons ':f_dynamics_absvel_y (f_dynamics_absvel_y msg))
    (cl:cons ':f_dynamics_absvel_y_std (f_dynamics_absvel_y_std msg))
    (cl:cons ':f_dynamics_absvel_covariancexy (f_dynamics_absvel_covariancexy msg))
    (cl:cons ':u_dynamics_relvel_invalidflags (u_dynamics_relvel_invalidflags msg))
    (cl:cons ':f_dynamics_relvel_x (f_dynamics_relvel_x msg))
    (cl:cons ':f_dynamics_relvel_x_std (f_dynamics_relvel_x_std msg))
    (cl:cons ':f_dynamics_relvel_y (f_dynamics_relvel_y msg))
    (cl:cons ':f_dynamics_relvel_y_std (f_dynamics_relvel_y_std msg))
    (cl:cons ':f_dynamics_relvel_covariancexy (f_dynamics_relvel_covariancexy msg))
    (cl:cons ':u_dynamics_absaccel_invalidflags (u_dynamics_absaccel_invalidflags msg))
    (cl:cons ':f_dynamics_absaccel_x (f_dynamics_absaccel_x msg))
    (cl:cons ':f_dynamics_absaccel_x_std (f_dynamics_absaccel_x_std msg))
    (cl:cons ':f_dynamics_absaccel_y (f_dynamics_absaccel_y msg))
    (cl:cons ':f_dynamics_absaccel_y_std (f_dynamics_absaccel_y_std msg))
    (cl:cons ':f_dynamics_absaccel_covariancexy (f_dynamics_absaccel_covariancexy msg))
    (cl:cons ':u_dynamics_relaccel_invalidflags (u_dynamics_relaccel_invalidflags msg))
    (cl:cons ':f_dynamics_relaccel_x (f_dynamics_relaccel_x msg))
    (cl:cons ':f_dynamics_relaccel_x_std (f_dynamics_relaccel_x_std msg))
    (cl:cons ':f_dynamics_relaccel_y (f_dynamics_relaccel_y msg))
    (cl:cons ':f_dynamics_relaccel_y_std (f_dynamics_relaccel_y_std msg))
    (cl:cons ':f_dynamics_relaccel_covariancexy (f_dynamics_relaccel_covariancexy msg))
    (cl:cons ':u_dynamics_orientation_invalidflags (u_dynamics_orientation_invalidflags msg))
    (cl:cons ':u_dynamics_orientation_rate_mean (u_dynamics_orientation_rate_mean msg))
    (cl:cons ':u_dynamics_orientation_rate_std (u_dynamics_orientation_rate_std msg))
    (cl:cons ':u_shape_length_status (u_shape_length_status msg))
    (cl:cons ':u_shape_length_edge_invalidflags (u_shape_length_edge_invalidflags msg))
    (cl:cons ':u_shape_length_edge_mean (u_shape_length_edge_mean msg))
    (cl:cons ':u_shape_length_edge_std (u_shape_length_edge_std msg))
    (cl:cons ':u_shape_width_status (u_shape_width_status msg))
    (cl:cons ':u_shape_width_edge_invalidflags (u_shape_width_edge_invalidflags msg))
    (cl:cons ':u_shape_width_edge_mean (u_shape_width_edge_mean msg))
    (cl:cons ':u_shape_width_edge_std (u_shape_width_edge_std msg))
))
