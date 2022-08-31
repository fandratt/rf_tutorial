# Robot Framework

## Run Robot

> Run Specific Robot File

```sh
robot -d Results /path/path/file.robot
```

> Run Robot Specific Tags

```sh
robot -d Results --include tagName /path/path/folder/
```

> Run Specific Test Case from a Test Suite

```sh
robot -d Results -t "test case name here" /path/path/file.robot
```

## VENV for Testing locally in Unix or Linux based OS

```text
pip3 install virtualenv
virtualenv venv
python3 -m virtualenv venv
source venv/bin/activate
pip3 install -r requirements.txt
```

## VENV for Testing locally in Windows based OS

```text
pip3 install virtualenv
virtualenv venv
python3 -m virtualenv venv
.\venv\Scripts\activate
pip3 install -r requirements.txt
```

### Turn OFF venv

```text
deactivate
```

### Set Execution Policy in Windows based OS

```text
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
```
