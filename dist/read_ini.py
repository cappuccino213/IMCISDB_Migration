#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/19 9:53
# @Author  : Zhangyp
# @File    : read_ini.py
# @Software: PyCharm
# @license : Copyright(C), eWord Technology Co., Ltd.
# @Contact : yeahcheung213@163.com
import configparser
conf = configparser.ConfigParser()
conf.read('conf.ini',encoding='utf-8')

try:
	host1 = conf.get("db1","host")
	user1 = conf.get("db1","user")
	password1 = conf.get("db1","password")
	datebase1 = conf.get("db1","datebase")
	
	host2 = conf.get("db2","host")
	user2 = conf.get("db2","user")
	password2 = conf.get("db2","password")
	datebase2 = conf.get("db2","datebase")
	
	set_size = conf.getint("MigrationData","set_size")
	m_type = conf.getint("MigrationData","mt")
	tname = conf.get("MigrationData","table")

except Exception as e:
	print("read conf.ini falsed,reason: %s"%str(e))
	
	

