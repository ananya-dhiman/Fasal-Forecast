import os
import numpy as np
import tensorflow as tf
from tensorflow.keras.preprocessing import image
from tensorflow.keras.applications.inception_v3 import preprocess_input
from tensorflow.keras.models import load_model
import locale
import sys

def predict_disease():
    try:
        # Define paths
        model_path = os.path.join(os.getcwd(), 'crop_disease_identification_model.h5')
        image_path = os.path.join(os.getcwd(), 'static', 'uploads', 'image.jpg')

        # Check if the model and image file exist
        if not os.path.exists(model_path):
            return {'error': 'Model file not found.'}

        if not os.path.exists(image_path):
            return {'error': 'Image file not found.'}

        # Load the pre-trained model
        model = load_model(model_path)

        # Class labels for the model predictions
        labels = ['American Bollworm on Cotton', 'Anthracnose on Cotton', 'Army worm',
                  'Bacterial Blight in Cotton', 'Bacterial Blight in Rice', 'Bollrot on Cotton',
                  'Bollworm on Cotton', 'Brownspot', 'Common Rust', 'Cotton Aphid', 
                  'Cotton Mealy Bug', 'Cotton Whitefly', 'Flag Smut', 'Gray Leaf Spot',
                  'Healthy Cotton', 'Healthy Maize', 'Healthy Wheat', 'Leaf Curl', 'Leaf Smut', 
                  'Maize Ear Rot', 'Maize Fall Armyworm', 'Maize Stem Borer', 
                  'Mosaic Sugarcane', 'Pink Bollworm in Cotton', 'Red Cotton Bug', 
                  'RedRot Sugarcane', 'RedRust Sugarcane', 'Rice Blast', 'Sugarcane Healthy', 
                  'Thrips on Cotton', 'Tungro', 'Wheat Aphid', 'Wheat Black Rust']

        # Load and preprocess the image
        img = image.load_img(image_path, target_size=(299, 299))  # Adjust size to match model input
        img_array = image.img_to_array(img)
        img_array = np.expand_dims(img_array, axis=0)
        img_array = preprocess_input(img_array)

        # Make the prediction
        predictions = model.predict(img_array)
        predicted_class = np.argmax(predictions, axis=1)  # Get the index of the highest probability
        predicted_probability = float(np.max(predictions))  # Convert the highest prediction probability to float

        # Get the corresponding label
        if predicted_class[0] < len(labels):
            predicted_label = labels[predicted_class[0]]
        else:
            predicted_label = "Unknown"
        predicted_probability *= 100
        predicted_probability = round(predicted_probability,2)
        # Check prediction confidence and return appropriate response
        if predicted_probability < 10:
            return {'message': 'Retake the image. Low confidence.', 'confidence': predicted_probability}
        else:
            return {'label': predicted_label, 'confidence': predicted_probability, 'index': int(predicted_class[0])}

    except Exception as e:
        return {'error': str(e)}