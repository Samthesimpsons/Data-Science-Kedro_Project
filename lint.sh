# Linting script
echo "--------- Formatter with black ---------"
black ~/OneDrive/Desktop/Data Science Project/src/ --line-length=88 --preview
echo "--------- Linting with flake8 ---------"
flake8 ~/OneDrive/Desktop/Data Science Project/src/ --max-length=88
echo "--------- Type checking with mypy ---------"
mypy ~/OneDrive/Desktop/Data Science Project/src/