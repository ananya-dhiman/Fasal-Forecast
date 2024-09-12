import tensorflow as tf
from tensorflow.keras.preprocessing import image
from tensorflow.keras.preprocessing.image import ImageDataGenerator,load_img
from tensorflow.keras.applications.inception_v3 import preprocess_input
from tensorflow.keras.models import load_model
import numpy as np
import os

def predict(image_path):
    # Load the saved model
    model = load_model('crop_disease_identification_model.h5')
    train_data_dir = os.getcwd() + "/static/archive/Train"
    img_width, img_height = 299, 299
    batch_size = 8 #8 or 4
    epochs = 5
    # Define the image path
    train_datagen = ImageDataGenerator(rescale=1./255)
    validation_datagen = ImageDataGenerator(rescale=1./255)

    train_generator = train_datagen.flow_from_directory(
        train_data_dir,
        target_size=(img_width, img_height),
        batch_size=batch_size,
        class_mode='categorical')
    # Load and preprocess the image
    img = image.load_img(image_path, target_size=(299, 299))  # Load the image with target size matching the model input
    img_array = image.img_to_array(img)  # Convert the image to a NumPy array
    img_array = np.expand_dims(img_array, axis=0)  # Expand dimensions to match model input
    img_array = preprocess_input(img_array)  # Preprocess the image for InceptionV3

    # Make predictions
    predictions = model.predict(img_array)
    predicted_class = np.argmax(predictions, axis=1)  # Get the index of the highest probability

    # Map the predicted class index to the class label (assuming you have class indices from the training data)
    class_labels = train_generator.class_indices  # Get class indices from the training generator
    class_labels = {v: k for k, v in class_labels.items()}  # Reverse the dictionary to get labels from indices

    predicted_label = class_labels[predicted_class[0]]

    # Output the results
    dictionary = {'index': predicted_class[0], 'label': predicted_label}

    # print(f'Predicted class index: {predicted_class[0]}')
    # print(f'Predicted class label: {predicted_label}')

    return dictionary