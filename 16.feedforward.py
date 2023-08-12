import numpy as np
class FeedForwardNN:
    def __init__(self, input_size, hidden_size, output_size):
        self.input_size = input_size
        self.hidden_size = hidden_size
        self.output_size = output_size
        self.weights_input_hidden = np.random.randn(self.input_size, self.hidden_size)
        self.bias_hidden = np.zeros((1, self.hidden_size))
        self.weights_hidden_output = np.random.randn(self.hidden_size, self.output_size)
        self.bias_output = np.zeros((1, self.output_size))
    def sigmoid(self, x):
        return 1 / (1 + np.exp(-x))
    def sigmoid_derivative(self, x):
        return x * (1 - x)
    def forward(self, input_data):
        self.hidden_input = np.dot(input_data, self.weights_input_hidden) + self.bias_hidden
        self.hidden_output = self.sigmoid(self.hidden_input)
        self.final_input = np.dot(self.hidden_output, self.weights_hidden_output) + self.bias_output
        self.final_output = self.sigmoid(self.final_input)
        return self.final_output
    def backward(self, input_data, target, learning_rate):
        error = target - self.final_output
        d_output = error * self.sigmoid_derivative(self.final_output)
        error_hidden = d_output.dot(self.weights_hidden_output.T)
        d_hidden = error_hidden * self.sigmoid_derivative(self.hidden_output)
        self.weights_hidden_output += self.hidden_output.T.dot(d_output) * learning_rate
        self.bias_output += np.sum(d_output) * learning_rate
        input_data = input_data.reshape(1, -1)
        self.weights_input_hidden += input_data.T.dot(d_hidden) * learning_rate
        self.bias_hidden += np.sum(d_hidden) * learning_rate
    def train(self, inputs, targets, epochs, learning_rate):
        for _ in range(epochs):
            for input_data, target in zip(inputs, targets):
                self.forward(input_data)
                self.backward(input_data, target, learning_rate)
    def predict(self, inputs):
        predictions = []
        for input_data in inputs:
            prediction = self.forward(input_data)
            predictions.append(prediction)
        return np.array(predictions)
if __name__ == "__main__":
    np.random.seed(0)
    num_samples = 100
    input_data = np.random.rand(num_samples, 2)
    targets = (input_data[:, 0] + input_data[:, 1] > 1).astype(int)
    input_size = 2
    hidden_size = 4
    output_size = 1
    epochs = 1000
    learning_rate = 0.1
    nn = FeedForwardNN(input_size, hidden_size, output_size)
    nn.train(input_data, targets, epochs, learning_rate)
    test_data = np.array([[0.4, 0.7], [0.3, 0.2]])
    predictions = nn.predict(test_data)
    for i, prediction in enumerate(predictions):
        print(f"Input: {test_data[i]} => Prediction: {prediction[0]}")
