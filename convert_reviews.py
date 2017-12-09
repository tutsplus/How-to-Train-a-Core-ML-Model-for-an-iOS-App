from sklearn.linear_model import LinearRegression
import pandas
import coremltools

data = pandas.read_csv("LasVegas-Trip-Dataset.csv")
model = LinearRegression() 
print(data)
model.fit(
    data[["Nr. reviews", "Nr. hotel reviews", "Hotel stars"]], data["Score"])

coreml_model = coremltools.converters.sklearn.convert(
    model, ["Nr. reviews", "Nr. hotel reviews", "Hotel stars"], "Score")
coreml_model.save("Vegas_Reviews.mlmodel")
