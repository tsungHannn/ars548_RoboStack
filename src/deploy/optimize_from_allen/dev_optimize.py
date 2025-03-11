target = [[250, 991], [993, 773], [1015, 767], [1025, 764], [1047, 758], [1061, 754], [1065, 753], [1079, 742], [1096, 741], [1108, 740], [1129, 736], [1141, 730], [1155, 727], [1165, 725], [1178, 722], [1186, 720], [1198, 718], [1206, 717], [1213, 714], [1219, 713], [1220, 712], [1224, 709], [1225, 708], [1234, 708], [1244, 705], [1248, 705], [1256, 702], [1259, 702], [1267, 700], [1280, 697], [1285, 696], [1289, 694], [1290, 694], [1299, 692], [1305, 691], [1312, 691], [1314, 691], [1322, 690], [1325, 690], [1331, 688], [1333, 687], [1341, 685], [1349, 684], [1357, 682], [1359, 682], [1365, 681], [1371, 680], [1373, 680], [1379, 679], [1381, 678], [1385, 677], [1389, 677], [1390, 677], [1397, 677], [1404, 675], [1406, 675], [1411, 674], [1416, 672], [1422, 671], [1424, 670], [1428, 669], [1432, 669], [1433, 669], [1440, 667], [1443, 666], [1444, 665], [1449, 665], [1450, 665], [1456, 665], [1460, 664], [1465, 663], [1467, 663], [1471, 662], [1475, 661], [1477, 661], [1480, 661], [1485, 661], [1486, 661], [1490, 660], [1493, 660], [1495, 660], [1497, 659], [1500, 658], [1501, 658], [1505, 658], [1506, 657], [1508, 657], [1509, 657], [1509, 657], [1509, 656], [1509, 657], [1509, 657], [1509, 657], [1509, 657], [1509, 657], [1509, 657], [1509, 657], [1509, 657], [1509, 657], [1509, 657], [1509, 657], [1509, 657], [1509, 657], [1509, 657], [1509, 657], [1509, 657], [1508, 657], [1508, 657], [1508, 657], [1508, 657], [1508, 657], [1508, 657]]
source = [[1377, 745], [964, 725], [979, 728], [995, 729], [1011, 730], [1025, 734], [1037, 735], [1049, 737], [1064, 737], [1076, 738], [1095, 739], [1109, 739], [1114, 739], [1124, 740], [1133, 740], [1154, 741], [1164, 742], [1169, 742], [1177, 741], [1185, 740], [1192, 740], [1210, 741], [1221, 741], [1224, 742], [1239, 743], [1241, 743], [1238, 738], [1245, 736], [1251, 732], [1256, 730], [1258, 729], [1265, 728], [1272, 728], [1280, 727], [1292, 726], [1298, 726], [1304, 724], [1308, 722], [1313, 720], [1315, 719], [1326, 714], [1332, 712], [1332, 712], [1336, 710], [1341, 708], [1348, 705], [1361, 705], [1371, 704], [1375, 702], [1376, 701], [1376, 698], [1378, 698], [1379, 697], [1380, 695], [1389, 694], [1398, 694], [1404, 693], [1406, 692], [1410, 692], [1418, 691], [1420, 691], [1423, 690], [1427, 690], [1429, 690], [1431, 691], [1433, 692], [1436, 692], [1439, 690], [1443, 690], [1443, 690], [1448, 690], [1456, 690], [1460, 690], [1462, 690], [1466, 689], [1469, 689], [1470, 689], [1473, 689], [1475, 689], [1476, 689], [1480, 690], [1483, 689], [1491, 687], [1494, 687], [1497, 687], [1500, 687], [1508, 686], [1511, 686], [1512, 686], [1512, 686], [1512, 686], [1512, 686], [1512, 686], [1512, 686], [1512, 686], [1512, 686], [1511, 686], [1511, 686], [1511, 686], [1511, 686], [1511, 686], [1511, 686], [1511, 686], [1511, 686], [1511, 686], [1511, 686], [1511, 686], [1511, 686], [1511, 686], [1511, 686], [1511, 686], [1511, 686]]
import numpy as np
from scipy.optimize import minimize

