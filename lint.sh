# Linting script
echo "--------- Formatter with black ---------"
black ~/OneDrive/Desktop/DS_Project/src/ --line-length=88 --preview
echo "--------- Linting with flake8 ---------"
flake8 ~/OneDrive/Desktop/DS_Project/src/ --max-line-length=88
echo "--------- Type checking with mypy ---------"
mypy ~/OneDrive/Desktop/DS_Project/src/