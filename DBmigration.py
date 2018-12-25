#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/9/28 14:16
# @Author  : Zhangyp
# @File    : DBmigration.py
# @Software: PyCharm
# @license : Copyright(C), eWord Technology Co., Ltd.
# @Contact : yeahcheung213@163.com
from read_ini import *
from ReadSql import view_sql,select_sql,insert_sql
from mssql import MSSQL
import datetime
import re
import decimal

DB1 = MSSQL(host1,user1,password1,datebase1)
DB2 = MSSQL(host2,user2,password2,datebase2)
view = view_sql()
SQL1 = select_sql()
SQL2 = insert_sql()


#从sql脚本获取表名
def get_name(sql):
	'''获取逻辑：去掉脚本中的tab字符，用空格替换换行符，然后用空格将字符串分割
	追到list，找到list中into元素后面的第一个元素为表名'''
	table_l = []
	try:
		sql_ = sql.replace('\n',' ').replace('\t','')
		sqllist = sql_.lower().split(';')
		for i in sqllist:
			l = i.split(' ')
			table_l.append(l[l.index('into')+1])
		# print('获取到待迁移的表名列表:',table_l)
		return table_l
	except Exception as e:
		print('获取表名失败，异常：',str(e))

#获取查询条件
def query_conditon(sql):
	"""根据脚本找到where查询条件"""
	regex = "where.*"
	table_l = []
	try:
		sql_ = sql.replace('\n', ' ').replace('\t', '')
		sqllist = sql_.lower().split(';')
		for i in sqllist:
			table_l.append(''.join(re.findall(regex,i)))
		print('获取到查询条件:', table_l)
		return table_l
	except Exception as e:
		print('获取到查询条件，异常：', str(e))
	return table_l

def get_count_name(sql):
	'''获取逻辑：去掉脚本中的tab字符，用空格替换换行符，然后用空格将字符串分割
	追加到list，找到list中into元素后面的第一个元素为表名'''
	table_l = []
	try:
		sql_ = sql.replace('\n',' ').replace('\t','')
		sqllist = sql_.lower().split(';')
		for i in sqllist:
			l = i.split(' ')
			table_l.append(l[l.index('from')+1])
		# print('获取到待迁移的表名列表:',table_l)
		return table_l
	except Exception as e:
		print('获取表名失败，异常：',str(e))

def get_sql(sql):
	try:
		return sql.split(';')
	except Exception as e:
		print('提取sql语句失败，原因：',str(e))
		
#检查sql脚本是否匹配
def check_script():
	"""匹配成功返回True"""
	if len(get_sql(SQL1)) == len(get_sql(SQL2)):
		return True
	else:
		print("查询与插入的sql语句数目不匹配")

#获取待迁移表的索引
def get_index(table_name):
	'''用于指定表名迁移'''
	l = get_name(SQL2) #获取脚本中的表名
	print('获取到sql脚本中的表名列表:', l)
	indexL = []
	try:
		nameL = table_name.lower().split(',')
		print('获取到配置文件中的表名列表:',nameL)
		for i in nameL:
			indexL.append(l.index(i))
		print('配置文件中的表名在sql脚本中的索引列表:',indexL)
		return indexL
	except Exception as e:
		print('获取表名Index，异常：',str(e))
		

#Database Migration
def migration(get_sql,insert_sql):
	"""db1为源数据库，db2目标数据库"""
	# num = DB1.ExecQuery("select count(*) from "+tn)[0][0]
	# print(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),'表%s需迁移数据:'%tn,num)
	# s = datetime.datetime.now()
	# Data1 = deal_messycode(DB1.ExecQuery(get_sql))
	Data1 = DB1.ExecQuery(get_sql)
	# e = datetime.datetime.now()
	# print('查询耗时:',(e-s))
	start = datetime.datetime.now()
	#分组插入
	print(start.strftime("%Y-%m-%d %H:%M:%S"),"开始迁移数据，每组迁移%d"%set_size)
	j = 0
	for i in range(0,len(Data1),set_size):
		j = j+1
		set = Data1[i:i+set_size]
		DB2.ExecMany(insert_sql, set)
		print(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),'第%d组数据%d条完成迁移'%(j,len(set)))
	DB2.conn.close()
	#不分组插入
	# DB2.ExecMany(insert_sql, Data1)
	# DB2.conn.close()
	end = datetime.datetime.now()
	print(end.strftime("%Y-%m-%d %H:%M:%S"),"完成数据迁移")
	print(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),'执行耗时：', end - start)
	
			
#迁移类型选择
def transfer():
	'''根据配置文件mt的值,决定迁移方式'''
	if m_type == 1:#进行批量迁移
		lenth = len(get_sql(select_sql()))
		try:
			for i in range(lenth):
				num = DB1.ExecQuery("select count(*) from " + get_count_name(SQL1)[i]+" "+query_conditon(SQL1)[i])[0][0]
				print(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), '表%s需迁移数据:' % get_count_name(SQL1)[i], num)
				migration(get_sql(SQL1)[i], get_sql(SQL2)[i])
				print('-------------')
		except IndexError as e:
			print(str(e))
	elif m_type == 2:#指定表迁移
		try:
			for i in get_index(tname):
				num = \
				DB1.ExecQuery("select count(*) from " + get_count_name(SQL1)[i] + " " + query_conditon(SQL1)[i])[0][0]
				print(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), '表%s需迁移数据:' % get_count_name(SQL1)[i], num)
				migration(get_sql(SQL1)[i], get_sql(SQL2)[i])
				print('-------------')
		except IndexError as e:
			print(str(e))
	else:
		print('参数mt值配置有误')

def create_view():
	c = DB1.ExecQuery(
		"select COUNT(*) from dbo.sysobjects where id = object_id(N'ExamResult') and OBJECTPROPERTY(id, N'IsView') = 1")[
		0][0]
	if c == 0:#判断视图ExamResult是否存在
		try:
			DB1.ExecNoQuery(view)
			print(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), '在源数据创建获取报告视图ExamResult成功')
		except Exception as e:
			print(str(e))


if __name__ == '__main__':
	create_view()
	if check_script():
		transfer()

	