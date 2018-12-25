# l = [i for i in range(33)]
# n = 7
# # print([l[i:i+n] for i in range(0,len(l),n)])
#
# for i in range(0,len(l),n):
# 	print(l[i:i+n])


from read_ini import *
from ReadSql import view_sql,select_sql,insert_sql
from mssql import MSSQL
import datetime
import decimal
import re

DB1 = MSSQL(host1,user1,password1,datebase1)
DB2 = MSSQL(host2,user2,password2,datebase2)
view = view_sql()
SQL1 = select_sql()
SQL2 = insert_sql()



def get_name(sql):
	table_l = []
	try:
		sql_ = sql.replace('\n',' ').replace('\t','')
		sqllist = sql_.lower().split(';')
		for i in sqllist:
			l = i.split(' ')
			table_l.append(l[l.index('into')+1])
		print('获取到待迁移的表名列表:',table_l)
		return table_l
	except Exception as e:
		print('获取表名失败，异常：',str(e))
		
# print(get_name(SQL2)[1])


def get_sql(sql):
	try:
		return sql.split(';')
	except Exception as e:
		print('提取sql语句失败，原因：',str(e))

# l=get_name(SQL2)
# print(get_sql(SQL1)[1])
# print(get_sql(SQL2)[1])
#检查sql脚本是否匹配

def check_script():
	"""匹配成功返回True"""
	if len(get_sql(SQL1)) == len(get_sql(SQL2)):
		return True
	else:
		print("查询与插入的sql语句数目不匹配")


# print(tname)
#获取待迁移表的索引
def get_index(table_name):
	l = get_name(SQL2) #获取脚本中的表名
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
		
		
# get_index(tname)


def migration(get_sql,insert_sql,tn):
	"""db1为源数据库，db2目标数据库"""
	num = DB1.ExecQuery("select count(*) from "+tn)[0][0]
	print(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),'表%s需迁移数据:'%tn,num)
	Data1 = DB1.ExecQuery(get_sql)
	start = datetime.datetime.now()
	print(start.strftime("%Y-%m-%d %H:%M:%S"),"开始迁移数据，每组迁移%d"%set_size)
	j = 0
	for i in range(0,len(Data1),set_size):
		j = j+1
		set = Data1[i:i+set_size]
		DB2.ExecMany(insert_sql, set)
		print(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),'第%d组数据%d条完成迁移'%(j,len(set)))
	DB2.conn.close()
	end = datetime.datetime.now()
	print(end.strftime("%Y-%m-%d %H:%M:%S"),"完成数据迁移")
	print(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),'执行耗时：', end - start)


def transfer():
	'''根据配置文件mt的值,决定迁移方式'''
	if m_type == 1:#进行批量迁移
		if check_script():
			lenth = len(get_sql(select_sql()))
			try:
				for i in range(lenth):
					migration(get_sql(SQL1)[i], get_sql(SQL2)[i], get_name(SQL2)[i])
					print('-------------')
			except IndexError as e:
				print(str(e))
	elif m_type == 2:#指定表迁移
		try:
			for i in get_index(tname):
				print('配置表名',i)
				print(get_sql(SQL1)[i])
				print(get_sql(SQL2)[i])
				print(get_name(SQL2)[i])
				# migration(get_sql(SQL1)[i], get_sql(SQL2)[i], get_name(SQL2)[i])
				print('-------------')
		except IndexError as e:
			print(str(e))
	else:
		print('参数mt值配置有误')
		
# transfer()

# migration(get_sql(SQL1)[1], get_sql(SQL2)[1], get_name(SQL2)[1])

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

l = "PatientIndex where PIDAssigningAuthority LIKE 'local.RIS.%';"

# print(query_conditon(l))


t = select_sql()

query_conditon(t)
# print(query_conditon(t))
# print(type(t),t)