class GridCoordinateOptimizer:
    def __init__(self, grid_size=(2, 2)):
        """
        Initialize the optimizer with source and target coordinates.
        
        Args:
            source (np.ndarray): Source coordinates of shape (n, 2)
            target (np.ndarray): Target coordinates of shape (n, 2)
            grid_size (tuple): Number of divisions in (x, y) directions
        """
        self.grid_size = grid_size
        self.region_labels = None
        self.transformations = None
        self.x_edges = None
        self.y_edges = None
    
    def save_transformations(self, path):
        """Save transformations to a file"""
        with open(path, 'w') as f:
            for params in self.transformations:
                f.write(','.join(map(str, params)) + '\n')
    
    def load_transformations(self, path):
        """Load transformations from a file"""
        self.set_edges()
        with open(path, 'r') as f:
            self.transformations = [list(map(float, line.strip().split(','))) for line in f]
    
    def get_region_for_point(self, point):
        """
        Get the region index for a given point.
        
        Args:
            point (np.ndarray): Single point coordinates of shape (2,)
            
        Returns:
            int: Region index, or None if point is outside all regions
        """
        x, y = point
        
        # Check if point is within bounds
        if (x < self.x_edges[0] or x > self.x_edges[-1] or 
            y < self.y_edges[0] or y > self.y_edges[-1]):
            return None
            
        x_idx = np.searchsorted(self.x_edges, x) - 1
        y_idx = np.searchsorted(self.y_edges, y) - 1
        
        return y_idx * self.grid_size[0] + x_idx
    
    def transform_new_points(self, points):
        """
        Transform new points using the optimized grid transformations.
        
        Args:
            points (np.ndarray): Points to transform, shape (n, 2)
            
        Returns:
            np.ndarray: Transformed points, shape (n, 2)
            np.ndarray: Region indices for each point
        """
        if self.transformations is None:
            raise ValueError("Must run optimize() first")
            
        points = np.asarray(points)
        transformed = np.zeros_like(points)
        region_indices = np.zeros(len(points), dtype=int)
        
        for i, point in enumerate(points):
            region_idx = self.get_region_for_point(point)
            
            # If point is outside all regions, use nearest region
            if region_idx is None:
                # Find nearest edge point
                x_clamped = np.clip(point[0], self.x_edges[0], self.x_edges[-1])
                y_clamped = np.clip(point[1], self.y_edges[0], self.y_edges[-1])
                region_idx = self.get_region_for_point(np.array([x_clamped, y_clamped]))
            
            region_indices[i] = region_idx
            transformed[i] = self.transform_points(point.reshape(1, -1), 
                                                self.transformations[region_idx])[0]
            
        return transformed, region_indices

    def set_edges(self):
        x_min, x_max = 0, 2048
        y_min, y_max = 0, 1536
        
        # Add small epsilon to ensure all points are included
        eps = 1e-10
        x_max += eps
        y_max += eps
        
        # Create edge points for the grid
        self.x_edges = np.linspace(x_min, x_max, self.grid_size[0] + 1)
        self.y_edges = np.linspace(y_min, y_max, self.grid_size[1] + 1)
        
    def divide_regions(self):
        """Divide the coordinate space into a grid of regions"""
        # x_min, x_max = self.source[:, 0].min(), self.source[:, 0].max()
        # y_min, y_max = self.source[:, 1].min(), self.source[:, 1].max()
        self.set_edges()
        
        # Assign region labels to each point
        self.region_labels = np.zeros(len(self.source), dtype=int)
        for i in range(len(self.source)):
            x, y = self.source[i]
            x_idx = np.searchsorted(self.x_edges, x) - 1
            y_idx = np.searchsorted(self.y_edges, y) - 1
            self.region_labels[i] = y_idx * self.grid_size[0] + x_idx
            
        return self.region_labels
    
    def transform_params_to_matrix(self, params):
        """Convert optimization parameters to transformation matrix"""
        # params: [scale_x, scale_y, rotation, translate_x, translate_y]
        scale_x, scale_y, theta, tx, ty = params
        cos_theta = np.cos(theta)
        sin_theta = np.sin(theta)
        
        matrix = np.array([
            [scale_x * cos_theta, -scale_y * sin_theta, tx],
            [scale_x * sin_theta, scale_y * cos_theta, ty],
            [0, 0, 1]
        ])
        return matrix
    
    def transform_points(self, points, params):
        """Apply transformation to points"""
        matrix = self.transform_params_to_matrix(params)
        points_homogeneous = np.hstack([points, np.ones((len(points), 1))])
        transformed = points_homogeneous @ matrix.T
        return transformed[:, :2]
    
    def region_error(self, params, source_points, target_points):
        """Calculate error for a specific region"""
        transformed = self.transform_points(source_points, params)
        return np.sum((transformed - target_points) ** 2)
    
    def optimize_region(self, region_idx):
        """Optimize transformation parameters for a specific region"""
        mask = self.region_labels == region_idx
        source_points = self.source[mask]
        target_points = self.target[mask]
        
        # Skip if no points in region
        if len(source_points) == 0:
            return None
        
        # Initial parameters: [scale_x, scale_y, rotation, translate_x, translate_y]
        initial_params = [1.0, 1.0, 0.0, 0.0, 0.0]
        
        result = minimize(
            self.region_error,
            initial_params,
            args=(source_points, target_points),
            method='Nelder-Mead',
            options={'maxiter': 1000}
        )
        
        return result.x if result.success else None
    
    def optimize(self, source, target):
        """Optimize transformations for all regions"""
        self.source = np.asarray(source)
        self.target = np.asarray(target)

        if self.region_labels is None:
            self.divide_regions()
            
        self.transformations = []
        total_error = 0
        n_regions = self.grid_size[0] * self.grid_size[1]
        
        for region_idx in range(n_regions):
            params = self.optimize_region(region_idx)
            
            # If region has no points or optimization failed, use identity transformation
            if params is None:
                params = [1.0, 1.0, 0.0, 0.0, 0.0]
            
            self.transformations.append(params)
            
            # Calculate error for this region
            mask = self.region_labels == region_idx
            if np.any(mask):  # Only calculate error if region has points
                source_points = self.source[mask]
                target_points = self.target[mask]
                error = self.region_error(params, source_points, target_points)
                total_error += error
            
        return self.transformations, total_error
    
    def transform_all_points(self):
        """Transform all points using their respective regional transformations"""
        if self.transformations is None:
            raise ValueError("Must run optimize() first")
            
        transformed = np.zeros_like(self.source)
        n_regions = self.grid_size[0] * self.grid_size[1]
        
        for region_idx in range(n_regions):
            mask = self.region_labels == region_idx
            if np.any(mask):  # Only transform if region has points
                transformed[mask] = self.transform_points(
                    self.source[mask],
                    self.transformations[region_idx]
                )
        return transformed
    
    def get_region_bounds(self):
        """Get the boundary coordinates for each region"""
        region_bounds = []
        for y in range(self.grid_size[1]):
            for x in range(self.grid_size[0]):
                bounds = {
                    'x_min': self.x_edges[x],
                    'x_max': self.x_edges[x + 1],
                    'y_min': self.y_edges[y],
                    'y_max': self.y_edges[y + 1]
                }
                region_bounds.append(bounds)
        return region_bounds

