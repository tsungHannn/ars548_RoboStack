from scipy.spatial.transform import Rotation
import numpy as np

class Test:
    def quaternion_to_rotation_matrix(self, param_quat):
            # param_quat: [Qx, Qy, Qz, Qw, Tx, Ty, Tz]
            qx, qy, qz, qw = param_quat[:4]
            r = Rotation.from_quat([qx, qy, qz, qw])
            return r.as_matrix()  # shape: (3, 3)

    def normalize_quaternion(self, param_quat):
        # param_quat: [Qx, Qy, Qz, Qw, Tx, Ty, Tz]
        qx, qy, qz, qw = param_quat[:4]
        tx, ty, tz = param_quat[4:]
        norm = np.sqrt(qx**2 + qy**2 + qz**2 + qw**2)
        qx /= norm
        qy /= norm
        qz /= norm
        qw /= norm
        # return [qx, qy, qz, qw, tx, ty, tz]
        # 將每個元素轉換為 float 類型，避免出現 np.float64
        return [float(qx), float(qy), float(qz), float(qw), float(tx), float(ty), float(tz)]

    def transformation_matrix(self, param_quat):
            # 四元數表示
            # qx, qy, qz, qw, tx, ty, tz = extrinsics_param
            normalized_quat = self.normalize_quaternion(param_quat)
            R_mat = self.quaternion_to_rotation_matrix(normalized_quat)
            T = np.array([normalized_quat[4], normalized_quat[5], normalized_quat[6]])  # Tx, Ty, Tz
            
            # 構建齊次變換矩陣 4x4
            transformation_matrix = np.eye(4)
            transformation_matrix[:3, :3] = R_mat  # 上三角放旋轉矩陣
            transformation_matrix[:3, 3] = T   # 最後一列放位移
            
            return transformation_matrix


if __name__ == "__main__":
    test = Test()
    param_quat = [0.51, 0.49, -0.49, 0.48, 0.57, -3.09, -5.39]
    T = test.transformation_matrix(param_quat)
    print("Transformation Matrix:\n", T)
