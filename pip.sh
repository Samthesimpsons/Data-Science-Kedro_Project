echo "Making virtual env"
python -m venv env

echo "Activating venv"
source env/Scripts/activate

echo "Installing python packages from requirements.txt"
pip3 install -r requirements.txt
echo "Installed all the packages!"
