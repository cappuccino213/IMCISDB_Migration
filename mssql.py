#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/18 21:11
# @Author  : Zhangyp
# @File    : mssql.py
# @Software: PyCharm
# @license : Copyright(C), eWord Technology Co., Ltd.
# @Contact : yeahcheung213@163.com
import pymssql
# import importlib,sys,os
#
# importlib.reload(sys)
# os.environ['NLS_LANG'] = 'SIMPLIFIED CHINESE_CHINA.UTF8'

class MSSQL:
	"""
	对pymssql的简单封装
	使用该库时，需要在Sql Server configuration Mnanage里面讲TCP/IP协议开启
	"""
	def __init__(self, host, user, pwd, db):
		self.host = host
		self.user = user
		self.pwd = pwd
		self.db = db
	
	def __GetConnect(self):
		if not self.db:
			raise (NameError, "没有设置数据库信息")
		self.conn = pymssql.connect(host=self.host,
									user=self.user,
									password=self.pwd,
									database=self.db,
									charset="utf8"
									)
		cur = self.conn.cursor()
		if not cur:
			raise (NameError, "连接数据库失败")
		else:
			return cur
	
	def ExecQuery(self, sql):
		cur = self.__GetConnect()
		cur.execute(sql)
		resList = cur.fetchall()
		
		# 查询完毕后必须关闭连接
		self.conn.close()
		return resList
	
	def ExecNoQuery(self, sql):  # 更新语句
		cur = self.__GetConnect()
		try:
			cur.execute(sql)
			self.conn.commit()
		except Exception as ex:
			self.conn.rollback()
		finally:
			self.conn.close()
			
	def ExecMany(self, sql,list):  # 更新语句
		cur = self.__GetConnect()
		try:
			cur.executemany(sql,list)
			self.conn.commit()
		except Exception as ex:
			print(str(ex))
			self.conn.rollback()
		# finally:
		# 	self.conn.close()
	


if __name__ == '__main__':
	ms = MSSQL(host="192.168.1.16",user="sa",pwd="p@ssw0rd",db="performance_test")
	# r = ms.ExecQuery("select *from cpu")
	cpu_sql = "insert into cpu values(NEWID(),'2018-09-18 23:24:58',0,'17516','navicat.exe')"
	ms.ExecUpdate(cpu_sql)
	# print(r)