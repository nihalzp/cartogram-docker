# Setting Up PyCharm for Developing the go-cart.io Website

PyCharm is the recommended IDE to use while developing the go-cart.io website. You will need to use the Professional edition to take advantage of Docker integration that will allow for code completion and correct import error detection. This document will help you set up PyCharm for development of the go-cart.io website on your computer. It assumes that you have already set up the Docker application for the website. If you have not done so, please do this by following the guide in `README.md`.

## Installing PyCharm

To begin, you will need to install PyCharm Professional Edition. 

**Note:** If you are a student or educator at an accredited educational instutition, you can use the Professional Edition free of charge via a JetBrains Educational License. The easiest way to get this license is to first sign up for GitHub Education Benefits at https://education.github.com/discount_requests/new. Then, sign up for a JetBrains Educational License at https://www.jetbrains.com/shop/eform/students and simply sign in to your GitHub account to verify your student status.

Download the Professional Edition at https://www.jetbrains.com/pycharm/download, and follow the installation instructions for your operating system.

## Setting up Docker with PyCharm

Start PyCharm. You should be greeted with a screen asking you to open or create a new project:

![](images/pycharm-1.png)

Click on the 'Configure' button on the bottom-right, and select 'Settings'. In the window that pops up, navigate to 'Build, Execution, Deployment' and 'Docker'. Click the '+' button to inform PyCharm of your Docker setup.

![](images/pycharm-2.png)

If you are using Linux, select 'Unix socket'. If you are using Mac, select 'Docker for Mac'. If you are using Windows, select 'TCP socket', and enter `tcp://localhost:2375` for the Engine API URL. Click 'OK' to save your changes and exit the settings window.

## Setting Up `cartogram-web` with PyCharm

In the welcome screen, click 'Open'. Alternatively, if you already have a project open in PyCharm, navigate to 'File' and 'Open...' in the menubar. Select the `cartogram-web` folder  and click 'OK'. If prompted, indicate that you want to open the project in a new window.

![](images/pycharm-3.png)

In the project pane on the left, navigate to the `internal` folder, and double click on `web.py` to open it. You will notice that all of the imports are highlighted in red. We are going to configure PyCharm to integrate with our Docker application to fix this. You should notice that an option to select which version of Python to use appears in the bottom-right of the status bar.

![](images/pycharm-4.png)

Click on it, and click on 'Add Interpreter...'. In the window that appears, select 'Docker Compose'.

![](images/pycharm-5.png)

Click the folder icon under 'Configuration file(s)', and click the '+' button. Select the `docker-compose.yml` file in the `cartogram-docker` folder, and click 'OK' twice:

![](images/pycharm-6.png)

![](images/pycharm-7.png)

Now, in the 'Add Python Interpreter' window, select the `web` service and click OK.

Now, in the menu bar, navigate to 'File' and 'Settings...'. In the settings window that pops up, navigate to 'Project: cartogram-web' and 'Project Interpreter'. Select the new interpreter we just added (it should have a name like 'Remote Python 3.7.4 Docker Compose **(web...**'). Your settings window should look something like this, including the listed packages:

![](images/pycharm-8.png)

Now navigate to 'Project Structure' on the left. Click on the `internal` folder, and then 'Sources' at the top to mark `internal` as the root of Python source files for the project. Make sure the sub-folder `templates` is also marked as a template folder:

![](images/pycharm-9.png)

Click 'OK' to exit the settings window. After a moment, you should notice that the import errors in `web.py` have disappeared:

![](images/pycharm-10.png)

This means you are all done. You can use PyCharm's code completion and code navigation features in the `cartogram-web` project.

## Setting Up `cartogram-serverless` with PyCharm

In the welcome screen, click 'Open'. Alternatively, if you already have a project open in PyCharm, navigate to 'File' and 'Open...' in the menubar. Select the `cartogram-web` folder  and click 'OK'. If prompted, indicate that you want to open the project in a new window:

![](images/pycharm-11.png)

In the project pane on the left, double-click on `simulate_lambda.py` to open it. You will notice that all of the imports are highlighted in red. We are going to configure PyCharm to integrate with our Docker application to fix this. You should notice that an option to select which version of Python to use appears in the bottom-right of the status bar.

![](images/pycharm-12.png)

Click on it, and click on 'Add Interpreter...'. In the window that appears, select 'Docker Compose'.

![](images/pycharm-5.png)

Click the folder icon under 'Configuration file(s)', and click the '+' button. Select the `docker-compose.yml` file in the `cartogram-docker` folder, and click 'OK' twice:

![](images/pycharm-6.png)

![](images/pycharm-7.png)

Now, in the 'Add Python Interpreter' window, select the `serverless` service and click OK.

Now, in the menu bar, navigate to 'File' and 'Settings...'. In the settings window that pops up, navigate to 'Project: cartogram-serverless' and 'Project Interpreter'. Select the new interpreter we just added (it should have a name like 'Remote Python 3.7.4 Docker Compose **(serverless...**'). Your settings window should look something like this, including the listed packages:

![](images/pycharm-13.png)

Now navigate to 'Project Structure' on the left. Click on the `lambda_package` folder, and then 'Sources' at the top to mark `lambda_package` as the root of Python source files for the project:

![](images/pycharm-14.png)

Click 'OK' to exit the settings window. After a moment, you should notice that the import errors in `simulate_lambda.py` have disappeared:

![](images/pycharm-15.png)

This means you are all done. You can use PyCharm's code completion and code navigation features in the `cartogram-serverless` project.