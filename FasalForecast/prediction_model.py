import os
import glob
import numpy as np
import tensorflow as tf
from tensorflow.keras.preprocessing import image
from tensorflow.keras.applications.inception_v3 import preprocess_input
from tensorflow.keras.models import load_model


def predict_disease():
    model_path = str(os.getcwd()) + '/FasalForecast/crop_disease_identification_model.h5'
    model = load_model(model_path)

    labels = ['American Bollworm on Cotton', 'Anthracnose on Cotton', 'Army worm',
            'bacterial_blight in Cotton', 'Becterial Blight in Rice', 'bollrot on Cotton',
                'bollworm on Cotton', 'Brownspot', 'Common_Rust', 'Cotton Aphid', 
                'cotton mealy bug', 'cotton whitefly', 'Flag Smut', 'Gray_Leaf_Spot',
                'Healthy cotton', 'Healthy Maize', 'Healthy Wheat', 'Leaf Curl', 'Leaf smut', 
                'maize ear rot', 'maize fall armyworm', 'maize stem borer', 
            'Mosaic sugarcane', 'pink bollworm in cotton', 'red cotton bug', 'RedRot sugarcane', 
            'RedRust sugarcane', 'Rice Blast', 'Sugarcane Healthy', 'thirps on  cotton', 
            'Tungro', 'Wheat aphid', 'Wheat black rust']
    image_path = os.getcwd() + '/FasalForecast/static/uploads/image.jpg' # not working
    img = image.load_img(image_path, target_size=(299, 299))  # Load the image with target size matching the model input
    img_array = image.img_to_array(img)  # Convert the image to a NumPy array
    img_array = np.expand_dims(img_array, axis=0)  # Expand dimensions to match model input
    img_array = preprocess_input(img_array)  # Preprocess the image for InceptionV3

    # Make prediction
    predictions = model.predict(img_array)
    predicted_class = np.argmax(predictions, axis=1)  # Get the index of the highest probability
    if predicted_class[0] < len(labels):
        predicted_label = labels[predicted_class[0]]
    else:
        predicted_label = "Unknown"
    predicted_probability = np.max(predictions) 
    print("prediction", predicted_probability)

    if predicted_probability < 0.2:
        print("Retake the image")
    else:
        print("Crop Detected!")
    dictionary = {'label': predicted_label, 'index': predicted_class[0]}
    # print(f'Predicted class label: {predicted_label}')

    # print(f"Predicted class index: {predicted_class[0]}")
    return dictionary

print(predict_disease())