import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report, accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, LabelEncoder

# Load the train and test datasets
train_df = pd.read_csv('train.csv')
test_df = pd.read_csv('test.csv')

# Display the first few rows of the train dataset
print(train_df.head())

# Display the first few rows of the test dataset
print(test_df.head())

# Load the train.csv file
train_df = pd.read_csv('train.csv')

# Display the head and summary statistics of the train dataframe
print(train_df.head())
print(train_df.describe())

test_df = pd.read_csv('test.csv')

# Display the head and summary statistics of the test dataframe
print(test_df.head())
print(test_df.describe())

sample_submission_df = pd.read_csv('sample_submission.csv')

# Display the head and summary statistics of the sample submission dataframe
print(sample_submission_df.head())
print(sample_submission_df.describe())

#Encode the 'Severity' column in the training dataset
label_encoder = LabelEncoder()
train_df['Severity'] = label_encoder.fit_transform(train_df['Severity'])

# Separate features and target variable from the training dataset
X = train_df.drop(columns=['Severity', 'Accident_ID'])
y = train_df['Severity']

# Scale the features
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Apply the same scaling to the test dataset
X_test = test_df.drop(columns=['Accident_ID'])
X_test_scaled = scaler.transform(X_test)

# Split the training data into training and validation sets
X_train, X_val, y_train, y_val = train_test_split(X_scaled, y, test_size=0.2, random_state=42)

print('Preprocessing done.')
# Train a RandomForestClassifier
model = RandomForestClassifier(random_state=42)
model.fit(X_train, y_train)

# Predict on the validation set
y_val_pred = model.predict(X_val)

# Evaluate the model
accuracy = accuracy_score(y_val, y_val_pred)
report = classification_report(y_val, y_val_pred, target_names=label_encoder.classes_)

print('Validation Accuracy:', accuracy)
print('Classification Report:\
', report)


# Predict the severity for the test dataset
predictions = model.predict(X_test_scaled)

# Decode the predictions back to original labels
predictions_decoded = label_encoder.inverse_transform(predictions)

# Prepare the submission dataframe
submission_df = test_df[['Accident_ID']].copy()
submission_df['Severity'] = predictions_decoded

# Save the submission dataframe to a CSV file
submission_df.to_csv('submission.csv', index=False)

print('Predictions saved to submission.csv')