# Example usage:
if __name__ == "__main__":
    source = np.array(source)
    target = np.array(target)

    # Create and run optimizer
    optimizer = GridCoordinateOptimizer(grid_size=(32, 32))
    transformations, total_error = optimizer.optimize(source, target)
    transformed = optimizer.transform_all_points()
    
    print(f"Total optimization error: {total_error}")
    
    # Calculate and print error reduction
    initial_error = np.sum((source - target) ** 2)
    error_reduction = (initial_error - total_error) / initial_error * 100
    print(f"Error reduction: {error_reduction:.2f}%")

    optimizer.save_transformations('transformations.txt')
    
    # plot before and after
    import matplotlib.pyplot as plt
    plt.figure(figsize=(12, 6))
    plt.subplot(121)
    plt.scatter(source[:, 0], source[:, 1], label='Source', c='b')
    plt.scatter(target[:, 0], target[:, 1], label='Target', c='r')
    plt.title('Before Optimization')
    plt.legend()
    plt.axis('equal')
    plt.subplot(122)
    plt.scatter(transformed[:, 0], transformed[:, 1], label='Transformed', c='g')
    plt.scatter(target[:, 0], target[:, 1], label='Target', c='r')
    plt.title('After Optimization')
    plt.legend()
    plt.axis('equal')
    plt.show()
    
    # # Print transformations and bounds for each region
    # region_bounds = optimizer.get_region_bounds()
    # for i, (params, bounds) in enumerate(zip(transformations, region_bounds)):
    #     print(f"\nRegion {i}:")
    #     print(f"Bounds: x=[{bounds['x_min']:.2f}, {bounds['x_max']:.2f}], "
    #           f"y=[{bounds['y_min']:.2f}, {bounds['y_max']:.2f}]")
    #     print(f"Scale X: {params[0]:.3f}")
    #     print(f"Scale Y: {params[1]:.3f}")
    #     print(f"Rotation (rad): {params[2]:.3f}")
    #     print(f"Translation X: {params[3]:.3f}")
    #     print(f"Translation Y: {params[4]:.3f}")