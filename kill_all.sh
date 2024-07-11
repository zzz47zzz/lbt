echo 'Kill all "bash ./shell/todo" and "python main.py" process...'

ps -ef | grep zjh | grep bash | grep ./shell/todo | awk '{print $2}' | xargs kill -9
ps -ef | grep zjh | grep python | grep main_CL.py | awk '{print $2}' | xargs kill -9
rm -rf nohup*.out