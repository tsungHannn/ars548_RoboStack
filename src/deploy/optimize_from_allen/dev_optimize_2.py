import numpy as np
from scipy.optimize import minimize

class PointTransformOptimizer:
    def __init__(self, source=None, target=None):
        """
        Initialize the optimizer with source and target points.
        
        Args:
            source (np.ndarray): Source points with shape (N, F) where F >= 2
            target (np.ndarray): Target points with shape (N, 2)
        """
        self.source = source
        self.target = target
        if source is not None:
            self.n_features = source.shape[1]
        self.transformation_matrix = None
    
    def load_transformations(self, filename):
        """
        Load a transformation matrix from a file.
        
        Args:
            filename (str): Path to load the transformation matrix
        """
        self.transformation_matrix = np.load(filename)
    
    def transform_new_points(self, new_points):
        """
        Transform new points using the learned transformation matrix.
        
        Args:
            new_points (np.ndarray): New points to transform with shape (M, F)
            
        Returns:
            np.ndarray: Transformed new points with shape (M, 2)
        """
        if self.transformation_matrix is None:
            raise ValueError("No transformation matrix available. Run optimize() first.")
        
        return np.dot(new_points, self.transformation_matrix)
        
    def transform_points(self, params):
        """
        Apply transformation matrix to source points.
        
        Args:
            params (np.ndarray): Flattened transformation matrix
            
        Returns:
            np.ndarray: Transformed points with shape (N, 2)
        """
        matrix = params.reshape((self.n_features, 2))
        return np.dot(self.source, matrix)
    
    def objective_function(self, params):
        """
        Calculate MSE between transformed points and targets.
        
        Args:
            params (np.ndarray): Flattened transformation matrix
            
        Returns:
            float: Mean squared error
        """
        transformed = self.transform_points(params)
        return np.mean(np.sum((transformed - self.target) ** 2, axis=1))
    
    def optimize(self, max_iter=1000):
        """
        Optimize the transformation matrix.
        
        Args:
            max_iter (int): Maximum number of iterations
            
        Returns:
            tuple: (transformed points, total error)
        """
        # Initialize transformation matrix
        initial_matrix = np.zeros((self.n_features, 2))
        initial_matrix[0, 0] = 1  # Initialize with identity for first 2 dimensions
        initial_matrix[1, 1] = 1
        initial_params = initial_matrix.flatten()
        
        # Optimize
        result = minimize(
            self.objective_function,
            initial_params,
            method='BFGS',
            options={'maxiter': max_iter}
        )
        
        # Store the optimal transformation matrix
        self.transformation_matrix = result.x.reshape((self.n_features, 2))
        
        # Transform points using optimal matrix
        transformed_points = self.transform_points(result.x)
        total_error = result.fun
        
        return transformed_points, total_error
    
    def save_transformations(self, filename):
        """
        Save the transformation matrix to a file.
        
        Args:
            filename (str): Path to save the transformation matrix
        """
        if self.transformation_matrix is not None:
            np.save(filename, self.transformation_matrix)
        else:
            raise ValueError("No transformation matrix available. Run optimize() first.")

# Example usage:
if __name__ == "__main__":
    # Load source and target points
    source = np.load('source.npy')
    target = np.load('target.npy')
    print(source.shape, target.shape)  # (N, 7) (N, 2)
    
    # Create and run optimizer
    optimizer = PointTransformOptimizer(source, target)
    transformed, total_error = optimizer.optimize()
    
    print(f"Total optimization error: {total_error}")
    
    # Calculate and print error reduction
    initial_error = np.mean(np.sum((source[:, :2] - target) ** 2, axis=1))
    error_reduction = (initial_error - total_error) / initial_error * 100
    print(f"Error reduction: {error_reduction:.2f}%")
    
    # Save transformation matrix
    optimizer.save_transformations('transformations.npy')
    
    # Plot before and after
    import matplotlib.pyplot as plt
    plt.figure(figsize=(12, 6))
    
    # Before optimization
    plt.subplot(121)
    plt.scatter(source[:, 0], source[:, 1], label='Source', c='b', alpha=0.6)
    plt.scatter(target[:, 0], target[:, 1], label='Target', c='r', alpha=0.6)
    plt.title('Before Optimization')
    plt.legend()
    plt.axis('equal')
    
    # After optimization
    plt.subplot(122)
    plt.scatter(transformed[:, 0], transformed[:, 1], label='Transformed', c='g', alpha=0.6)
    plt.scatter(target[:, 0], target[:, 1], label='Target', c='r', alpha=0.6)
    plt.title('After Optimization')
    plt.legend()
    plt.axis('equal')
    
    plt.tight_layout()
    plt.show()