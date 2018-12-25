#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/10/9 15:04
# @Author  : Zhangyp
# @File    : ReadSql.py
# @Software: PyCharm
# @license : Copyright(C), eWord Technology Co., Ltd.
# @Contact : yeahcheung213@163.com
import os
def view_sql():
	try:
		with open(os.getcwd()+'\script\ExamResult.sql','r',encoding='utf8') as fp:
			sql=fp.read()
		return sql
	except Exception as e:
		print(str(e))
		
# print(view_sql())

def select_sql():
	try:
		with open(os.getcwd()+'\script\select.sql','r',encoding='utf8') as fp:
			sql=fp.read()
		return sql
	except Exception as e:
		print(str(e))
# print(select_sql())
		
def insert_sql():
	try:
		with open(os.getcwd()+'\script\insert.sql','r',encoding='utf8') as fp:
			sql=fp.read()
		return sql
	except Exception as e:
		print(str(e))
print(insert_sql())